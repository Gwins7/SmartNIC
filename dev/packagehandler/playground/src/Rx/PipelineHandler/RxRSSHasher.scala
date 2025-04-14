package PackageHandler.Rx.PipelineHandler

import PackageHandler.Misc._
import chisel3._
import chisel3.util._
class RxRSSHasher extends RxPipelineHandler {
  // arg(0)~arg(3): hash_seed; arg(4)~arg(5): jump_table
  val hash_key = Cat(io.in.extern_config.arg(0),
    io.in.extern_config.arg(1),
    io.in.extern_config.arg(2),
    io.in.extern_config.arg(3))
  // symmetric: hash_key = Fill(20,"h_6d5a".U)

  val cal_tdata = Mux(in_shake_hand,io.in.tdata,in_reg.tdata)
  val src_ip   = change_order_32(cal_tdata(239,208))
  val dst_ip   = change_order_32(cal_tdata(271,240))
  val src_port = change_order_16(cal_tdata(287,272))
  val dst_port = change_order_16(cal_tdata(303,288))
  val info = Cat(src_ip,dst_ip,src_port,dst_port) // 96 bits

  // calculate by Toeplitz Algorithm
  val cal_hash_key_vec = Wire(Vec(96,UInt(32.W)))
  for (i <- 0 until 96) {
    cal_hash_key_vec(i) := Mux(info(i),hash_key(i+32,i+1),0.U)
  }
  val hash_xor_sync = Module(new ReduceXorSync(96,32))
  val hash_xor_result = Wire(UInt(32.W))
  for (i <- 0 until 96) {
    hash_xor_sync.io.in_vec(i) := cal_hash_key_vec(i)
  }
  hash_xor_result := hash_xor_sync.io.out_sum

  // use jump table to handle the RSS result
  // we limit the hash_result and the actual rx_queue number in 16 (0~15), so jump-target's width for every hash_result is 4.
  // if you want to extend it, you just need to extend the length of jump_table and jump-target's width for every hash_result
  val jump_table = Cat(io.in.extern_config.arg(4),
    io.in.extern_config.arg(5))
  val jump_offset = hash_xor_result(3,0) << 2.U
  val cal_qid = (jump_table << jump_offset)(63,60)

  //  save the qid calculated in first beat and use it for whole packet
  val cur_packet_qid_reg = RegEnable(cal_qid,0.U,in_shake_hand & first_beat_reg)
  when (io.in.extern_config.op(5)){
    io.out.rx_info.qid := Mux(first_beat_reg,cal_qid,cur_packet_qid_reg)
  }
}
