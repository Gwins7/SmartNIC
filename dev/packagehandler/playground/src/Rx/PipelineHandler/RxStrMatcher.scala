package PackageHandler.Rx.PipelineHandler

import chisel3._
import chisel3.util._

// match function
class RxStrMatcher extends RxPipelineHandler {
  // arg0: content; arg1: mask; arg2: place
  def compare(op:UInt,mask:UInt,src1:UInt,src2:UInt):UInt = {
    val a = src1 & mask
    val b = src2 & mask
    (op(0) & (a === b)) | (op(1) & (a > b)) | (op(2) & (a < b)) | (!op(0) & !op(1) & !op(2) & (a =/= b))
  }

  val match_op      = io.in.extern_config.op
  val match_content = io.in.extern_config.arg(0)
  val match_mask    = io.in.extern_config.arg(1)
  val match_place   = io.in.extern_config.arg(2) // start from 0

  val match_found = WireDefault(false.B)
  val match_found_reg = RegInit(false.B)
  val match_continue_reg = RegInit(false.B)

  val previous_tdata_reg = RegInit(0.U(32.W)) // we need this to handle over-beat match

  // the byte position of this beat's last byte in the whole packet
  val cur_place = Mux(io.in.rx_info.tlen(5,0) === 0.U,io.in.rx_info.tlen,Cat(io.in.rx_info.tlen(15,6)+1.U,0.U(6.W)))
  // ceil align 64; we assume that the padding 0 in the last beat won't interfere matching process
  val cur_place_reg = RegEnable(cur_place,0.U,in_shake_hand)

  // the match place in current beat (if it is in)
  val in_beat_place = match_place - (cur_place_reg - 64.U)
  // the match content in current beat (if it is in)
  val in_beat_content = (in_reg.tdata >> (in_beat_place << 3.U))(31,0)
  when (in_shake_hand) {
    when (match_continue_reg) {
      // partly matched before
      match_continue_reg := false.B
      match_found := compare(match_op(2,0),match_mask,change_order_32(previous_tdata_reg),match_content)

    }.elsewhen (match_place >= cur_place_reg - 64.U) {
      // start in current beat
      when (match_place <= cur_place_reg - 4.U) {
        // totally in current beat
        match_found := compare(match_op(2,0),match_mask,change_order_32(in_beat_content),match_content)

      }.elsewhen (match_place < cur_place_reg && !in_reg.tlast) {
        // between current beat and next beat
        match_continue_reg := true.B
        previous_tdata_reg :=
          (Fill(32,!in_beat_place(1) &  in_beat_place(0)) & Cat(io.in.tdata(7,0), in_reg.tdata(511,488)))  | // 61,62,63,0
          (Fill(32, in_beat_place(1) & !in_beat_place(0)) & Cat(io.in.tdata(15,0),in_reg.tdata(511,496)))  | // 62,63, 0,1
          (Fill(32, in_beat_place(1) &  in_beat_place(0)) & Cat(io.in.tdata(23,0),in_reg.tdata(511,504)))    // 63, 0, 1,2
      }
    }
    // found result
    when(in_reg.tlast) {
      match_found_reg := false.B
    }.elsewhen(!match_found_reg) {
      match_found_reg := match_found
    }
  }
  when (match_op(3)) {
    io.out.rx_info.qid := Mux(match_found_reg | match_found,1.U,in_reg.rx_info.qid)
  }
}
