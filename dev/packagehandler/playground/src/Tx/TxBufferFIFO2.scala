package PackageHandler.Tx
import PackageHandler.Misc._
import chisel3._
import chisel3.util._


class TxBufferFIFO2 extends Module with NetFunc {
  /*
    ATTENTION:
    this Module is TxBufferFifo implemented by FifoIP
    there seems to be without any problem; but do we need to handle FifoIPs' prog_full?
   */
  val io = IO(new Bundle {
    val in = new TxPipelineAxisIO()
    val out = Flipped(new CMACAxisIO())

    val reset_counter = Input(Bool())
    val h2c_pack_counter = Output(UInt(32.W))
    val h2c_err_counter = Output(UInt(32.W))
  })

  val tx_info_fifo = Module(new BufferFifoIP_128)
  val tx_data_fifo = Module(new BufferFifoIP_512)

  tx_info_fifo.io.s_axis_aclk := clock
  tx_data_fifo.io.s_axis_aclk := clock
  tx_info_fifo.io.s_axis_aresetn := !reset.asBool
  tx_data_fifo.io.s_axis_aresetn := !reset.asBool

  val h2c_pack_counter_reg = RegInit(0.U(32.W))
  val h2c_err_counter_reg  = RegInit(0.U(32.W))

  val in_shake_hand = io.in.tvalid & io.in.tready
  val out_shake_hand = io.out.tvalid & io.out.tready

  val pkt_info = tx_info_fifo.io.m_axis.tdata.asTypeOf(new TxInfo)

  val mid_ip_chksum = Wire(UInt(32.W))
  mid_ip_chksum := chksum_cal(pkt_info.ip_chksum)
  val mid_tcp_chksum = Wire(UInt(32.W))
  mid_tcp_chksum := chksum_cal(pkt_info.tcp_chksum)

  val end_ip_chksum = Wire(UInt(16.W))
  end_ip_chksum := ~chksum_cal(mid_ip_chksum)
  val end_tcp_chksum = Wire(UInt(16.W))
  end_tcp_chksum := ~chksum_cal(mid_tcp_chksum)

  when (io.reset_counter){
    h2c_pack_counter_reg := 0.U
    h2c_err_counter_reg := 0.U
  }.otherwise{
    when (io.out.tlast){
      h2c_pack_counter_reg := h2c_pack_counter_reg + 1.U
    }
  }

  io.h2c_err_counter := h2c_err_counter_reg
  io.h2c_pack_counter := h2c_pack_counter_reg

  // in_direction

  tx_data_fifo.io.s_axis.tdata := io.in.tdata
  tx_data_fifo.io.s_axis.tvalid := in_shake_hand
  tx_data_fifo.io.s_axis.tlast := io.in.tlast & in_shake_hand

  tx_info_fifo.io.s_axis.tdata := io.in.tx_info.asUInt
  tx_info_fifo.io.s_axis.tvalid := io.in.tlast & in_shake_hand // get the last qid and tlen
  tx_info_fifo.io.s_axis.tlast  := io.in.tlast & in_shake_hand // always only 1 beat

  io.in.tready := tx_data_fifo.io.s_axis.tready & tx_info_fifo.io.s_axis.tready

  // out_direction
  tx_data_fifo.io.m_axis.tready := io.out.tready
  tx_info_fifo.io.m_axis.tready := out_shake_hand & tx_data_fifo.io.m_axis.tlast

  val out_first_beat_reg = RegEnable(io.out.tlast,true.B,out_shake_hand)

  val rev_ip_chksum = change_order_16(end_ip_chksum)
  val rev_tcp_chksum = change_order_16(end_tcp_chksum)

  io.out.tdata := Mux(out_first_beat_reg & io.in.extern_config.op(6),
    Cat(tx_data_fifo.io.m_axis.tdata(511, 416),
        Mux(change_order_16(tx_data_fifo.io.m_axis.tdata(111, 96)) === "h_0800".U && tx_data_fifo.io.m_axis.tdata(191, 184) === 6.U, rev_tcp_chksum, tx_data_fifo.io.m_axis.tdata(415, 400)),
        tx_data_fifo.io.m_axis.tdata(399, 208),
        Mux(change_order_16(tx_data_fifo.io.m_axis.tdata(111, 96)) === "h_0800".U, rev_ip_chksum, tx_data_fifo.io.m_axis.tdata(207, 192)),
        tx_data_fifo.io.m_axis.tdata(191, 0)),
        tx_data_fifo.io.m_axis.tdata)

  io.out.tvalid := tx_data_fifo.io.m_axis.tvalid & tx_info_fifo.io.m_axis.tvalid
  io.out.tlast := out_shake_hand & tx_data_fifo.io.m_axis.tlast

  val tkeep_cal = Wire(Vec(64, UInt(1.W)))
  for (i <- 0 until 64) {
    tkeep_cal(i) := pkt_info.mty < (64 - i).U
  }
  io.out.tkeep := Mux(io.out.tlast & !out_first_beat_reg, tkeep_cal.asUInt, Fill(64, 1.U(1.W)))

  io.out.tuser := 0.U
}