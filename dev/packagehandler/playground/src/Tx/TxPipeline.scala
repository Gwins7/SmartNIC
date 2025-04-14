package PackageHandler.Tx

import PackageHandler.Misc._
import PackageHandler.Tx.PipelineHandler._
import chisel3._
import chisel3.util._

class TxPipeline extends Module{

  val io = IO(new Bundle {
    val in  = new TxPipelineAxisIO()
    val out = Flipped(new TxPipelineAxisIO())
  })
  // add pipeline handler here

  val tx_aes_encrypter = Module(new TxAESEncrypter())
  val tx_chksum_generator = Module(new TxChksumGenerator())
  io.in <> tx_aes_encrypter.io.in
  tx_aes_encrypter.io.out <> tx_chksum_generator.io.in
  tx_chksum_generator.io.out <> io.out

}

