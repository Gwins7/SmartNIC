package PackageHandler.Rx.PipelineHandler

import PackageHandler.Misc.NetFunc
import chisel3._
// FSM

class RxRESearcher(val step: Int = 1) extends RxPipelineHandler with NetFunc {
  // there is no speed restriction, the first goal is 2*32

  class REHandlerUnit extends Module {
    // check 1 byte jump
    val io = IO(new Bundle {
      val in_char = Input(UInt(8.W))
      val in_state = Input(UInt(4.W))
      val in_rule = Input(Vec(16,UInt(32.W)))
      // DFA rule is in the document
      val out_state = Output(UInt(4.W))
    })
    val result = WireDefault(0.U.asTypeOf(Vec(16,UInt(4.W))))
    for (i <- 0 until 16){
      // only one rule per situation is OK
      // we don't need to implement AND because we only get 1 input char
      val char_1_or_2_cmp = (io.in_char === io.in_rule(i)(7,0)) | (io.in_char === io.in_rule(i)(15,8))
      val char_1_to_2_cmp = (io.in_char >= io.in_rule(i)(7,0)) & (io.in_char <= io.in_rule(i)(15,8))
      val cmp_result = Mux(io.in_rule(i)(16),char_1_to_2_cmp,char_1_or_2_cmp)
      val match_ok   = Mux(io.in_rule(i)(17),!cmp_result,cmp_result)

      when ((io.in_state === io.in_rule(i)(27,24)) & match_ok){
        result(i) := io.in_rule(i)(31,28)
      }
    }
    // 0 is Q_start, F is Q_Accept
    io.out_state := Mux(io.in_state === 15.U,15.U,result.reduceTree(_|_))
  }

  class REHandler(val step: Int = 1) extends Module {
    // check *length* byte(s) jump
    val io = IO(new Bundle {
      val in_char = Input(UInt((8*step).W))
      val in_state = Input(UInt(4.W))
      val in_rule = Input(Vec(16,UInt(32.W)))
      val in_en = Input(Bool())
      val out_state = Output(UInt(4.W))
    })
    val re_handler_unit_queue = Seq.fill(step)(Module(new REHandlerUnit))
    val part_result_reg = RegInit(0.U(4.W))

    for (i <- 0 until step){
      re_handler_unit_queue(i).io.in_char := io.in_char(i*8+7,i*8)
      re_handler_unit_queue(i).io.in_rule := io.in_rule
      if (i == 0) re_handler_unit_queue(i).io.in_state := io.in_state
      else re_handler_unit_queue(i).io.in_state := re_handler_unit_queue(i-1).io.out_state
    }
    // temp save, sync
    when (io.in_en) {
      part_result_reg := re_handler_unit_queue(step-1).io.out_state
    }
    io.out_state := part_result_reg
  }

  assume(64%step==0)
  val handler_num = 64/step

  val beat_counter_reg = RegInit(0.U(8.W)) // we have arrived which beat in current process
  val match_wait_reg = RegInit(false.B) // all the reg must wait 1 beat to start function (because we only process in_reg)

  val cur_beat_done = (beat_counter_reg === (handler_num-1).U)
  val input_rule = io.in.extern_config.arg

  val data_vec = Wire(Vec(handler_num,UInt((step*8).W)))
  for (i <- 0 until handler_num) {
    data_vec(i) := in_reg.tdata((8*step)*i+(8*step-1),(8*step)*i)
  }
  val input_data = Mux(cur_beat_done | !match_wait_reg, data_vec(beat_counter_reg),data_vec(beat_counter_reg+1.U))

  val re_handler = Module(new REHandler(step))

  val match_found = (re_handler.io.out_state === 15.U)

  val cur_state = Mux((first_beat_reg & !match_wait_reg) | (in_shake_hand & in_reg.tlast),0.U,re_handler.io.out_state)
  // (first_beat_reg & !match_wait_reg) because pkt1's tail and pkt2's head shouldn't mix together
  // in_shake_hand & tlast because we want to clear out_state reg

  re_handler.io.in_rule := input_rule
  re_handler.io.in_char := input_data
  re_handler.io.in_state := cur_state
  re_handler.io.in_en := !cur_beat_done | (in_shake_hand & in_reg.tlast) //not last byte in beat, or last beat

  when(in_shake_hand) {
    beat_counter_reg := 0.U
    when(in_reg.tlast) {
      match_wait_reg := false.B
    }.otherwise{
      match_wait_reg := match_found // if we have already found, then we don't need to wait anymore
    }
  }.elsewhen(!match_wait_reg) {
    match_wait_reg := true.B
  }.elsewhen(beat_counter_reg < (handler_num - 1).U) {
    beat_counter_reg := beat_counter_reg + 1.U
  }

  when (io.in.extern_config.op(7)){
    io.out.rx_info.qid := Mux(match_found,1.U,in_reg.rx_info.qid)
    io.in.tready := out_shake_hand | !in_reg_used_reg
    io.out.tvalid := in_reg.tvalid & in_reg_used_reg & (cur_beat_done | match_found)
  }
}
