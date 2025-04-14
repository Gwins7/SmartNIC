package PackageHandler.Rx
import PackageHandler.Misc._
import chisel3._


class RxBufferFIFO2 extends Module with NetFunc {
  /*
    ATTENTION:
    this Module is RxBufferFifo implemented by FifoIP;
    but, the function still have some problem: it may cause QDMA deadlock when receive using RSS
    the reason is still unknown
   */
  val io = IO(new Bundle {
    val in  = new RxPipelineAxisIO()
    val out = Flipped(new QDMAAxisIO())

    val out_qid = Output(UInt(6.W))
    val out_tlen = Output(UInt(16.W))

    val reset_counter    = Input(Bool())
    val c2h_pack_counter = Output(UInt(32.W))
    val c2h_err_counter  = Output(UInt(32.W))
  })

  val rx_info_fifo = Module(new BufferFifoIP_128)
  val rx_data_fifo = Module(new BufferFifoIP_512)

  rx_info_fifo.io.s_axis_aclk := clock
  rx_data_fifo.io.s_axis_aclk := clock
  rx_info_fifo.io.s_axis_aresetn := !reset.asBool
  rx_data_fifo.io.s_axis_aresetn := !reset.asBool

  val c2h_pack_counter_reg = RegInit(0.U(32.W))
  val c2h_err_counter_reg  = RegInit(0.U(32.W))//unused
  val wrong_chksum_counter = RegInit(0.U(32.W))

  val in_shake_hand = io.in.tvalid & io.in.tready
  val out_shake_hand = io.out.tvalid & io.out.tready

  val pkt_info = rx_info_fifo.io.m_axis.tdata.asTypeOf(new RxInfo)

  val mid_ip_chksum = Wire(UInt(32.W))
  mid_ip_chksum := chksum_cal(pkt_info.ip_chksum)
  val mid_tcp_chksum = Wire(UInt(32.W))
  mid_tcp_chksum := chksum_cal(pkt_info.tcp_chksum)

  val end_ip_chksum = Wire(UInt(16.W))
  end_ip_chksum := ~chksum_cal(mid_ip_chksum)
  val end_tcp_chksum = Wire(UInt(16.W))
  end_tcp_chksum := ~chksum_cal(mid_tcp_chksum)

  def chksum_pass: Bool = {
    !io.in.extern_config.op(6) ||
      !(change_order_16(rx_data_fifo.io.m_axis.tdata(111, 96)) === "h_0800".U) ||
      end_ip_chksum === 0.U && (!(rx_data_fifo.io.m_axis.tdata(191, 184) === 6.U) || end_tcp_chksum === 0.U)
  }

  val true_in_shake_hand = io.in.tvalid & io.in.tready & !io.in.tuser

  when (io.reset_counter){
    c2h_pack_counter_reg := 0.U
    c2h_err_counter_reg := 0.U
    wrong_chksum_counter := 0.U
  }.otherwise{
    when (in_shake_hand & io.in.tuser) {
      c2h_err_counter_reg := c2h_err_counter_reg + 1.U
    }
    when (io.out.tlast){
      c2h_pack_counter_reg := c2h_pack_counter_reg + 1.U
      when (!chksum_pass) {
        wrong_chksum_counter := wrong_chksum_counter + 1.U
      }
    }
  }

  io.c2h_err_counter := wrong_chksum_counter + c2h_err_counter_reg
  io.c2h_pack_counter := c2h_pack_counter_reg

// in_direction
  rx_data_fifo.io.s_axis.tdata := io.in.tdata
  rx_data_fifo.io.s_axis.tvalid := true_in_shake_hand
  rx_data_fifo.io.s_axis.tlast := io.in.tlast & true_in_shake_hand

  rx_info_fifo.io.s_axis.tdata := io.in.rx_info.asUInt
  rx_info_fifo.io.s_axis.tvalid := io.in.tlast & true_in_shake_hand // get the last qid and tlen
  rx_info_fifo.io.s_axis.tlast  := io.in.tlast & true_in_shake_hand // always only 1 beat

  io.in.tready := rx_data_fifo.io.s_axis.tready & rx_info_fifo.io.s_axis.tready

// out_direction
  rx_data_fifo.io.m_axis.tready := io.out.tready
  rx_info_fifo.io.m_axis.tready := out_shake_hand & rx_data_fifo.io.m_axis.tlast // the info can be thrown when tlast has transmitted

  io.out.tdata := rx_data_fifo.io.m_axis.tdata
  io.out.tvalid := rx_data_fifo.io.m_axis.tvalid & rx_info_fifo.io.m_axis.tvalid
  io.out.tlast := out_shake_hand & rx_data_fifo.io.m_axis.tlast

  io.out_qid  := pkt_info.qid
  io.out_tlen := pkt_info.tlen
  io.out.tuser := 0.U
}