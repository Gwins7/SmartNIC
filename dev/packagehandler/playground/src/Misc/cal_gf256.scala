package PackageHandler.Misc

import chisel3._
import chisel3.util._

// used in AES function

trait cal_gf256 {
  // https://blog.csdn.net/qq_28205153/article/details/55798628
  def s_substitute(lin:UInt,col:UInt):UInt = {
    val s_box = Wire(Vec(16,UInt(128.W))) // Vec(16,Vec(16,UInt(8.W)))
    s_box(0)  := "h_76abd7fe_2b670130_c56f6bf2_7b777c63".U
    s_box(1)  := "h_c072a49c_afa2d4ad_f04759fa_7dc982ca".U
    s_box(2)  := "h_1531d871_f1e5a534_ccf73f36_2693fdb7".U
    s_box(3)  := "h_75b227eb_e2801207_9a059618_c323c704".U
    s_box(4)  := "h_842fe329_b3d63b52_a05a6e1b_1a2c8309".U
    s_box(5)  := "h_cf584c4a_39becb6a_5bb1fc20_ed00d153".U
    s_box(6)  := "h_a89f3c50_7f02f945_85334d43_fbaaefd0".U
    s_box(7)  := "h_d2f3ff10_21dab6bc_f5389d92_8f40a351".U
    s_box(8)  := "h_73195d64_3d7ea7c4_1744975f_ec130ccd".U
    s_box(9)  := "h_db0b5ede_14b8ee46_88902a22_dc4f8160".U
    s_box(10) := "h_79e49591_62acd3c2_5c240649_0a3a32e0".U
    s_box(11) := "h_08ae7a65_eaf4566c_a94ed58d_6d37c8e7".U
    s_box(12) := "h_8a8bbd4b_1f74dde8_c6b4a61c_2e2578ba".U
    s_box(13) := "h_9e1dc186_b9573561_0ef60348_66b53e70".U
    s_box(14) := "h_df2855ce_e9871e9b_948ed969_1198f8e1".U
    s_box(15) := "h_16bb54b0_0f2d9941_6842e6bf_0d89a18c".U

    (s_box(lin) >> (col << 3.U))(7,0)
  }

  def rev_s_substitute(lin:UInt,col:UInt):UInt ={
    val rev_s_box = Wire(Vec(16,UInt(128.W)))
    rev_s_box(0)  := "h_fbd7f381_9ea340bf_38a53630_d56a0952".U
    rev_s_box(1)  := "h_cbe9dec4_44438e34_87ff2f9b_8239e37c".U
    rev_s_box(2)  := "h_4ec3fa42_0b954cee_3d23c2a6_32947b54".U
    rev_s_box(3)  := "h_25d18b6d_49a25b76_b224d928_66a12e08".U
    rev_s_box(4)  := "h_92b6655d_cc5ca4d4_16986886_64f6f872".U
    rev_s_box(5)  := "h_849d8da7_5746155e_dab9edfd_5048706c".U
    rev_s_box(6)  := "h_0645b3b8_0558e4f7_0ad3bc8c_00abd890".U
    rev_s_box(7)  := "h_6b8a1301_03bdafc1_020f3fca_8f1e2cd0".U
    rev_s_box(8)  := "h_73e6b4f0_cecff297_eadc674f_4111913a".U
    rev_s_box(9)  := "h_6edf751c_e837f9e2_8535ade7_2274ac96".U
    rev_s_box(10) := "h_1bbe18aa_0e62b76f_89c5291d_711af147".U
    rev_s_box(11) := "h_f45acd78_fec0db9a_2079d2c6_4b3e56fc".U
    rev_s_box(12) := "h_5fec8027_591012b1_31c70788_33a8dd1f".U
    rev_s_box(13) := "h_ef9cc993_9f7ae52d_0d4ab519_a97f5160".U
    rev_s_box(14) := "h_61995383_3cbbebc8_b0f52aae_4d3be0a0".U
    rev_s_box(15) := "h_7d0c2155_631469e1_26d677ba_7e042b17".U

    (rev_s_box(lin) >> (col << 3.U))(7,0)
  }

  def move_bit_128(src:UInt): UInt = {
    Cat(
      Cat(src(95,88),src(55,48),src(15,8),src(103,96)),  //   11, 6, 1,12
      Cat(src(63,56),src(23,16),src(111,104),src(71,64)), //   7, 2,13, 8
      Cat(src(31,24),src(119,112),src(79,72),src(39,32)), //   3,14, 9, 4
      Cat(src(127,120),src(87,80),src(47,40),src(7,0))  //    15,10, 5, 0
    )
  }

  def rev_move_bit_128(src:UInt): UInt = {
    Cat(
      Cat(src(31,24),src(55,48),src(79,72),src(103,96)), //   3, 6, 9,12
      Cat(src(127,120),src(23,16),src(47,40),src(71,64)), // 15, 2, 5, 8
      Cat(src(95,88),src(119,112),src(15,8),src(39,32)),  // 11,14, 1, 4
      Cat(src(63,56),src(87,80),src(111,104),src(7,0))  //    7,10,13, 0
    )
  }

  def mul_8bit (src:UInt,mul_time:Int):UInt = {
    mul_time match{
      case 1 =>  src
      case 2 =>  Mux(src(7).asBool,Cat(src(6,0),0.U(1.W)) ^ "b_00011011".U,Cat(src(6,0),0.U(1.W)))
      case 3 =>  mul_8bit(src,2) ^ mul_8bit(src,1)
      case 4 =>  mul_8bit(mul_8bit(src,2),2)
      case 5 =>  mul_8bit(src,4) ^ mul_8bit(src,1)
      case 6 =>  mul_8bit(src,4) ^ mul_8bit(src,2)
      case 7 =>  mul_8bit(src,4) ^ mul_8bit(src,2) ^ mul_8bit(src,1)
      case 8 =>  mul_8bit(mul_8bit(mul_8bit(src,2),2),2)
      case 9 =>  mul_8bit(src,8) ^ mul_8bit(src,1)
      case 10 => mul_8bit(src,8) ^ mul_8bit(src,2)
      case 11 => mul_8bit(src,8) ^ mul_8bit(src,2) ^ mul_8bit(src,1)
      case 12 => mul_8bit(src,8) ^ mul_8bit(src,4)
      case 13 => mul_8bit(src,8) ^ mul_8bit(src,4) ^ mul_8bit(src,1)
      case 14 => mul_8bit(src,8) ^ mul_8bit(src,4) ^ mul_8bit(src,2)
      case 15 => mul_8bit(src,8) ^ mul_8bit(src,4) ^ mul_8bit(src,2)  ^ mul_8bit(src,1)
      case _  => 0.U
    }
  }
  def get_matrix_val(src:UInt,lin:Int,col:Int): UInt ={
    (src >> (((col << 2) + lin) << 3))(7,0)
  }

  def matrix_mul_result(src:UInt,lin:Int,col:Int): UInt ={
    lin match {
      //2 3 1 1
      case 0 => mul_8bit(get_matrix_val(src,0,col),2) ^ mul_8bit(get_matrix_val(src,1,col),3) ^
        mul_8bit(get_matrix_val(src,2,col),1) ^ mul_8bit(get_matrix_val(src,3,col),1)
      //1 2 3 1
      case 1 => mul_8bit(get_matrix_val(src,0,col),1) ^ mul_8bit(get_matrix_val(src,1,col),2) ^
        mul_8bit(get_matrix_val(src,2,col),3) ^ mul_8bit(get_matrix_val(src,3,col),1)
      //1 1 2 3
      case 2 => mul_8bit(get_matrix_val(src,0,col),1) ^ mul_8bit(get_matrix_val(src,1,col),1) ^
        mul_8bit(get_matrix_val(src,2,col),2) ^ mul_8bit(get_matrix_val(src,3,col),3)
      //3 1 1 2
      case 3 => mul_8bit(get_matrix_val(src,0,col),3) ^ mul_8bit(get_matrix_val(src,1,col),1) ^
        mul_8bit(get_matrix_val(src,2,col),1) ^ mul_8bit(get_matrix_val(src,3,col),2)
      case _ => 0.U
    }
  }

  def rev_matrix_mul_result(src:UInt,lin:Int,col:Int): UInt ={
    lin match {
      //e b d 9
      case 0 => mul_8bit(get_matrix_val(src,0,col),14) ^ mul_8bit(get_matrix_val(src,1,col),11) ^
        mul_8bit(get_matrix_val(src,2,col),13) ^ mul_8bit(get_matrix_val(src,3,col), 9)
      //9 e b d
      case 1 => mul_8bit(get_matrix_val(src,0,col), 9) ^ mul_8bit(get_matrix_val(src,1,col),14) ^
        mul_8bit(get_matrix_val(src,2,col),11) ^ mul_8bit(get_matrix_val(src,3,col),13)
      //d 9 e b
      case 2 => mul_8bit(get_matrix_val(src,0,col),13) ^ mul_8bit(get_matrix_val(src,1,col), 9) ^
        mul_8bit(get_matrix_val(src,2,col),14) ^ mul_8bit(get_matrix_val(src,3,col),11)
      //b d 9 e
      case 3 => mul_8bit(get_matrix_val(src,0,col),11) ^ mul_8bit(get_matrix_val(src,1,col),13) ^
        mul_8bit(get_matrix_val(src,2,col), 9) ^ mul_8bit(get_matrix_val(src,3,col),14)
      case _ => 0.U
    }
  }
  def get_round_con (src:UInt): UInt ={
    Mux(src<=8.U,(1.U << (src-1.U)).asUInt,Mux(src===9.U,"h_0000001b".U,"h_00000036".U))
  }
  def get_next_key(cur_key:UInt,round:UInt): UInt ={
    val next_key = Wire(Vec(4,UInt(32.W)))//127:96
    next_key(0) := cur_key(31,0) ^ Cat(
      s_substitute(cur_key(103,100),cur_key( 99, 96)), //0, 103:96
      s_substitute(cur_key(127,124),cur_key(123,120)), //3, 127:120
      s_substitute(cur_key(119,116),cur_key(115,112)), //2, 119:112
      s_substitute(cur_key(111,108),cur_key(107,104))  //1, 111:104
      ) ^ get_round_con(round)
    next_key(1) := cur_key(63,32) ^ next_key(0)
    next_key(2) := cur_key(95,64) ^ next_key(1)
    next_key(3) := cur_key(127,96) ^ next_key(2)
    next_key.asUInt
  }
}
