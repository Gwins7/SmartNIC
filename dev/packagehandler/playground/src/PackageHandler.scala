package PackageHandler

import PackageHandler.Misc._
import PackageHandler.Rx._
import PackageHandler.Tx._
import chisel3._
import chisel3.util._

// User-defined package handler module
class PackageHandler extends Module {
  val io = IO(new Bundle {
    // The default clock and reset are
    // QDMA_axi_aclk and QDMA_axi_aresetn.
    // val QDMA_h2c_stub_out_tdest   = Input(UInt(16.W))
    val QDMA_h2c_stub_out = new QDMAAxisIO()
    val CMAC_in = Flipped(new CMACAxisIO())
    val CMAC_out = new CMACAxisIO()
    val QDMA_c2h_stub_in = Flipped(new QDMAAxisIO())

    val reset_counter            = Input(Bool())

    val extern_config            = Input(new ExternConfig())
    val c2h_pack_counter         = Output(UInt(32.W))
    val c2h_err_counter          = Output(UInt(32.W))

    val h2c_pack_counter         = Output(UInt(32.W))
    val h2c_err_counter          = Output(UInt(32.W))
  })
  // save extern_config to cut length of signal
  val extern_config_reg = RegNext(io.extern_config.asUInt,0.U).asTypeOf(new ExternConfig)

  val tx_handler = Module(new TxHandler)
  io.QDMA_h2c_stub_out <> tx_handler.io.QDMA_h2c_stub_out
  io.CMAC_in           <> tx_handler.io.CMAC_in
  tx_handler.io.reset_counter := io.reset_counter
  tx_handler.io.extern_config   := extern_config_reg
  io.h2c_pack_counter         := tx_handler.io.h2c_pack_counter
  io.h2c_err_counter          := tx_handler.io.h2c_err_counter

  val rx_handler = Module(new RxHandler)
  io.QDMA_c2h_stub_in <> rx_handler.io.QDMA_c2h_stub_in
  io.CMAC_out         <> rx_handler.io.CMAC_out
  rx_handler.io.reset_counter   := io.reset_counter
  rx_handler.io.extern_config   := extern_config_reg
  io.c2h_pack_counter           := rx_handler.io.c2h_pack_counter
  io.c2h_err_counter            := rx_handler.io.c2h_err_counter
}
