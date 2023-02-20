/* =====================================================================
* Top module of DEOI-based ARMv7 server node based on Zynq Platform
*
* Author: Yisong Chang (changyisong@ict.ac.cn)
* Date: 23/08/2016
* Version: v0.0.1
*=======================================================================
*/

`timescale 1ns / 1ps

module zynq_deoi_overlay_x86_xgbe (

	/*XGBE GT channel*/
	output						[3:0]gt_txp_out,
	output						[3:0]gt_txn_out,

	input						[3:0]gt_rxp_in,
	input						[3:0]gt_rxn_in,

	/*GT reference clock for XGBE PHY*/
	input						gt_ref_clk_clk_p,
	input						gt_ref_clk_clk_n

);

  localparam			C_MASTER_FPGA       = 0;  // 0 -> master AXI port, 1 -> slave AXI port
  localparam			C_SLAVE_FPGA        = 1;  // 0 -> master AXI port, 1 -> slave AXI port
  localparam			C_INCLUDE_AXILITE   = 1;  // 0 -> not included, 1 -> AXI Lite Master, 2 -> AXI Lite Slave
  localparam			C_INTERRUPT_WIDTH   = 3;
  localparam			C_AXI_ID_WIDTH      = 7;  
  localparam			RX_FIFO_CNT_WIDTH   = 13;  
  localparam			ADDRESS_FILTER_EN   = 1;  

/* clock signals */
 
  //XGBE user clock generated from xgbe PCS-PMA PHY
  (* mark_debug="true" *)wire				gt_txusrclk;

/* IP cores reset signals */
  wire        peripheral_reset;  

/* AXI and AXI4 channel */

  //AXI-Lite to DoCE
  wire [31:0]		doce_axi_lite_slave_araddr;
  wire [0:0]		doce_axi_lite_slave_arready;
  wire [0:0]		doce_axi_lite_slave_arvalid;
  wire [31:0]		doce_axi_lite_slave_awaddr;
  wire [0:0]		doce_axi_lite_slave_awready;
  wire [0:0]		doce_axi_lite_slave_awvalid;
  wire [0:0]		doce_axi_lite_slave_bready;
  wire [1:0]		doce_axi_lite_slave_bresp;
  wire [0:0]		doce_axi_lite_slave_bvalid;
  wire [31:0]		doce_axi_lite_slave_rdata;
  wire [0:0]		doce_axi_lite_slave_rready;
  wire [1:0]		doce_axi_lite_slave_rresp;
  wire [0:0]		doce_axi_lite_slave_rvalid;
  wire [31:0]		doce_axi_lite_slave_wdata;
  wire [0:0]		doce_axi_lite_slave_wready;
  wire [3:0]		doce_axi_lite_slave_wstrb;
  wire [0:0]		doce_axi_lite_slave_wvalid;

  //AXI4 master from DoCE
  (* mark_debug="true" *)wire [31:0]		doce_axi_master_araddr;
  wire [1:0]		doce_axi_master_arburst;
  wire [3:0]		doce_axi_master_arcache;
  (* mark_debug="true" *)wire [5:0]		doce_axi_master_arid;
  (* mark_debug="true" *)wire [7:0]		doce_axi_master_arlen;
  wire [0:0]		doce_axi_master_arlock;
  wire [2:0]		doce_axi_master_arprot;
  wire [3:0]		doce_axi_master_arqos;
  (* mark_debug="true" *)wire				doce_axi_master_arready;
  wire [2:0]		doce_axi_master_arsize;
  (* mark_debug="true" *)wire				doce_axi_master_arvalid;
  wire [31:0]		doce_axi_master_awaddr;
  wire [1:0]		doce_axi_master_awburst;
  wire [3:0]		doce_axi_master_awcache;
  wire [5:0]		doce_axi_master_awid;
  wire [7:0]		doce_axi_master_awlen;
  wire [0:0]		doce_axi_master_awlock;
  wire [2:0]		doce_axi_master_awprot;
  wire [3:0]		doce_axi_master_awqos;
  wire				doce_axi_master_awready;
  wire [2:0]		doce_axi_master_awsize;
  wire				doce_axi_master_awvalid;
  (* mark_debug="true" *)wire [5:0]		doce_axi_master_bid;
  wire				doce_axi_master_bready;
  wire [1:0]		doce_axi_master_bresp;
  wire				doce_axi_master_bvalid;
  (* mark_debug="true" *)wire [127:0]		doce_axi_master_rdata;
  (* mark_debug="true" *)wire [5:0]		doce_axi_master_rid;
  (* mark_debug="true" *)wire				doce_axi_master_rlast;
  (* mark_debug="true" *)wire				doce_axi_master_rready;
  wire [1:0]		doce_axi_master_rresp;
  (* mark_debug="true" *)wire				doce_axi_master_rvalid;
  wire [127:0]		doce_axi_master_wdata;
  wire				doce_axi_master_wlast;
  wire				doce_axi_master_wready;
  wire [7:0]		doce_axi_master_wstrb;
  wire				doce_axi_master_wvalid;
  
  //AXI4 slave to DoCE
  (* mark_debug="true" *)wire [31:0]		doce_axi_slave_araddr;
  wire [1:0]		doce_axi_slave_arburst;
  wire [3:0]		doce_axi_slave_arcache;
  wire [1:0]		doce_axi_slave_arid;
  (* mark_debug="true" *)wire [7:0]		doce_axi_slave_arlen;
  wire [0:0]		doce_axi_slave_arlock;
  wire [2:0]		doce_axi_slave_arprot;
  wire [3:0]		doce_axi_slave_arqos;
  (* mark_debug="true" *)wire				doce_axi_slave_arready;
  wire [3:0]		doce_axi_slave_arregion;
  wire [2:0]		doce_axi_slave_arsize;
  (* mark_debug="true" *)wire				doce_axi_slave_arvalid;
  wire [31:0]		doce_axi_slave_awaddr;
  wire [1:0]		doce_axi_slave_awburst;
  wire [3:0]		doce_axi_slave_awcache;
  wire [1:0]		doce_axi_slave_awid;
  wire [7:0]		doce_axi_slave_awlen;
  wire [0:0]		doce_axi_slave_awlock;
  wire [2:0]		doce_axi_slave_awprot;
  wire [3:0]		doce_axi_slave_awqos;
  wire				doce_axi_slave_awready;
  wire [3:0]		doce_axi_slave_awregion;
  wire [2:0]		doce_axi_slave_awsize;
  wire				doce_axi_slave_awvalid;
  wire [1:0]		doce_axi_slave_bid;
  wire				doce_axi_slave_bready;
  wire [1:0]		doce_axi_slave_bresp;
  wire				doce_axi_slave_bvalid;
  (* mark_debug="true" *)wire [127:0]		doce_axi_slave_rdata;
  wire [1:0]		doce_axi_slave_rid;
  (* mark_debug="true" *)wire				doce_axi_slave_rlast;
  (* mark_debug="true" *)wire				doce_axi_slave_rready;
  wire [1:0]		doce_axi_slave_rresp;
  (* mark_debug="true" *)wire				doce_axi_slave_rvalid;
  wire [127:0]		doce_axi_slave_wdata;
  wire				doce_axi_slave_wlast;
  wire				doce_axi_slave_wready;
  wire [7:0]		doce_axi_slave_wstrb;
  wire				doce_axi_slave_wvalid;

  //AXI-Lite to MAC address register from DoCE
  wire [31:0]		m_axi_doce_mac_araddr;
  wire				m_axi_doce_mac_arready;
  wire				m_axi_doce_mac_arvalid;
  wire [31:0]		m_axi_doce_mac_awaddr;
  wire				m_axi_doce_mac_awready;
  wire				m_axi_doce_mac_awvalid;
  wire				m_axi_doce_mac_bready;
  wire [1:0]		m_axi_doce_mac_bresp;
  wire				m_axi_doce_mac_bvalid;
  wire [31:0]		m_axi_doce_mac_rdata;
  wire				m_axi_doce_mac_rready;
  wire [1:0]		m_axi_doce_mac_rresp;
  wire				m_axi_doce_mac_rvalid;
  wire [31:0]		m_axi_doce_mac_wdata;
  wire				m_axi_doce_mac_wready;
  wire [3:0]		m_axi_doce_mac_wstrb;
  wire				m_axi_doce_mac_wvalid;

/* AXI-Stream Interface */
 
  //DoCE Rx
  (* mark_debug="true" *)wire [63:0]		doce_axis_rxd_tdata;
  wire [7:0]		doce_axis_rxd_tkeep;
  (* mark_debug="true" *)wire				doce_axis_rxd_tlast;
  (* mark_debug="true" *)wire				doce_axis_rxd_tready;
  (* mark_debug="true" *)wire				doce_axis_rxd_tvalid;
 
  //DoCE Tx
  (* mark_debug="true" *)wire [63:0]		doce_axis_txd_tdata;
  wire [7:0]		doce_axis_txd_tkeep;
  (* mark_debug="true" *)wire				doce_axis_txd_tlast;
  (* mark_debug="true" *)wire				doce_axis_txd_tready;
  (* mark_debug="true" *)wire				doce_axis_txd_tvalid;
	
  //Host, Device and DoCE MAC Address
  wire [47:0]		host_mac_id;
  wire [47:0]		dev_mac_id;
  (* mark_debug="true" *)wire [47:0]		doce_mac_id;
  wire [31:0]		doce_ip_addr;


//===============================
// DEOI SoC Component Wrapper
// including Zynq PS, MIG and AXI DMA
//===============================
  mpsoc_wrapper	u_mpsoc_wrapper (
    .gt_ref_clk_clk_n				(gt_ref_clk_clk_n),
	  .gt_ref_clk_clk_p				(gt_ref_clk_clk_p),

    //XGBE GT channels
	  .gt_rxn_in					(gt_rxn_in),
      .gt_rxp_in					(gt_rxp_in),
      .gt_txn_out					(gt_txn_out),
      .gt_txp_out					(gt_txp_out),

    .gt_txusrclk              (gt_txusrclk),
    .peripheral_reset         (peripheral_reset),

      // DoCE Rx channel
	  .doce_axis_rxd_tdata			(doce_axis_rxd_tdata),
      //.doce_axis_rxd_tdest			(),
      .doce_axis_rxd_tkeep			(doce_axis_rxd_tkeep),
      .doce_axis_rxd_tlast			(doce_axis_rxd_tlast),
      .doce_axis_rxd_tready			(doce_axis_rxd_tready),
      .doce_axis_rxd_tvalid			(doce_axis_rxd_tvalid),
      
	  // DoCE Tx channel
	  .doce_axis_txd_tdata			(doce_axis_txd_tdata),
      //.doce_axis_txd_tdest			(3'b110),
      .doce_axis_txd_tkeep			(doce_axis_txd_tkeep),
      .doce_axis_txd_tlast			(doce_axis_txd_tlast),
      .doce_axis_txd_tready			(doce_axis_txd_tready),
      .doce_axis_txd_tvalid			(doce_axis_txd_tvalid),

    //DoCE for DOCE MAC
      .m_axi_doce_mac_araddr			(m_axi_doce_mac_araddr),
      .m_axi_doce_mac_arready			(m_axi_doce_mac_arready),
      .m_axi_doce_mac_arvalid			(m_axi_doce_mac_arvalid),
      .m_axi_doce_mac_awaddr			(m_axi_doce_mac_awaddr),
      .m_axi_doce_mac_awready			(m_axi_doce_mac_awready),
      .m_axi_doce_mac_awvalid			(m_axi_doce_mac_awvalid),
      .m_axi_doce_mac_bready			(m_axi_doce_mac_bready),
      .m_axi_doce_mac_bresp				(m_axi_doce_mac_bresp),
      .m_axi_doce_mac_bvalid			(m_axi_doce_mac_bvalid),
      .m_axi_doce_mac_rdata				(m_axi_doce_mac_rdata),
      .m_axi_doce_mac_rready			(m_axi_doce_mac_rready),
      .m_axi_doce_mac_rresp				(m_axi_doce_mac_rresp),
      .m_axi_doce_mac_rvalid			(m_axi_doce_mac_rvalid),
      .m_axi_doce_mac_wdata				(m_axi_doce_mac_wdata),
      .m_axi_doce_mac_wready			(m_axi_doce_mac_wready),
      .m_axi_doce_mac_wstrb				(m_axi_doce_mac_wstrb),
      .m_axi_doce_mac_wvalid			(m_axi_doce_mac_wvalid),
	  
	  //.host_mac_id						(host_mac_id),
	  //.dev_mac_id						(dev_mac_id),
	  .doce_mac_id						(doce_mac_id),
	  .doce_ip_addr						(doce_ip_addr),

	  //DoCE AXI-Lite
	  .doce_axi_lite_slave_araddr	(doce_axi_lite_slave_araddr),    
	  .doce_axi_lite_slave_arready	(doce_axi_lite_slave_arready),  
	  .doce_axi_lite_slave_arvalid	(doce_axi_lite_slave_arvalid),  
	  .doce_axi_lite_slave_awaddr	(doce_axi_lite_slave_awaddr),    
	  .doce_axi_lite_slave_awready	(doce_axi_lite_slave_awready),  
	  .doce_axi_lite_slave_awvalid	(doce_axi_lite_slave_awvalid),  
	  .doce_axi_lite_slave_bready	(doce_axi_lite_slave_bready),    
	  .doce_axi_lite_slave_bresp	(doce_axi_lite_slave_bresp),      
	  .doce_axi_lite_slave_bvalid	(doce_axi_lite_slave_bvalid),    
	  .doce_axi_lite_slave_rdata	(doce_axi_lite_slave_rdata),      
	  .doce_axi_lite_slave_rready	(doce_axi_lite_slave_rready),    
	  .doce_axi_lite_slave_rresp	(doce_axi_lite_slave_rresp),      
	  .doce_axi_lite_slave_rvalid	(doce_axi_lite_slave_rvalid),    
	  .doce_axi_lite_slave_wdata	(doce_axi_lite_slave_wdata),      
	  .doce_axi_lite_slave_wready	(doce_axi_lite_slave_wready),    
	  .doce_axi_lite_slave_wstrb	(doce_axi_lite_slave_wstrb),      
	  .doce_axi_lite_slave_wvalid	(doce_axi_lite_slave_wvalid),    
	  
	  //DoCE AXI Master
	  .doce_axi_master_araddr		({4'd0, doce_axi_master_araddr[27:0]}),            
	  .doce_axi_master_arburst		(doce_axi_master_arburst),          
	  .doce_axi_master_arcache		(doce_axi_master_arcache),          
	  .doce_axi_master_arid			(doce_axi_master_arid),
	  .doce_axi_master_arlen		(doce_axi_master_arlen),
	  .doce_axi_master_arlock		(doce_axi_master_arlock),            
	  .doce_axi_master_arprot		(doce_axi_master_arprot),            
	  .doce_axi_master_arqos		(doce_axi_master_arqos),
	  .doce_axi_master_arready		(doce_axi_master_arready),          
	  .doce_axi_master_arsize		(doce_axi_master_arsize),            
	  .doce_axi_master_arvalid		(doce_axi_master_arvalid),          
	  .doce_axi_master_awaddr		({4'd0, doce_axi_master_awaddr[27:0]}),            
	  .doce_axi_master_awburst		(doce_axi_master_awburst),          
	  .doce_axi_master_awcache		(doce_axi_master_awcache),          
	  .doce_axi_master_awid			(doce_axi_master_awid),
	  .doce_axi_master_awlen		(doce_axi_master_awlen),
	  .doce_axi_master_awlock		(doce_axi_master_awlock),            
	  .doce_axi_master_awprot		(doce_axi_master_awprot),            
	  .doce_axi_master_awqos		(doce_axi_master_awqos),
	  .doce_axi_master_awready		(doce_axi_master_awready),          
	  .doce_axi_master_awsize		(doce_axi_master_awsize),            
	  .doce_axi_master_awvalid		(doce_axi_master_awvalid),          
	  .doce_axi_master_bid			(doce_axi_master_bid),
	  .doce_axi_master_bready		(doce_axi_master_bready),            
	  .doce_axi_master_bresp		(doce_axi_master_bresp),
	  .doce_axi_master_bvalid		(doce_axi_master_bvalid),            
	  .doce_axi_master_rdata		(doce_axi_master_rdata),
	  .doce_axi_master_rid			(doce_axi_master_rid),
	  .doce_axi_master_rlast		(doce_axi_master_rlast),
	  .doce_axi_master_rready		(doce_axi_master_rready),            
	  .doce_axi_master_rresp		(doce_axi_master_rresp),
	  .doce_axi_master_rvalid		(doce_axi_master_rvalid),            
	  .doce_axi_master_wdata		(doce_axi_master_wdata),
	  .doce_axi_master_wlast		(doce_axi_master_wlast),
	  .doce_axi_master_wready		(doce_axi_master_wready),            
	  .doce_axi_master_wstrb		(doce_axi_master_wstrb),
	  .doce_axi_master_wvalid		(doce_axi_master_wvalid),            
	  
	  //DoCE AXI Slave
	  .doce_axi_slave_araddr		(doce_axi_slave_araddr),
	  .doce_axi_slave_arburst		(doce_axi_slave_arburst),            
	  .doce_axi_slave_arcache		(doce_axi_slave_arcache),            
	  //.doce_axi_slave_arid			(doce_axi_slave_arid),
	  .doce_axi_slave_arlen			(doce_axi_slave_arlen),
	  .doce_axi_slave_arlock		(doce_axi_slave_arlock),
	  .doce_axi_slave_arprot		(doce_axi_slave_arprot),
	  .doce_axi_slave_arqos			(doce_axi_slave_arqos),
	  .doce_axi_slave_arready		(doce_axi_slave_arready),
	  .doce_axi_slave_arregion		(doce_axi_slave_arregion),
	  .doce_axi_slave_arsize		(doce_axi_slave_arsize),
	  .doce_axi_slave_arvalid		(doce_axi_slave_arvalid),
	  .doce_axi_slave_awaddr		(doce_axi_slave_awaddr),
	  .doce_axi_slave_awburst		(doce_axi_slave_awburst),
	  .doce_axi_slave_awcache		(doce_axi_slave_awcache),
	  //.doce_axi_slave_awid			(doce_axi_slave_awid),
	  .doce_axi_slave_awlen			(doce_axi_slave_awlen),
	  .doce_axi_slave_awlock		(doce_axi_slave_awlock),
	  .doce_axi_slave_awprot		(doce_axi_slave_awprot),
	  .doce_axi_slave_awqos			(doce_axi_slave_awqos),
	  .doce_axi_slave_awready		(doce_axi_slave_awready),
	  .doce_axi_slave_awregion		(doce_axi_slave_awregion),
	  .doce_axi_slave_awsize		(doce_axi_slave_awsize),
	  .doce_axi_slave_awvalid		(doce_axi_slave_awvalid),
	  //.doce_axi_slave_bid			  ('h048d),     //designed for special case
	  .doce_axi_slave_bready		(doce_axi_slave_bready),
	  .doce_axi_slave_bresp			(doce_axi_slave_bresp),
	  .doce_axi_slave_bvalid		(doce_axi_slave_bvalid),
	  .doce_axi_slave_rdata			(doce_axi_slave_rdata),
	  //.doce_axi_slave_rid			  ('h048d),         //designed for special case
	  .doce_axi_slave_rlast			(doce_axi_slave_rlast),
	  .doce_axi_slave_rready		(doce_axi_slave_rready),
	  .doce_axi_slave_rresp			(doce_axi_slave_rresp),
	  .doce_axi_slave_rvalid		(doce_axi_slave_rvalid),
	  .doce_axi_slave_wdata			(doce_axi_slave_wdata),
	  .doce_axi_slave_wlast			(doce_axi_slave_wlast),
	  .doce_axi_slave_wready		(doce_axi_slave_wready),
	  .doce_axi_slave_wstrb			(doce_axi_slave_wstrb),
	  .doce_axi_slave_wvalid		(doce_axi_slave_wvalid)
  );

//===============================
// DEOI over Converged Ethernet (DoCE)
//===============================
assign doce_axi_slave_arid = 'd0;
assign doce_axi_slave_awid = 'd0;
doce_top #(
	.AXI_ADDR_WIDTH			(32),
	.AXI_DATA_WIDTH			(16),			//128-bit
    .AXI_ID_WIDTH			(1),
	.AXI_SIZE_WIDTH			(3)/*,
    .AXI_BASE_ADDR			(44'h00080000000),
    .AXI_LITE_BASE_ADDR		(44'h00070000000)*/
)u_doce_top(
    .clk					(gt_txusrclk),
    .reset					(peripheral_reset),

	/*DoCE Tx interface*/
    .doce_axis_txd_tdata	(doce_axis_txd_tdata),
    .doce_axis_txd_tkeep	(doce_axis_txd_tkeep),
    .doce_axis_txd_tlast	(doce_axis_txd_tlast),
    .doce_axis_txd_tvalid	(doce_axis_txd_tvalid),
    .doce_axis_txd_tready	(doce_axis_txd_tready),
  
	/*DoCE Rx interface*/
    .doce_axis_rxd_tdata	(doce_axis_rxd_tdata),
    .doce_axis_rxd_tkeep	(doce_axis_rxd_tkeep),
    .doce_axis_rxd_tlast	(doce_axis_rxd_tlast),
    .doce_axis_rxd_tvalid	(doce_axis_rxd_tvalid),
    .doce_axis_rxd_tready	(doce_axis_rxd_tready),   
   
	/*AXI Slave interface*/
    .doce_axi_slave_awaddr	(doce_axi_slave_awaddr),
    .doce_axi_slave_awid	(doce_axi_slave_awid),
    .doce_axi_slave_awlen	(doce_axi_slave_awlen),
    .doce_axi_slave_awsize	(doce_axi_slave_awsize),
    .doce_axi_slave_awburst	(doce_axi_slave_awburst),
    .doce_axi_slave_awlock	(doce_axi_slave_awlock),
    .doce_axi_slave_awvalid	(doce_axi_slave_awvalid),
    .doce_axi_slave_awready	(doce_axi_slave_awready),

    .doce_axi_slave_araddr	(doce_axi_slave_araddr),
    .doce_axi_slave_arid	(doce_axi_slave_arid),
    .doce_axi_slave_arlen	(doce_axi_slave_arlen),
    .doce_axi_slave_arsize	(doce_axi_slave_arsize),
    .doce_axi_slave_arburst	(doce_axi_slave_arburst),
    .doce_axi_slave_arlock	(doce_axi_slave_arlock),
    .doce_axi_slave_arvalid	(doce_axi_slave_arvalid),
    .doce_axi_slave_arready	(doce_axi_slave_arready), 
       
    .doce_axi_slave_wdata	(doce_axi_slave_wdata),
    .doce_axi_slave_wstrb	(doce_axi_slave_wstrb),
    .doce_axi_slave_wlast	(doce_axi_slave_wlast),
    .doce_axi_slave_wvalid	(doce_axi_slave_wvalid),
    .doce_axi_slave_wready	(doce_axi_slave_wready),

    .doce_axi_slave_rdata	(doce_axi_slave_rdata),
    .doce_axi_slave_rid		(doce_axi_slave_rid),
    .doce_axi_slave_rlast	(doce_axi_slave_rlast),
    .doce_axi_slave_rresp	(doce_axi_slave_rresp),
    .doce_axi_slave_rvalid	(doce_axi_slave_rvalid),
    .doce_axi_slave_rready	(doce_axi_slave_rready),

    .doce_axi_slave_bresp	(doce_axi_slave_bresp),
    .doce_axi_slave_bid		(doce_axi_slave_bid),
    .doce_axi_slave_bvalid	(doce_axi_slave_bvalid),
    .doce_axi_slave_bready	(doce_axi_slave_bready),

	/*AXI Master interface*/
    .doce_axi_master_awaddr		(doce_axi_master_awaddr),
    .doce_axi_master_awid		(doce_axi_master_awid),   //include 4bit connection_id
    .doce_axi_master_awlen		(doce_axi_master_awlen),
    .doce_axi_master_awsize		(doce_axi_master_awsize),
    .doce_axi_master_awburst	(doce_axi_master_awburst),
    .doce_axi_master_awcache	(doce_axi_master_awcache),
    .doce_axi_master_awlock		(doce_axi_master_awlock),
    .doce_axi_master_awvalid	(doce_axi_master_awvalid),
    .doce_axi_master_awready	(doce_axi_master_awready),

    .doce_axi_master_araddr		(doce_axi_master_araddr),
    .doce_axi_master_arid		(doce_axi_master_arid),	//include 4bit connection_id
    .doce_axi_master_arlen		(doce_axi_master_arlen),
    .doce_axi_master_arsize		(doce_axi_master_arsize),
    .doce_axi_master_arcache	(doce_axi_master_arcache),
    .doce_axi_master_arburst	(doce_axi_master_arburst),
    .doce_axi_master_arlock		(doce_axi_master_arlock),
    .doce_axi_master_arvalid	(doce_axi_master_arvalid),
    .doce_axi_master_arready	(doce_axi_master_arready), 
       
    .doce_axi_master_wdata		(doce_axi_master_wdata),
    .doce_axi_master_wstrb		(doce_axi_master_wstrb),
    .doce_axi_master_wlast		(doce_axi_master_wlast),
    .doce_axi_master_wvalid		(doce_axi_master_wvalid),
    .doce_axi_master_wready		(doce_axi_master_wready),

    .doce_axi_master_rdata		(doce_axi_master_rdata),
    .doce_axi_master_rid		(doce_axi_master_rid),    //include 4bit connection_id
    .doce_axi_master_rlast		(doce_axi_master_rlast),
    .doce_axi_master_rresp		(doce_axi_master_rresp),
    .doce_axi_master_rvalid		(doce_axi_master_rvalid),
    .doce_axi_master_rready		(doce_axi_master_rready),

    .doce_axi_master_bresp		(doce_axi_master_bresp),
    .doce_axi_master_bid		(doce_axi_master_bid), //include 4bit connection_id
    .doce_axi_master_bvalid		(doce_axi_master_bvalid),
    .doce_axi_master_bready		(doce_axi_master_bready),
 
	/*AXI-Lite slave interface*/
    .doce_axi_lite_slave_awaddr		(doce_axi_lite_slave_awaddr),
    .doce_axi_lite_slave_awvalid	(doce_axi_lite_slave_awvalid),
    .doce_axi_lite_slave_awready	(doce_axi_lite_slave_awready),
    
    .doce_axi_lite_slave_araddr		(doce_axi_lite_slave_araddr),
    .doce_axi_lite_slave_arvalid	(doce_axi_lite_slave_arvalid),
    .doce_axi_lite_slave_arready	(doce_axi_lite_slave_arready),
    
    .doce_axi_lite_slave_wdata		(doce_axi_lite_slave_wdata),
    .doce_axi_lite_slave_wstrb		(doce_axi_lite_slave_wstrb),
    .doce_axi_lite_slave_wvalid		(doce_axi_lite_slave_wvalid),
    .doce_axi_lite_slave_wready		(doce_axi_lite_slave_wready),
    
    .doce_axi_lite_slave_rdata		(doce_axi_lite_slave_rdata),
    .doce_axi_lite_slave_rresp		(doce_axi_lite_slave_rresp),
    .doce_axi_lite_slave_rvalid		(doce_axi_lite_slave_rvalid),
    .doce_axi_lite_slave_rready		(doce_axi_lite_slave_rready),
    
    .doce_axi_lite_slave_bresp		(doce_axi_lite_slave_bresp),
    .doce_axi_lite_slave_bvalid		(doce_axi_lite_slave_bvalid),
    .doce_axi_lite_slave_bready		(doce_axi_lite_slave_bready),

	/*AXI-Lite master interface to DoCE MAC/IP address register*/
    .m_axi_doce_mac_awaddr		(m_axi_doce_mac_awaddr),
    .m_axi_doce_mac_awvalid		(m_axi_doce_mac_awvalid),
    .m_axi_doce_mac_awready		(m_axi_doce_mac_awready),
    
    .m_axi_doce_mac_araddr		(m_axi_doce_mac_araddr),
    .m_axi_doce_mac_arvalid		(m_axi_doce_mac_arvalid),
    .m_axi_doce_mac_arready		(m_axi_doce_mac_arready),
    
    .m_axi_doce_mac_wdata		(m_axi_doce_mac_wdata),
    .m_axi_doce_mac_wstrb		(m_axi_doce_mac_wstrb),
    .m_axi_doce_mac_wvalid		(m_axi_doce_mac_wvalid),
    .m_axi_doce_mac_wready		(m_axi_doce_mac_wready),
    
    .m_axi_doce_mac_rdata		(m_axi_doce_mac_rdata),
    .m_axi_doce_mac_rresp		(m_axi_doce_mac_rresp),
    .m_axi_doce_mac_rvalid		(m_axi_doce_mac_rvalid),
    .m_axi_doce_mac_rready		(m_axi_doce_mac_rready),
    
    .m_axi_doce_mac_bresp		(m_axi_doce_mac_bresp),
    .m_axi_doce_mac_bvalid		(m_axi_doce_mac_bvalid),
    .m_axi_doce_mac_bready		(m_axi_doce_mac_bready),

	/*DoCE MAC address */
	.doce_mac_addr				(doce_mac_id),
	.doce_ip_addr				(doce_ip_addr)
);

endmodule

