//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sat Apr  9 16:48:04 2022
//Host        : Gwins7-Legion running 64-bit major release  (build 9200)
//Command     : generate_target mpsoc_wrapper.bd
//Design      : mpsoc_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`include "qdma_stm_defines.svh"
//c2h: CMAC->QDMA
//h2c: QDMA->CMAC
module mpsoc_wrapper
   (pci_exp_rxn,
    pci_exp_rxp,
    pci_exp_txn,
    pci_exp_txp,
    sys_clk_p,
    sys_clk_n,
    sys_rst_n,
    
    gt_ref_clk_clk_n,
    gt_ref_clk_clk_p,
    gt_rxn_in,
    gt_rxp_in,
    gt_txn_out,
    gt_txp_out
    );

  input  [15:0] pci_exp_rxn;
  input  [15:0] pci_exp_rxp;
  output [15:0] pci_exp_txn;
  output [15:0] pci_exp_txp;
  input sys_clk_p;
  input sys_clk_n;
  input sys_rst_n;

  input gt_ref_clk_clk_n;
  input gt_ref_clk_clk_p;
  input [3:0] gt_rxn_in;
  input [3:0 ]gt_rxp_in;
  output [3:0] gt_txn_out;
  output [3:0] gt_txp_out;

  wire [15:0] QDMA_pcie_mgt_rxn = pci_exp_rxn;
  wire [15:0] QDMA_pcie_mgt_rxp = pci_exp_rxp;
  wire [15:0] QDMA_pcie_mgt_txn;
  assign pci_exp_txn = QDMA_pcie_mgt_txn;
  wire [15:0] QDMA_pcie_mgt_txp;
  assign pci_exp_txp = QDMA_pcie_mgt_txp;

  wire QDMA_sys_rst_n;
  wire QDMA_sys_clk;
  wire QDMA_sys_clk_gt;
  wire QDMA_axi_aclk;
  wire QDMA_axi_aresetn;
  wire QDMA_soft_reset_n;
//==== axis ====
    (* mark_debug = "true" *)wire [511:0]QDMA_h2c_stub_out_tdata;
    (* mark_debug = "true" *)wire [15:0]QDMA_h2c_stub_out_tdest;
    (* mark_debug = "true" *)wire QDMA_h2c_stub_out_tuser;
    (* mark_debug = "true" *)wire QDMA_h2c_stub_out_tlast;
    (* mark_debug = "true" *)wire QDMA_h2c_stub_out_tready;
    (* mark_debug = "true" *)wire QDMA_h2c_stub_out_tvalid;

    (* mark_debug = "true" *)wire [511:0]CMAC_in_tdata;
    (* mark_debug = "true" *)wire [63:0]CMAC_in_tkeep;
    (* mark_debug = "true" *)wire CMAC_in_tlast;
    (* mark_debug = "true" *)wire CMAC_in_tready;
    (* mark_debug = "true" *)wire CMAC_in_tvalid;

    wire [511:0]tx_axis_tdata;
    wire [63:0]tx_axis_tkeep;
    wire tx_axis_tlast;
    wire tx_axis_tready;
    wire tx_axis_tvalid;

    wire CMAC_axi_aclk;
    wire tx_fifo_aresetn;
    wire rx_fifo_aresetn;

    wire [511:0]rx_axis_tdata;
    wire [63:0]rx_axis_tkeep;
    wire rx_axis_tlast;
    wire rx_axis_tvalid;
    wire rx_axis_tuser;

    (* mark_debug = "true" *)wire [511:0]CMAC_out_tdata;
    (* mark_debug = "true" *)wire [63:0]CMAC_out_tkeep;
    (* mark_debug = "true" *)wire CMAC_out_tlast;
    (* mark_debug = "true" *)wire CMAC_out_tready;
    (* mark_debug = "true" *)wire CMAC_out_tvalid;
    (* mark_debug = "true" *)wire CMAC_out_tuser;

    (* mark_debug = "true" *)wire [511:0]QDMA_c2h_stub_in_tdata;
    (* mark_debug = "true" *)wire QDMA_c2h_stub_in_tuser;
    (* mark_debug = "true" *)wire QDMA_c2h_stub_in_tlast;
    (* mark_debug = "true" *)wire QDMA_c2h_stub_in_tready;
    (* mark_debug = "true" *)wire QDMA_c2h_stub_in_tvalid;

    //QDMA_h2c(_stub_in)_... are defined in other places.

    (* mark_debug = "true" *)wire mdma_c2h_axis_data_exdes_t QDMA_c2h_stub_out_data;
    (* mark_debug = "true" *)wire mdma_c2h_axis_ctrl_exdes_t QDMA_c2h_stub_out_ctrl;//port_id unused
    (* mark_debug = "true" *)wire c2h_stub_std_cmp_ctrl_t QDMA_c2h_stub_out_cmp_ctrl; //port_id unused
    (* mark_debug = "true" *)wire c2h_stub_std_cmp_t QDMA_c2h_stub_out_cmp_data;
    (* mark_debug = "true" *)wire QDMA_c2h_stub_out_cmp_tvalid;
    (* mark_debug = "true" *)wire [5:0]QDMA_c2h_stub_out_mty;
    (* mark_debug = "true" *)wire QDMA_c2h_stub_out_tlast;
    (* mark_debug = "true" *)wire QDMA_c2h_stub_out_tvalid;
                             wire [31:0] QDMA_h2c_pack_counter;
                             wire [31:0] QDMA_h2c_err_counter;
    (* mark_debug = "true" *)wire [31:0]  QDMA_c2h_pack_counter;
    (* mark_debug = "true" *)wire [31:0]  QDMA_c2h_err_counter;

    wire QDMA_h2c_err;
    wire [31:0]QDMA_h2c_mdata;
    wire [5:0]QDMA_h2c_mty;
    wire [2:0]QDMA_h2c_port_id;
    wire [10:0]QDMA_h2c_qid;
    wire [511:0]QDMA_h2c_tdata;
    wire QDMA_h2c_tlast;
    wire QDMA_h2c_tready;
    wire QDMA_h2c_tvalid;
    wire QDMA_h2c_zero_byte;

    wire [1:0]QDMA_c2h_cmpt_cmpt_type;
    wire [2:0]QDMA_c2h_cmpt_col_idx;
    wire [511:0]QDMA_c2h_cmpt_data;
    wire [15:0]QDMA_c2h_cmpt_dpar;
    wire [2:0]QDMA_c2h_cmpt_err_idx;
    wire QDMA_c2h_cmpt_marker;
    wire [10:0]QDMA_c2h_cmpt_qid;
    wire [1:0]QDMA_c2h_cmpt_size;
    (* mark_debug = "true" *)wire QDMA_c2h_cmpt_tready;
    wire QDMA_c2h_cmpt_tvalid;
    wire QDMA_c2h_cmpt_user_trig;
    wire [15:0]QDMA_c2h_cmpt_wait_pld_pkt_id;
    
    wire QDMA_c2h_ctrl_has_cmpt;
    wire [15:0]QDMA_c2h_ctrl_len;
    wire QDMA_c2h_ctrl_marker;
    wire [10:0]QDMA_c2h_ctrl_qid;

    wire [5:0]QDMA_c2h_mty;
    wire [511:0]QDMA_c2h_tdata;
    wire QDMA_c2h_tlast;
    (* mark_debug = "true" *)wire QDMA_c2h_tready;
    wire QDMA_c2h_tvalid;
    
  wire [7:0] c2h_match_op;
  wire [31:0] c2h_match_arg0;
  wire [31:0] c2h_match_arg1;
  wire [31:0] c2h_match_arg2;
  wire [31:0] c2h_match_arg3;
  wire [31:0] c2h_match_arg4;
  wire [31:0] c2h_match_arg5;
  wire [31:0] c2h_match_arg6;
  wire [31:0] c2h_match_arg7;
  wire [31:0] c2h_match_arg8;
  wire [31:0] c2h_match_arg9;
  wire [31:0] c2h_match_arg10;
  wire [31:0] c2h_match_arg11;
  wire [31:0] c2h_match_arg12;
  wire [31:0] c2h_match_arg13;
  wire [31:0] c2h_match_arg14;
  wire [31:0] c2h_match_arg15;
  wire reset_counter;
  
  // Ref clock buffer
  IBUFDS_GTE4 # (.REFCLK_HROW_CK_SEL(2'b00)) refclk_ibuf (.O(QDMA_sys_clk_gt), .ODIV2(QDMA_sys_clk), .I(sys_clk_p), .CEB(1'b0), .IB(sys_clk_n));
  // Reset buffer
  IBUF   sys_reset_n_ibuf (.O(QDMA_sys_rst_n), .I(sys_rst_n));


//=== axil ====
//-- AXI Master Write Address Channel
  wire [31:0] QDMA_axil_awaddr;
  wire [2:0]  QDMA_axil_awprot;
  wire        QDMA_axil_awvalid;
  wire        QDMA_axil_awready;

  //-- AXI Master Write Data Channel
  wire [31:0] QDMA_axil_wdata;
  wire [3:0]  QDMA_axil_wstrb;
  wire        QDMA_axil_wvalid;
  wire        QDMA_axil_wready;

  //-- AXI Master Write Response Channel
  wire        QDMA_axil_bvalid;
  wire        QDMA_axil_bready;

  //-- AXI Master Read Address Channel
  wire [31:0] QDMA_axil_araddr;
  wire [2:0]  QDMA_axil_arprot;
  wire        QDMA_axil_arvalid;
  wire        QDMA_axil_arready;

  //-- AXI Master Read Data Channel
  wire [31:0] QDMA_axil_rdata;
  wire [1:0]  QDMA_axil_rresp;
  wire        QDMA_axil_rvalid;
  wire        QDMA_axil_rready;
  wire [1:0]  QDMA_axil_bresp;

  wire   QDMA_h2c_tready_lpbk;


  wire mdma_h2c_axis_tuser_exdes_t   QDMA_h2c_tuser_net;
  assign QDMA_h2c_tuser_net = {QDMA_h2c_zero_byte,QDMA_h2c_mty,QDMA_h2c_mdata,QDMA_h2c_err,QDMA_h2c_port_id,QDMA_h2c_qid};

  assign QDMA_c2h_cmpt_data         = QDMA_c2h_stub_out_cmp_data.cmp_ent;
  assign QDMA_c2h_cmpt_size         = QDMA_c2h_stub_out_cmp_data.cmp_size;
  assign QDMA_c2h_cmpt_dpar         = QDMA_c2h_stub_out_cmp_data.dpar;
  assign QDMA_c2h_cmpt_user_trig    = QDMA_c2h_stub_out_cmp_ctrl.user_trig;
  assign QDMA_c2h_cmpt_err_idx      = QDMA_c2h_stub_out_cmp_ctrl.error_idx;
  assign QDMA_c2h_cmpt_col_idx      = QDMA_c2h_stub_out_cmp_ctrl.color_idx;
  assign QDMA_c2h_cmpt_wait_pld_pkt_id = QDMA_c2h_stub_out_cmp_ctrl.wait_pld_pkt_id;
  assign QDMA_c2h_cmpt_cmpt_type    = QDMA_c2h_stub_out_cmp_ctrl.cmpt_type;
  assign QDMA_c2h_cmpt_marker       = QDMA_c2h_stub_out_cmp_ctrl.marker;
  assign QDMA_c2h_cmpt_qid          = QDMA_c2h_stub_out_cmp_ctrl.qid;
  assign QDMA_c2h_cmpt_tvalid       = QDMA_c2h_stub_out_cmp_tvalid;
  assign QDMA_h2c_tready            = QDMA_h2c_tready_lpbk;
  
  assign QDMA_c2h_tdata       = QDMA_c2h_stub_out_data.tdata;
  assign QDMA_c2h_dpar          = QDMA_c2h_stub_out_data.par;
  assign QDMA_c2h_mty           = QDMA_c2h_stub_out_mty;
  assign QDMA_c2h_tlast         = QDMA_c2h_stub_out_tlast;
  assign QDMA_c2h_tvalid        = QDMA_c2h_stub_out_tvalid;
  assign QDMA_c2h_ctrl_has_cmpt = QDMA_c2h_stub_out_ctrl.has_cmpt;
  assign QDMA_c2h_ctrl_marker   = QDMA_c2h_stub_out_ctrl.marker;
  assign QDMA_c2h_ctrl_qid      = QDMA_c2h_stub_out_ctrl.qid;
  assign QDMA_c2h_ctrl_len      = QDMA_c2h_stub_out_ctrl.len;


  
mpsoc mpsoc_i(
// QDMA's pcie interface and global axi clk etc.
    .QDMA_pcie_mgt_rxn          (QDMA_pcie_mgt_rxn),
    .QDMA_pcie_mgt_rxp          (QDMA_pcie_mgt_rxp),
    .QDMA_pcie_mgt_txn          (QDMA_pcie_mgt_txn),
    .QDMA_pcie_mgt_txp          (QDMA_pcie_mgt_txp),
    .QDMA_sys_clk               (QDMA_sys_clk),
    .QDMA_sys_clk_gt            (QDMA_sys_clk_gt),
    .QDMA_sys_rst_n             (QDMA_sys_rst_n),
    .QDMA_soft_reset_n          (QDMA_soft_reset_n),
    .QDMA_axi_aclk              (QDMA_axi_aclk),
    .QDMA_axi_aresetn           (QDMA_axi_aresetn),
    .CMAC_axi_aclk              (CMAC_axi_aclk), 
//axil interface for QDMA
    //-- AXI Master Write Address Channel
    .QDMA_axil_awaddr    (QDMA_axil_awaddr),
    .QDMA_axil_awprot    (QDMA_axil_awprot),
    .QDMA_axil_awvalid   (QDMA_axil_awvalid),
    .QDMA_axil_awready   (QDMA_axil_awready),
    //-- AXI Master Write Data Channel
    .QDMA_axil_wdata     (QDMA_axil_wdata),
    .QDMA_axil_wstrb     (QDMA_axil_wstrb),
    .QDMA_axil_wvalid    (QDMA_axil_wvalid),
    .QDMA_axil_wready    (QDMA_axil_wready),
    //-- AXI Master Write Response Channel
    .QDMA_axil_bvalid    (QDMA_axil_bvalid),
    .QDMA_axil_bresp     (QDMA_axil_bresp),
    .QDMA_axil_bready    (QDMA_axil_bready),
    //-- AXI Master Read Address Channel
    .QDMA_axil_araddr    (QDMA_axil_araddr),
    .QDMA_axil_arprot    (QDMA_axil_arprot),
    .QDMA_axil_arvalid   (QDMA_axil_arvalid),
    .QDMA_axil_arready   (QDMA_axil_arready),
    .QDMA_axil_rdata     (QDMA_axil_rdata),
    //-- AXI Master Read Data Channel
    .QDMA_axil_rresp     (QDMA_axil_rresp),
    .QDMA_axil_rvalid    (QDMA_axil_rvalid),
    .QDMA_axil_rready    (QDMA_axil_rready),

// (AXIS)
    .QDMA_c2h_cmpt_cmpt_type    (QDMA_c2h_cmpt_cmpt_type),
    .QDMA_c2h_cmpt_col_idx      (QDMA_c2h_cmpt_col_idx),
    .QDMA_c2h_cmpt_data         (QDMA_c2h_cmpt_data),
    .QDMA_c2h_cmpt_dpar         (QDMA_c2h_cmpt_dpar),
    .QDMA_c2h_cmpt_err_idx      (QDMA_c2h_cmpt_err_idx),
    .QDMA_c2h_cmpt_marker       (QDMA_c2h_cmpt_marker),
    .QDMA_c2h_cmpt_port_id      (3'b000),
    .QDMA_c2h_cmpt_qid          (QDMA_c2h_cmpt_qid),
    .QDMA_c2h_cmpt_size         (QDMA_c2h_cmpt_size),
    .QDMA_c2h_cmpt_tready       (QDMA_c2h_cmpt_tready),
    .QDMA_c2h_cmpt_tvalid       (QDMA_c2h_cmpt_tvalid),
    .QDMA_c2h_cmpt_user_trig    (QDMA_c2h_cmpt_user_trig),
    .QDMA_c2h_cmpt_wait_pld_pkt_id(QDMA_c2h_cmpt_wait_pld_pkt_id),
    .QDMA_c2h_ctrl_has_cmpt     (QDMA_c2h_ctrl_has_cmpt),
    .QDMA_c2h_ctrl_len          (QDMA_c2h_ctrl_len),
    .QDMA_c2h_ctrl_marker       (QDMA_c2h_ctrl_marker),
    .QDMA_c2h_ctrl_port_id      (3'b000),
    .QDMA_c2h_ctrl_qid          (QDMA_c2h_ctrl_qid),
    .QDMA_c2h_ecc               ('d0),
    .QDMA_c2h_mty               (QDMA_c2h_mty),
    .QDMA_c2h_tcrc              ('d0),
    .QDMA_c2h_tdata             (QDMA_c2h_tdata),
    .QDMA_c2h_tlast             (QDMA_c2h_tlast),
    .QDMA_c2h_tready            (QDMA_c2h_tready),
    .QDMA_c2h_tvalid            (QDMA_c2h_tvalid),
    .QDMA_h2c_err               (QDMA_h2c_err),
    .QDMA_h2c_mdata             (QDMA_h2c_mdata),
    .QDMA_h2c_mty               (QDMA_h2c_mty),
    .QDMA_h2c_port_id           (QDMA_h2c_port_id),
    .QDMA_h2c_qid               (QDMA_h2c_qid),
    .QDMA_h2c_tcrc              (),
    .QDMA_h2c_tdata             (QDMA_h2c_tdata),
    .QDMA_h2c_tlast             (QDMA_h2c_tlast),
    .QDMA_h2c_tready            (QDMA_h2c_tready),
    .QDMA_h2c_tvalid            (QDMA_h2c_tvalid),
    .QDMA_h2c_zero_byte         (QDMA_h2c_zero_byte),

// loopback (substituted by CMAC)
// attention: cmac's tusers only mark whether the package is valid.(0 is valid while 1 is not)
    .tx_fifo_aresetn            (tx_fifo_aresetn),
    .rx_fifo_aresetn            (rx_fifo_aresetn),

    .tx_axis_tdata              (tx_axis_tdata),
    .tx_axis_tkeep              (tx_axis_tkeep),
    .tx_axis_tlast              (tx_axis_tlast),
    .tx_axis_tready             (tx_axis_tready),
    .tx_axis_tvalid             (tx_axis_tvalid),
    .tx_axis_tuser              (1'b0),

    .rx_axis_tdata              (rx_axis_tdata),
    .rx_axis_tkeep              (rx_axis_tkeep),
    .rx_axis_tlast              (rx_axis_tlast),
    .rx_axis_tuser              (rx_axis_tuser),
    .rx_axis_tvalid             (rx_axis_tvalid),

// clk and network interface for CMAC
    .gt_ref_clk_clk_n           (gt_ref_clk_clk_n),
    .gt_ref_clk_clk_p           (gt_ref_clk_clk_p),
    .gt_rxn_in                  (gt_rxn_in),
    .gt_rxp_in                  (gt_rxp_in),
    .gt_txn_out                 (gt_txn_out),
    .gt_txp_out                 (gt_txp_out)
);

cmac_fifo cmac_fifo(
    .QDMA_axis_aclk(QDMA_axi_aclk),
    .CMAC_axis_aclk(CMAC_axi_aclk),
    .tx_fifo_aresetn(tx_fifo_aresetn),
    .rx_fifo_aresetn(rx_fifo_aresetn),
    .reset_counter(reset_counter),

    .CMAC_in_tdata(CMAC_in_tdata),
    .CMAC_in_tkeep(CMAC_in_tkeep),
    .CMAC_in_tlast(CMAC_in_tlast),
    .CMAC_in_tready(CMAC_in_tready),
    .CMAC_in_tvalid(CMAC_in_tvalid),

    .tx_axis_tdata(tx_axis_tdata),
    .tx_axis_tkeep(tx_axis_tkeep),
    .tx_axis_tlast(tx_axis_tlast),
    .tx_axis_tready(tx_axis_tready),
    .tx_axis_tvalid(tx_axis_tvalid),

    .rx_axis_tdata(rx_axis_tdata),
    .rx_axis_tkeep(rx_axis_tkeep),
    .rx_axis_tlast(rx_axis_tlast),
    .rx_axis_tvalid(rx_axis_tvalid),
    .rx_axis_tuser(rx_axis_tuser),
    //ready is not available in CMAC's rx port
    
    .CMAC_out_tdata(CMAC_out_tdata),
    .CMAC_out_tkeep(CMAC_out_tkeep),
    .CMAC_out_tlast(CMAC_out_tlast),
    .CMAC_out_tready(CMAC_out_tready),
    .CMAC_out_tvalid(CMAC_out_tvalid),
    .CMAC_out_tuser (CMAC_out_tuser)
);

qdma_stm_h2c_stub h2c_stub(
    .clk            (QDMA_axi_aclk),
    .rst_n          (QDMA_axi_aresetn),
    //Input from QDMA
    .in_axis_tdata  (QDMA_h2c_tdata),
    .in_axis_tuser  (QDMA_h2c_tuser_net),
    .in_axis_tlast  (QDMA_h2c_tlast),
    .in_axis_tvalid (QDMA_h2c_tvalid),
    .in_axis_tready (QDMA_h2c_tready_lpbk),
    //Output to FAB
    .out_axis_tdata (QDMA_h2c_stub_out_tdata),
    .out_axis_tvalid(QDMA_h2c_stub_out_tvalid),
    .out_axis_tdest (QDMA_h2c_stub_out_tdest),//unused; USED TO DIVIDE PACKAGE; tuser's qid[5:0].
    .out_axis_tuser (QDMA_h2c_stub_out_tuser),//unused; 0 for PLD and 1 for HDR
    .out_axis_tlast (QDMA_h2c_stub_out_tlast),
    .out_axis_tready(QDMA_h2c_stub_out_tready)
);

PackageHandler my_package_handler( //user_logic
    .clock                       (QDMA_axi_aclk),
    .reset                       (!QDMA_axi_aresetn),

    .io_QDMA_h2c_stub_out_tdata  (QDMA_h2c_stub_out_tdata),
    //.io_QDMA_h2c_stub_out_tdest  (QDMA_h2c_stub_out_tdest),
    .io_QDMA_h2c_stub_out_tuser  (QDMA_h2c_stub_out_tuser),
    .io_QDMA_h2c_stub_out_tlast  (QDMA_h2c_stub_out_tlast),
    .io_QDMA_h2c_stub_out_tready (QDMA_h2c_stub_out_tready),
    .io_QDMA_h2c_stub_out_tvalid (QDMA_h2c_stub_out_tvalid),

    .io_CMAC_in_tdata            (CMAC_in_tdata),
    .io_CMAC_in_tkeep            (CMAC_in_tkeep),
    .io_CMAC_in_tlast            (CMAC_in_tlast),
    .io_CMAC_in_tready           (CMAC_in_tready),
    .io_CMAC_in_tvalid           (CMAC_in_tvalid),
    .io_CMAC_in_tuser            (),

    .io_CMAC_out_tdata           (CMAC_out_tdata),
    .io_CMAC_out_tkeep           (CMAC_out_tkeep),
    .io_CMAC_out_tlast           (CMAC_out_tlast),
    .io_CMAC_out_tready          (CMAC_out_tready),
    .io_CMAC_out_tvalid          (CMAC_out_tvalid),
    .io_CMAC_out_tuser           (CMAC_out_tuser),

    .io_QDMA_c2h_stub_in_tdata   (QDMA_c2h_stub_in_tdata),
    .io_QDMA_c2h_stub_in_tuser   (QDMA_c2h_stub_in_tuser),
    .io_QDMA_c2h_stub_in_tlast   (QDMA_c2h_stub_in_tlast),
    .io_QDMA_c2h_stub_in_tready  (QDMA_c2h_stub_in_tready),
    .io_QDMA_c2h_stub_in_tvalid  (QDMA_c2h_stub_in_tvalid),

    .io_extern_config_c2h_match_op     (c2h_match_op),
    .io_extern_config_c2h_match_arg_0     (c2h_match_arg0),
    .io_extern_config_c2h_match_arg_1     (c2h_match_arg1),
    .io_extern_config_c2h_match_arg_2     (c2h_match_arg2),
    .io_extern_config_c2h_match_arg_3     (c2h_match_arg3),
    .io_extern_config_c2h_match_arg_4     (c2h_match_arg4),
    .io_extern_config_c2h_match_arg_5     (c2h_match_arg5),
    .io_extern_config_c2h_match_arg_6     (c2h_match_arg6),
    .io_extern_config_c2h_match_arg_7     (c2h_match_arg7),
    .io_extern_config_c2h_match_arg_8     (c2h_match_arg8),
    .io_extern_config_c2h_match_arg_9     (c2h_match_arg9),
    .io_extern_config_c2h_match_arg_10     (c2h_match_arg10),
    .io_extern_config_c2h_match_arg_11     (c2h_match_arg11),
    .io_extern_config_c2h_match_arg_12     (c2h_match_arg12),
    .io_extern_config_c2h_match_arg_13     (c2h_match_arg13),
    .io_extern_config_c2h_match_arg_14     (c2h_match_arg14),
    .io_extern_config_c2h_match_arg_15     (c2h_match_arg15),
    .io_reset_counter            (reset_counter),
    .io_h2c_err_counter          (QDMA_h2c_err_counter),
    .io_h2c_pack_counter         (QDMA_h2c_pack_counter),
    .io_c2h_err_counter          (QDMA_c2h_err_counter),
    .io_c2h_pack_counter         (QDMA_c2h_pack_counter)
);

qdma_stm_c2h_stub c2h_stub(
    .clk                (QDMA_axi_aclk),
    .rst_n              (QDMA_axi_aresetn),
    //Input from FAB
    .in_axis_tdata      (QDMA_c2h_stub_in_tdata),
    .in_axis_tuser      (QDMA_c2h_stub_in_tuser),
    .in_axis_tlast      (QDMA_c2h_stub_in_tlast),
    .in_axis_tvalid     (QDMA_c2h_stub_in_tvalid),
    .in_axis_tready     (QDMA_c2h_stub_in_tready),
    //HDR output to QDMA
    .out_axis_cmp_data  (QDMA_c2h_stub_out_cmp_data),
    .out_axis_cmp_ctrl  (QDMA_c2h_stub_out_cmp_ctrl),
    .out_axis_cmp_tlast (),//no use in qdma_ex
    .out_axis_cmp_tvalid(QDMA_c2h_stub_out_cmp_tvalid),
    .out_axis_cmp_tready(QDMA_c2h_cmpt_tready),
    //PLD output to QDMA
    .out_axis_pld_data  (QDMA_c2h_stub_out_data),
    .out_axis_pld_ctrl  (QDMA_c2h_stub_out_ctrl),
    .out_axis_pld_mty   (QDMA_c2h_stub_out_mty),
    .out_axis_pld_tlast (QDMA_c2h_stub_out_tlast),
    .out_axis_pld_tvalid(QDMA_c2h_stub_out_tvalid),
    .out_axis_pld_tready(QDMA_c2h_tready)
);

user_control
  #(
    .C_DATA_WIDTH (512),
    .QID_MAX (2048),
    .PF0_M_AXILITE_ADDR_MSK( 32'h00000FFF),
    .PF1_M_AXILITE_ADDR_MSK( 32'h00000FFF),
    .PF2_M_AXILITE_ADDR_MSK( 32'h00000FFF),
    .PF3_M_AXILITE_ADDR_MSK( 32'h00000FFF),
    .PF0_VF_M_AXILITE_ADDR_MSK( 32'h00000FFF),
    .PF1_VF_M_AXILITE_ADDR_MSK( 32'h00000FFF),
    .PF2_VF_M_AXILITE_ADDR_MSK( 32'h00000FFF),
    .PF3_VF_M_AXILITE_ADDR_MSK( 32'h00000FFF),
    .PF0_PCIEBAR2AXIBAR( 32'h0000000000000000),
    .PF1_PCIEBAR2AXIBAR( 32'h0000000010000000),
    .PF2_PCIEBAR2AXIBAR( 32'h0000000020000000),
    .PF3_PCIEBAR2AXIBAR( 32'h0000000030000000),
    .PF0_VF_PCIEBAR2AXIBAR( 32'h0000000040000000),
    .PF1_VF_PCIEBAR2AXIBAR( 32'h0000000050000000),
    .PF2_VF_PCIEBAR2AXIBAR( 32'h0000000060000000),
    .PF3_VF_PCIEBAR2AXIBAR( 32'h0000000070000000),
    .TM_DSC_BITS (16)
  )
  user_control_i
  (
    .axi_aclk         (QDMA_axi_aclk),
    .axi_aresetn      (QDMA_axi_aresetn),
    .m_axil_wvalid    (QDMA_axil_wvalid),
    .m_axil_wready    (QDMA_axil_wready),
    .m_axil_rvalid    (QDMA_axil_rvalid),
    .m_axil_rready    (QDMA_axil_rready),
    .m_axil_awaddr    (QDMA_axil_awaddr),
    .m_axil_wdata     (QDMA_axil_wdata),
    .m_axil_rdata     (QDMA_axil_rdata),
    .m_axil_rdata_bram(QDMA_axil_rdata_bram),
    .m_axil_araddr    (QDMA_axil_araddr[31:0]),
    .m_axil_arvalid   (QDMA_axil_arvalid),
    .soft_reset_n     (QDMA_soft_reset_n),

    .reset_counter    (reset_counter),
    .c2h_match_op     (c2h_match_op),
    .c2h_match_arg0     (c2h_match_arg0),
    .c2h_match_arg1     (c2h_match_arg1),
    .c2h_match_arg2     (c2h_match_arg2),
    .c2h_match_arg3     (c2h_match_arg3),
    .c2h_match_arg4     (c2h_match_arg4),
    .c2h_match_arg5     (c2h_match_arg5),
    .c2h_match_arg6     (c2h_match_arg6),
    .c2h_match_arg7     (c2h_match_arg7),
    .c2h_match_arg8     (c2h_match_arg8),
    .c2h_match_arg9     (c2h_match_arg9),
    .c2h_match_arg10    (c2h_match_arg10),
    .c2h_match_arg11    (c2h_match_arg11),
    .c2h_match_arg12    (c2h_match_arg12),
    .c2h_match_arg13    (c2h_match_arg13),
    .c2h_match_arg14    (c2h_match_arg14),
    .c2h_match_arg15    (c2h_match_arg15),
    .h2c_err_counter          (QDMA_h2c_err_counter),
    .h2c_pack_counter         (QDMA_h2c_pack_counter),
    .c2h_err_counter          (QDMA_c2h_err_counter),
    .c2h_pack_counter         (QDMA_c2h_pack_counter)
  );
  
    // Block ram for the AXI Lite interface
  blk_mem_gen_0 blk_mem_axiLM_inst (
    .s_aclk        (QDMA_axi_aclk),
    .s_aresetn     (QDMA_axi_aresetn),
    .s_axi_awaddr  (QDMA_axil_awaddr[31:0]),
    .s_axi_awvalid (QDMA_axil_awvalid),
    .s_axi_awready (QDMA_axil_awready),
    .s_axi_wdata   (QDMA_axil_wdata[31:0]),
    .s_axi_wstrb   (QDMA_axil_wstrb[3:0]),
    .s_axi_wvalid  (QDMA_axil_wvalid),
    .s_axi_wready  (QDMA_axil_wready),
    .s_axi_bresp   (QDMA_axil_bresp),
    .s_axi_bvalid  (QDMA_axil_bvalid),
    .s_axi_bready  (QDMA_axil_bready),
    .s_axi_araddr  (QDMA_axil_araddr[31:0]),
    .s_axi_arvalid (QDMA_axil_arvalid),
    .s_axi_arready (QDMA_axil_arready),
    .s_axi_rdata   (QDMA_axil_rdata_bram),
    .s_axi_rresp   (QDMA_axil_rresp),
    .s_axi_rvalid  (QDMA_axil_rvalid),
    .s_axi_rready  (QDMA_axil_rready)
  );

endmodule
