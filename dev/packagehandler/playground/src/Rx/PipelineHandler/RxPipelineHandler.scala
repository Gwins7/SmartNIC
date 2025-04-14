package PackageHandler.Rx.PipelineHandler

import PackageHandler.Misc._
import chisel3._
import chisel3.util._

// base module of RxPipelineHandler
class RxPipelineHandler extends Module with NetFunc{
  val io = IO(new Bundle {
    val in = new RxPipelineAxisIO()
    val out = Flipped(new RxPipelineAxisIO())
  })
  val in_shake_hand  = io.in.tready  & io.in.tvalid
  val out_shake_hand = io.out.tready & io.out.tvalid

  // save current beat's info
  val in_reg = RegEnable(Cat(io.in.rx_info.asUInt,
                             io.in.tuser,
                             io.in.tdata,
                             io.in.tvalid,
                             io.in.tlast),1.U,in_shake_hand).asTypeOf(new RxPipelineHandlerReg)

  val first_beat_reg = RegEnable(in_reg.tlast,true.B,in_shake_hand) // current beat is the first beat

  val in_reg_used_reg = RegInit(false.B)
  when (in_shake_hand){
    in_reg_used_reg := true.B
  }.elsewhen(out_shake_hand){
    in_reg_used_reg := false.B
  }

  io.out.tuser   := WireDefault(in_reg.tuser)
  io.out.tdata   := WireDefault(in_reg.tdata)
  io.out.tvalid  := WireDefault(in_reg.tvalid & in_reg_used_reg)
  io.out.tlast   := WireDefault(in_reg.tlast)
  io.out.rx_info := WireDefault(in_reg.rx_info)
  io.in.tready   := WireDefault(io.out.tready | !in_reg_used_reg)
  io.out.extern_config := WireDefault(io.in.extern_config)
}

// 8 bit op:
// op = 00000000: do nothing
// op(3) : RxStrMatcher -> op(2,0): function(<(100),>(010),=(001),!=(000), expr like >=(011) is available)
// op(4) : RxStrSearcher
// op(5) : RxRSSHasher
// op(6) : TxChksumGenerator / RxChksumVerifier (cal in Pipeline, insert in BufferFIFO)
// op(7) : RxRESearcher
// op(8) : TxAESEncrypter / RxAESDecrypter
//
// notice:
// we eventually use qid calculated in the last beat