package PackageHandler.Tx.PipelineHandler

import PackageHandler.Misc._
import chisel3._
import chisel3.util._
// base module of RxPipelineHandler
class TxPipelineHandler extends Module with NetFunc {
  val io = IO(new Bundle {
    val in = new TxPipelineAxisIO()
    val out = Flipped(new TxPipelineAxisIO())
  })
  val in_shake_hand = io.in.tvalid & io.in.tready
  val out_shake_hand = io.out.tready & io.out.tvalid
  // save current beat's info
  val in_reg = RegEnable(Cat(io.in.tx_info.asUInt,
                             io.in.tdata,
                             io.in.tvalid,
                             io.in.tlast),1.U,in_shake_hand).asTypeOf(new TxPipelineHandlerReg)
  val first_beat_reg = RegEnable(in_reg.tlast,true.B,in_shake_hand)

  val in_reg_used_reg = RegInit(false.B)
  when (in_shake_hand){
    in_reg_used_reg := true.B
  }.elsewhen(out_shake_hand){
    in_reg_used_reg := false.B
  }

  io.in.tready  := WireDefault(io.out.tready | !in_reg_used_reg)
  io.out.tdata  := WireDefault(in_reg.tdata)
  io.out.tvalid := WireDefault(in_reg.tvalid & in_reg_used_reg)
  io.out.tlast  := WireDefault(in_reg.tlast)
  io.out.tx_info := WireDefault(io.in.tx_info)
  io.out.extern_config := WireDefault(io.in.extern_config)
}

