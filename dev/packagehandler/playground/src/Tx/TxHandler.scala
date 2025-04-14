package PackageHandler.Tx

import PackageHandler.Misc._
import chisel3._
import chisel3.util._

class TxHandler extends Module {
  val io = IO(new Bundle {
    // val QDMA_h2c_stub_out_tdest   = Input(UInt(16.W))
    val QDMA_h2c_stub_out = new QDMAAxisIO()
    val CMAC_in           = Flipped(new CMACAxisIO())

    val reset_counter            = Input(Bool())
    val h2c_pack_counter         = Output(UInt(32.W))
    val h2c_err_counter          = Output(UInt(32.W))
    val extern_config            = Input(new ExternConfig())
  })

  /* h2c direction */
  val tx_converter = Module(new TxConverter())
  io.QDMA_h2c_stub_out         <> tx_converter.io.in
  tx_converter.io.extern_config := io.extern_config

  val tx_pipeline = Module(new TxPipeline())
  tx_converter.io.out <> tx_pipeline.io.in

  val tx_buffer_fifo = Module(new TxBufferFIFO())
  tx_pipeline.io.out              <> tx_buffer_fifo.io.in
  tx_buffer_fifo.io.out           <> io.CMAC_in
  tx_buffer_fifo.io.reset_counter := io.reset_counter
  io.h2c_pack_counter             := tx_buffer_fifo.io.h2c_pack_counter
  io.h2c_err_counter              := tx_buffer_fifo.io.h2c_err_counter

}
