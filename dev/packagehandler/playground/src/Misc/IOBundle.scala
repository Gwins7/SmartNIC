package PackageHandler.Misc

import chisel3._
import chisel3.util._

class AxisIO extends Bundle{
  val tdata  = Input(UInt(512.W))
  val tvalid = Input(Bool())
  val tready = Output(Bool())
  val tlast  = Input(Bool())
}
class TxPipelineAxisIO extends AxisIO{
  // used by TxPipelineHandler
  val tx_info = Input(new TxInfo())
  val extern_config = Input(new ExternConfig())
}

class RxPipelineAxisIO extends AxisIO{
  // used by RxPipelineHandler
  val tuser = Input(Bool())
  val rx_info = Input(new RxInfo())
  val extern_config = Input(new ExternConfig())
}

class QDMAAxisIO extends AxisIO{
  // used by QDMA
  val tuser = Input(Bool())
}

class CMACAxisIO extends QDMAAxisIO{
  // used by CMAC
  val tkeep = Input(UInt(64.W))
}

class FifoIPIO (width:Int) extends Bundle {
  // used in BufferFIFO2
  val tdata = Input(UInt(width.W))
  val tlast = Input(Bool())
  val tready = Output(Bool())
  val tvalid = Input(Bool())
}
class BufferFifoIP_128 extends BlackBox {

  val io = IO(new Bundle{
    val s_axis_aclk = Input(Clock())
    val s_axis_aresetn = Input(Bool())

    val s_axis = new FifoIPIO(128)
    val m_axis = Flipped(new FifoIPIO(128))
  })
}
class BufferFifoIP_512 extends BlackBox {

  val io = IO(new Bundle {
    val s_axis_aclk = Input(Clock())
    val s_axis_aresetn = Input(Bool())

    val s_axis = new FifoIPIO(512)
    val m_axis = Flipped(new FifoIPIO(512))
  })
}