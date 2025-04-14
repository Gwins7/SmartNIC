package PackageHandler.Rx

import PackageHandler.Misc._
import PackageHandler.Rx.PipelineHandler._
import chisel3._
import chisel3.util._

class RxPipeline extends Module{

  val io = IO(new Bundle {
    val in  = new RxPipelineAxisIO()
    val out = Flipped(new RxPipelineAxisIO())
  })

  // add pipeline handler here

  val rx_aes_decrypter =   Module (new RxAESDecrypter())
  val rx_re_searcher = Module(new RxRESearcher(1))
  val rx_chksum_verifier = Module(new RxChksumVerifier())
  val rx_rss_hasher = Module(new RxRSSHasher())
  val rx_string_matcher    = Module(new RxStrMatcher())
  val rx_string_searcher      = Module(new RxStrSearcher())

  io.in <> rx_chksum_verifier.io.in
  rx_chksum_verifier.io.out <> rx_aes_decrypter.io.in
  rx_aes_decrypter.io.out   <> rx_rss_hasher.io.in
  rx_rss_hasher.io.out      <> rx_string_matcher.io.in
  rx_string_matcher.io.out  <> rx_string_searcher.io.in
  rx_string_searcher.io.out <> rx_re_searcher.io.in
  rx_re_searcher.io.out <> io.out
}



