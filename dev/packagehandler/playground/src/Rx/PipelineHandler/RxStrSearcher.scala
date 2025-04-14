package PackageHandler.Rx.PipelineHandler

import PackageHandler.Misc._
import chisel3._
import chisel3.util._

// search function
class RxStrSearcher extends RxPipelineHandler {
  // arg0: content; arg1: mask
  // almost the same as RxStrMatcher

  val search_op      = Mux(in_shake_hand,io.in.extern_config.op,io.in.extern_config.op)
  val search_content = Mux(in_shake_hand,io.in.extern_config.arg(0),io.in.extern_config.arg(0))
  val search_mask    = Mux(in_shake_hand,io.in.extern_config.arg(1),io.in.extern_config.arg(1))

  val search_value = search_content & search_mask

  def search (src:UInt): Bool = {
    (change_order_32(src) & search_mask) === search_value
  }

  val previous_tdata_reg = RegInit(0.U(24.W))
  val cal_tdata = Mux(in_shake_hand,io.in.tdata,in_reg.tdata)

  val search_vec = Wire(Vec(64,Bool()))
  for (i <- 0 until 61) {
    search_vec(i) := search(cal_tdata(8*i+31,8*i))
  }
  search_vec(61) := Mux(Mux(in_shake_hand,in_reg.tlast,first_beat_reg),0.U,search(Mux(in_shake_hand,Cat(io.in.tdata( 7,0),in_reg.tdata(511,488)),Cat(in_reg.tdata( 7,0),previous_tdata_reg(23, 0)))))
  search_vec(62) := Mux(Mux(in_shake_hand,in_reg.tlast,first_beat_reg),0.U,search(Mux(in_shake_hand,Cat(io.in.tdata(15,0),in_reg.tdata(511,496)),Cat(in_reg.tdata(15,0),previous_tdata_reg(23, 8)))))
  search_vec(63) := Mux(Mux(in_shake_hand,in_reg.tlast,first_beat_reg),0.U,search(Mux(in_shake_hand,Cat(io.in.tdata(23,0),in_reg.tdata(511,504)),Cat(in_reg.tdata(23,0),previous_tdata_reg(23,16)))))

  val search_or_sync = Module(new ReduceOrSync(64,1))
  val search_or_result = Wire(Bool())
  for (i <- 0 until 64) {
    search_or_sync.io.in_vec(i) := search_vec(i)
  }
  search_or_result := search_or_sync.io.out_sum

  val search_found_reg = RegInit(false.B)
  when (in_shake_hand) {
    previous_tdata_reg := in_reg.tdata(511,488) // 63,62,61
    when (in_reg.tlast) {
      search_found_reg := false.B
    }.elsewhen (!search_found_reg) {
      search_found_reg := search_or_result
    }
  }

  when (search_op(4)) {
    io.out.rx_info.qid := Mux(search_found_reg | search_or_result,1.U,in_reg.rx_info.qid)
  }
}