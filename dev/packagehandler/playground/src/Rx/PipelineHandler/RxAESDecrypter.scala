package PackageHandler.Rx.PipelineHandler

import PackageHandler.Misc._
import chisel3._
import chisel3.util._

// symmetric to TxAESEncryter

class RxAESDecrypter extends RxPipelineHandler with cal_gf256 {

    val aes_key_reg = Reg(Vec(11, UInt(128.W))) //save aes key

    def rev_key_encode(tdata: UInt, round_time: UInt): UInt = {
        tdata ^ Fill(4, aes_key_reg(round_time))
    }

    def rev_byte_change(tdata: UInt): UInt = {
        val trans_tdata = Wire(Vec(64, UInt(8.W)))
        for (i <- 0 until 64) {
            trans_tdata(i) := rev_s_substitute(tdata(i * 8 + 7, i * 8 + 4), tdata(i * 8 + 3, i * 8))
        }
        trans_tdata.asUInt
    }

    def rev_bit_move(tdata: UInt): UInt = {
        val trans_tdata = Wire(Vec(4, UInt(128.W)))
        for (i <- 0 until 4) {
            trans_tdata(i) := rev_move_bit_128(tdata(128 * i + 127, 128 * i))
        }
        trans_tdata.asUInt
    }

    def rev_matrix_multiply(tdata: UInt): UInt = {
        val trans_tdata = Wire(Vec(64, UInt(8.W)))
        for (i <- 0 until 4) {
            for (j <- 0 until 16) {
                trans_tdata(16 * i + j) := rev_matrix_mul_result(tdata(128 * i + 127, 128 * i), j % 4, j / 4)
            }
        }
        trans_tdata.asUInt
    }

    val cur_round_counter = RegInit(1.U(8.W))
    val cur_round = Mux(cur_round_counter <= 11.U, 0.U, (cur_round_counter - 10.U) >> 2.U).asUInt
    val tmp_tdata_reg = Reg(UInt(512.W))


    val aes_key_0 = Cat(change_order_32(io.in.extern_config.arg(15)),
        change_order_32(io.in.extern_config.arg(14)),
        change_order_32(io.in.extern_config.arg(13)),
        change_order_32(io.in.extern_config.arg(12)))

    // current beat result
    val tmp_result = Wire(Vec(4, UInt(512.W)))
    tmp_result(0) := rev_bit_move(tmp_tdata_reg)
    tmp_result(1) := rev_byte_change(tmp_tdata_reg)
    tmp_result(2) := rev_key_encode(tmp_tdata_reg, 10.U - cur_round)
    tmp_result(3) := rev_matrix_multiply(tmp_tdata_reg)

    when(reset.asBool) {
        aes_key_reg(0) := 0.U
    }.elsewhen(in_shake_hand & !in_reg.tlast) {
        aes_key_reg(0) := aes_key_0
    }
    when(in_shake_hand) {
        when(aes_key_reg(0) === aes_key_0) {
            cur_round_counter := 11.U // skip key generation process
        }.elsewhen(!in_reg.tlast) {
            cur_round_counter := 1.U // start key generation
        }
    }.elsewhen(cur_round_counter < 51.U) { // now we are generating key
        cur_round_counter := cur_round_counter + 1.U
        when(cur_round_counter < 11.U) {
            aes_key_reg(cur_round_counter) := get_next_key(aes_key_reg(cur_round_counter - 1.U), cur_round_counter)
        }
    }

    // cur_round_counter:
    // 0~9: aes_key_gen
    // 12,     (12+4*1), ..., (12+4*9) : rev_bit_move -> %4=0
    // 13,     (13+4*1), ..., (13+4*9) : rev_byte_change ->%4=1
    // 11, 14, (14+4*1), ..., (14+4*9) : rev_encode -> %4=2 || 11
    // 15,     (15+4*1), ..., (15+4*8) : rev_matrix_mul ->%4=3

    when(in_shake_hand) {
        tmp_tdata_reg := io.in.tdata
    }.elsewhen(cur_round_counter === 11.U) {
        tmp_tdata_reg := tmp_result(2)
    }.elsewhen(cur_round_counter > 11.U && cur_round_counter < 51.U) {
        tmp_tdata_reg := tmp_result(cur_round_counter(1, 0))
    }
    when (io.in.extern_config.op(8) && !first_beat_reg){
        // ATTENTION: when in first beat, we don't do decryption
        io.out.tdata := tmp_tdata_reg
        io.in.tready   := (cur_round_counter >= 11.U) & (out_shake_hand | !in_reg_used_reg)
        io.out.tvalid := (cur_round_counter === 51.U) & (in_reg.tvalid & in_reg_used_reg)
    }

    // if encode:0 byte_change:1 bit_move:2  mul:3, then:
    // rx: in->0->2->1->0->3->2->1->0->3->...->2->1->0->out (2103 * 9)
    // tx: in->0->1->2->3->0->1->2->3->0->...->1->2->0->out (1230 * 9)
}