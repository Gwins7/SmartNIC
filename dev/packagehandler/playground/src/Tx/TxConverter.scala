package PackageHandler.Tx

import PackageHandler.Misc._
import chisel3._
import chisel3.util._

class TxConverter extends Module{

  val io = IO(new Bundle {
    val in  = new QDMAAxisIO()
    val out = Flipped(new TxPipelineAxisIO())

    val extern_config = Input(new ExternConfig())
  })
  val true_tvalid = io.in.tvalid & !io.in.tuser

  val cur_tlen_reg = RegEnable(io.in.tdata(159,144),0.U(16.W),io.in.tvalid & io.in.tuser) // the saved packet len in h2c qdma header
  val last_beat_mty = (~(cur_tlen_reg(5,0) - 1.U)).asUInt // Mux(cur_tlen_reg(5,0) === 0.U,0.U,64.U - cur_tlen_reg(5,0))
  // tips: mty means the invalid byte num in the last beat;
  // for example, if tkeep = 0000ffff_..._ffffffff, then mty = 2.

  // extend tkeep by mty information
  val last_beat_mask = Wire(Vec(512,UInt(1.W)))
  for (i <- 0 until 512) {
    last_beat_mask(i) :=  last_beat_mty < (64-i/8).U // last_beat_tkeep(i/8)
  }

  io.out.extern_config   := io.extern_config
  io.out.tx_info         := WireDefault(0.U.asTypeOf(new TxInfo())) // Default
  // if the AES function is open, then align packet len to 16B
  io.out.tx_info.mty     := Cat(last_beat_mty(5,4),Mux(io.extern_config.op(8),0.U(4.W),last_beat_mty(3,0)))
  io.out.tvalid          := true_tvalid
  io.out.tlast           := io.in.tlast
  // handle tdata by the tkeep we cal
  io.out.tdata           := Mux(io.out.tlast,io.in.tdata & last_beat_mask.asUInt,io.in.tdata)
  io.in.tready           := io.out.tready
}