package PackageHandler.Misc

import chisel3._
import chisel3.util._

/*
  this module is used to manage software(DPDK)-configured
  mask register and output its decimal value in Round-Robin(RR) strategy
  now we use it in qid mask and port_id mask configuration
 */

class SoftwareRegWrapper(width: Int) extends Module {
  val io = IO(new Bundle {
    val in_mask = Input(UInt(width.W))
    val in_tlast = Input(Bool())
    val out_dec = Output(UInt(unsignedBitLength(width).W))
  })
  val sav_mask_reg = RegInit(io.in_mask)
  val cur_mask_reg = RegInit(io.in_mask)

  val next_mask = Wire(UInt(width.W))
  val arbitDecoder = Module(new LSBArbitDecoder(width))

  next_mask := (cur_mask_reg & (~(1.U(width.W) << io.out_dec)).asUInt)
  arbitDecoder.io.in_mask := cur_mask_reg

  when((sav_mask_reg =/= io.in_mask).asBool) {
    cur_mask_reg := io.in_mask
    sav_mask_reg := io.in_mask
  }
    .elsewhen(io.in_tlast) {
      when (next_mask === 0.U) {
        cur_mask_reg := sav_mask_reg
      }
        .otherwise {
          cur_mask_reg := next_mask
        }
    }

  io.out_dec := arbitDecoder.io.out_dec
}

/*
  input: a mask
  output: the LSB's decimal val
 */
class LSBArbitDecoder(width: Int) extends Module {
  val io = IO(new Bundle {
    val in_mask = Input(UInt(width.W))
    val out_dec = Output(UInt(unsignedBitLength(width).W))
  })

  val grant = VecInit(Seq.fill(width)(false.B))
  val notgranted = VecInit(Seq.fill(width)(false.B))

  grant(0) := io.in_mask(0)
  notgranted(0) := !grant(0)
  for (i <- 1 until width) {
    grant(i) := notgranted(i-1) & io.in_mask(i)
    notgranted(i) := notgranted(i-1) & !io.in_mask(i)
  }

  val resfun = grant.zipWithIndex.map((x) => (x._1,x._2.U))
    .reduce((x,y) => (Mux(y._1 === true.B,y._1,x._1),Mux(y._1 === true.B,y._2,x._2)))
  io.out_dec := resfun._2.asUInt
}
