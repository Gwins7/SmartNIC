package PackageHandler.Rx.PipelineHandler

import PackageHandler.Misc._
import chisel3._
class RxChksumVerifier extends RxPipelineHandler {
  /*
    Calculate chksum to be checked later
    attention: the real verification is in RxBufferFIFO
    symmetric to TxChksumGenerator
   */
  val cal_tdata = Mux(in_shake_hand,io.in.tdata,in_reg.tdata)
  // ip header (without existed checksum)
  val ip_chksum_cal = Module(new ReduceAddSync(10,32))
  for (i <- 0 until 10) {
    ip_chksum_cal.io.in_vec(i) := change_order_16(cal_tdata(16*i+127,16*i+112))
  }
  val ip_chksum_result = ip_chksum_cal.io.out_sum

  // tcp payload
  val tcp_pld_chksum_cal = Module(new ReduceAddSync(32,32))
  for (i <- 0 until 32) {
    tcp_pld_chksum_cal.io.in_vec(i) := change_order_16(cal_tdata(16*i+15,16*i))
  }
  val tcp_pld_chksum_result = tcp_pld_chksum_cal.io.out_sum

  // tcp header (attention: some information from ip header is needed) (without existed checksum)
  val tcp_hdr_chksum_cal = Module(new ReduceAddSync(32,32))
  for (i <- 0 until 32) {
    // build fake TCP header
    if (i==8 || i>=13) tcp_hdr_chksum_cal.io.in_vec(i) := change_order_16(cal_tdata(16*i+15,16*i))
    else if (i==11) tcp_hdr_chksum_cal.io.in_vec(i) := cal_tdata(16*i+15,16*i+8)
    else tcp_hdr_chksum_cal.io.in_vec(i) := 0.U
  }
  val tcp_hdr_chksum_result = tcp_hdr_chksum_cal.io.out_sum - 20.U // - ip header length

  val cal_ip_chksum_reg = RegInit(0.U(32.W))
  val cal_tcp_chksum_reg = RegInit(0.U(32.W))

  // the calculate result reg
  when (in_shake_hand) {
    when (first_beat_reg) {
      cal_ip_chksum_reg := ip_chksum_result
      cal_tcp_chksum_reg := tcp_hdr_chksum_result
    }.otherwise{
      cal_tcp_chksum_reg := cal_tcp_chksum_reg + tcp_pld_chksum_result
    }
  }
  io.out.rx_info.ip_chksum := Mux(first_beat_reg,ip_chksum_result,cal_ip_chksum_reg)
  io.out.rx_info.tcp_chksum := Mux(first_beat_reg,tcp_hdr_chksum_result,cal_tcp_chksum_reg + tcp_pld_chksum_result)

}