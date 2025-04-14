package PackageHandler.Misc

import chisel3._
import chisel3.util._

trait NetFunc {
  def change_order_16 (i: UInt): UInt = {
    Cat(i(7,0),i(15,8))
  }
  def change_order_32 (i: UInt): UInt = {
    Cat(i(7,0),i(15,8),i(23,16),i(31,24))
  }
  def chksum_cal(i: UInt): UInt ={
    Cat(0.U(16.W),i(31,16)) + Cat(0.U(16.W),i(15,0))
//    Mux(i(31,16) > 0.U,
//      i(31,16) + i(15,0), i(15,0))
  }
}


class ReduceOpSync (vecnum: Int, width: Int) extends Module {
  // we need to wait 1 beat to get the result;
  // we cut vec in half and cal it in reduce tree
  val io = IO(new Bundle {
    val in_vec = Input(Vec(vecnum,UInt(width.W)))
    val out_sum = Output(UInt(width.W))
  })

  val vecnum_align_pow2 = Math.pow(2,log2Ceil(vecnum)).toInt

  val pipeline_cut_num = Math.pow(2,(log2Ceil(vecnum_align_pow2)+1)/2).toInt
  //to optimize route timing, we want (vecnum_align_pow2/2) to get ceil value in not-int (e.g.5/2) condition

  val vec_per_cut = vecnum_align_pow2 / pipeline_cut_num
  val cal_vec = Wire(Vec(pipeline_cut_num, Vec(vec_per_cut,UInt(width.W))))
  val cal_reg = Reg(Vec(pipeline_cut_num, UInt(width.W)))

  var k = 0;
    for (i <- 0 until pipeline_cut_num)
      for (j <- 0 until vec_per_cut){
      if (k < vecnum) {
        cal_vec(i)(j) := io.in_vec(k)
        k = k + 1
      }
      else cal_vec(i)(j) := 0.U
    }
}

class ReduceAddSync (vecnum: Int, width: Int) extends ReduceOpSync(vecnum, width) {
  for (i <- 0 until pipeline_cut_num) {
    cal_reg(i) := cal_vec(i).reduceTree(_+_)
  }
  io.out_sum := cal_reg.reduceTree(_+_)
}

class ReduceOrSync (vecnum: Int, width: Int) extends ReduceOpSync(vecnum, width) {
  for (i <- 0 until pipeline_cut_num) {
    cal_reg(i) := cal_vec(i).reduceTree(_|_)
  }
  io.out_sum := cal_reg.reduceTree(_|_)
}

class ReduceXorSync (vecnum: Int, width: Int) extends ReduceOpSync(vecnum, width) {
  for (i <- 0 until pipeline_cut_num) {
    cal_reg(i) := cal_vec(i).reduceTree(_^_)
  }
  io.out_sum := cal_reg.reduceTree(_^_)
}

