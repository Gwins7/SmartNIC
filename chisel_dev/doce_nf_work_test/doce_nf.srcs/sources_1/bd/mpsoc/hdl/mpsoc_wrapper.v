//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
//Date        : Thu Dec 15 17:53:31 2022
//Host        : localhost.localdomain running 64-bit unknown
//Command     : generate_target mpsoc_wrapper.bd
//Design      : mpsoc_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mpsoc_wrapper
   (CMAC_axi_aclk,
    QDMA_axi_aclk,
    QDMA_axi_aresetn,
    QDMA_axil_araddr,
    QDMA_axil_arprot,
    QDMA_axil_arready,
    QDMA_axil_aruser,
    QDMA_axil_arvalid,
    QDMA_axil_awaddr,
    QDMA_axil_awprot,
    QDMA_axil_awready,
    QDMA_axil_awuser,
    QDMA_axil_awvalid,
    QDMA_axil_bready,
    QDMA_axil_bresp,
    QDMA_axil_bvalid,
    QDMA_axil_rdata,
    QDMA_axil_rready,
    QDMA_axil_rresp,
    QDMA_axil_rvalid,
    QDMA_axil_wdata,
    QDMA_axil_wready,
    QDMA_axil_wstrb,
    QDMA_axil_wvalid,
    QDMA_c2h_cmpt_cmpt_type,
    QDMA_c2h_cmpt_col_idx,
    QDMA_c2h_cmpt_data,
    QDMA_c2h_cmpt_dpar,
    QDMA_c2h_cmpt_err_idx,
    QDMA_c2h_cmpt_marker,
    QDMA_c2h_cmpt_port_id,
    QDMA_c2h_cmpt_qid,
    QDMA_c2h_cmpt_size,
    QDMA_c2h_cmpt_tready,
    QDMA_c2h_cmpt_tvalid,
    QDMA_c2h_cmpt_user_trig,
    QDMA_c2h_cmpt_wait_pld_pkt_id,
    QDMA_c2h_ctrl_has_cmpt,
    QDMA_c2h_ctrl_len,
    QDMA_c2h_ctrl_marker,
    QDMA_c2h_ctrl_port_id,
    QDMA_c2h_ctrl_qid,
    QDMA_c2h_ecc,
    QDMA_c2h_mty,
    QDMA_c2h_tcrc,
    QDMA_c2h_tdata,
    QDMA_c2h_tlast,
    QDMA_c2h_tready,
    QDMA_c2h_tvalid,
    QDMA_h2c_err,
    QDMA_h2c_mdata,
    QDMA_h2c_mty,
    QDMA_h2c_port_id,
    QDMA_h2c_qid,
    QDMA_h2c_tcrc,
    QDMA_h2c_tdata,
    QDMA_h2c_tlast,
    QDMA_h2c_tready,
    QDMA_h2c_tvalid,
    QDMA_h2c_zero_byte,
    QDMA_pcie_mgt_rxn,
    QDMA_pcie_mgt_rxp,
    QDMA_pcie_mgt_txn,
    QDMA_pcie_mgt_txp,
    QDMA_soft_reset_n,
    QDMA_sys_clk,
    QDMA_sys_clk_gt,
    QDMA_sys_rst_n,
    gt_ref_clk_clk_n,
    gt_ref_clk_clk_p,
    gt_rxn_in,
    gt_rxp_in,
    gt_txn_out,
    gt_txp_out,
    rx_axis_tdata,
    rx_axis_tkeep,
    rx_axis_tlast,
    rx_axis_tuser,
    rx_axis_tvalid,
    rx_fifo_aresetn,
    tx_axis_tdata,
    tx_axis_tkeep,
    tx_axis_tlast,
    tx_axis_tready,
    tx_axis_tuser,
    tx_axis_tvalid,
    tx_fifo_aresetn);
  output CMAC_axi_aclk;
  output QDMA_axi_aclk;
  output QDMA_axi_aresetn;
  output [31:0]QDMA_axil_araddr;
  output [2:0]QDMA_axil_arprot;
  input QDMA_axil_arready;
  output [54:0]QDMA_axil_aruser;
  output QDMA_axil_arvalid;
  output [31:0]QDMA_axil_awaddr;
  output [2:0]QDMA_axil_awprot;
  input QDMA_axil_awready;
  output [54:0]QDMA_axil_awuser;
  output QDMA_axil_awvalid;
  output QDMA_axil_bready;
  input [1:0]QDMA_axil_bresp;
  input QDMA_axil_bvalid;
  input [31:0]QDMA_axil_rdata;
  output QDMA_axil_rready;
  input [1:0]QDMA_axil_rresp;
  input QDMA_axil_rvalid;
  output [31:0]QDMA_axil_wdata;
  input QDMA_axil_wready;
  output [3:0]QDMA_axil_wstrb;
  output QDMA_axil_wvalid;
  input [1:0]QDMA_c2h_cmpt_cmpt_type;
  input [2:0]QDMA_c2h_cmpt_col_idx;
  input [511:0]QDMA_c2h_cmpt_data;
  input [15:0]QDMA_c2h_cmpt_dpar;
  input [2:0]QDMA_c2h_cmpt_err_idx;
  input QDMA_c2h_cmpt_marker;
  input [2:0]QDMA_c2h_cmpt_port_id;
  input [10:0]QDMA_c2h_cmpt_qid;
  input [1:0]QDMA_c2h_cmpt_size;
  output QDMA_c2h_cmpt_tready;
  input QDMA_c2h_cmpt_tvalid;
  input QDMA_c2h_cmpt_user_trig;
  input [15:0]QDMA_c2h_cmpt_wait_pld_pkt_id;
  input QDMA_c2h_ctrl_has_cmpt;
  input [15:0]QDMA_c2h_ctrl_len;
  input QDMA_c2h_ctrl_marker;
  input [2:0]QDMA_c2h_ctrl_port_id;
  input [10:0]QDMA_c2h_ctrl_qid;
  input [6:0]QDMA_c2h_ecc;
  input [5:0]QDMA_c2h_mty;
  input [31:0]QDMA_c2h_tcrc;
  input [511:0]QDMA_c2h_tdata;
  input QDMA_c2h_tlast;
  output QDMA_c2h_tready;
  input QDMA_c2h_tvalid;
  output QDMA_h2c_err;
  output [31:0]QDMA_h2c_mdata;
  output [5:0]QDMA_h2c_mty;
  output [2:0]QDMA_h2c_port_id;
  output [10:0]QDMA_h2c_qid;
  output [31:0]QDMA_h2c_tcrc;
  output [511:0]QDMA_h2c_tdata;
  output QDMA_h2c_tlast;
  input QDMA_h2c_tready;
  output QDMA_h2c_tvalid;
  output QDMA_h2c_zero_byte;
  input [15:0]QDMA_pcie_mgt_rxn;
  input [15:0]QDMA_pcie_mgt_rxp;
  output [15:0]QDMA_pcie_mgt_txn;
  output [15:0]QDMA_pcie_mgt_txp;
  input QDMA_soft_reset_n;
  input QDMA_sys_clk;
  input QDMA_sys_clk_gt;
  input QDMA_sys_rst_n;
  input gt_ref_clk_clk_n;
  input gt_ref_clk_clk_p;
  input [3:0]gt_rxn_in;
  input [3:0]gt_rxp_in;
  output [3:0]gt_txn_out;
  output [3:0]gt_txp_out;
  output [511:0]rx_axis_tdata;
  output [63:0]rx_axis_tkeep;
  output rx_axis_tlast;
  output rx_axis_tuser;
  output rx_axis_tvalid;
  output [0:0]rx_fifo_aresetn;
  input [511:0]tx_axis_tdata;
  input [63:0]tx_axis_tkeep;
  input tx_axis_tlast;
  output tx_axis_tready;
  input tx_axis_tuser;
  input tx_axis_tvalid;
  output [0:0]tx_fifo_aresetn;

  wire CMAC_axi_aclk;
  wire QDMA_axi_aclk;
  wire QDMA_axi_aresetn;
  wire [31:0]QDMA_axil_araddr;
  wire [2:0]QDMA_axil_arprot;
  wire QDMA_axil_arready;
  wire [54:0]QDMA_axil_aruser;
  wire QDMA_axil_arvalid;
  wire [31:0]QDMA_axil_awaddr;
  wire [2:0]QDMA_axil_awprot;
  wire QDMA_axil_awready;
  wire [54:0]QDMA_axil_awuser;
  wire QDMA_axil_awvalid;
  wire QDMA_axil_bready;
  wire [1:0]QDMA_axil_bresp;
  wire QDMA_axil_bvalid;
  wire [31:0]QDMA_axil_rdata;
  wire QDMA_axil_rready;
  wire [1:0]QDMA_axil_rresp;
  wire QDMA_axil_rvalid;
  wire [31:0]QDMA_axil_wdata;
  wire QDMA_axil_wready;
  wire [3:0]QDMA_axil_wstrb;
  wire QDMA_axil_wvalid;
  wire [1:0]QDMA_c2h_cmpt_cmpt_type;
  wire [2:0]QDMA_c2h_cmpt_col_idx;
  wire [511:0]QDMA_c2h_cmpt_data;
  wire [15:0]QDMA_c2h_cmpt_dpar;
  wire [2:0]QDMA_c2h_cmpt_err_idx;
  wire QDMA_c2h_cmpt_marker;
  wire [2:0]QDMA_c2h_cmpt_port_id;
  wire [10:0]QDMA_c2h_cmpt_qid;
  wire [1:0]QDMA_c2h_cmpt_size;
  wire QDMA_c2h_cmpt_tready;
  wire QDMA_c2h_cmpt_tvalid;
  wire QDMA_c2h_cmpt_user_trig;
  wire [15:0]QDMA_c2h_cmpt_wait_pld_pkt_id;
  wire QDMA_c2h_ctrl_has_cmpt;
  wire [15:0]QDMA_c2h_ctrl_len;
  wire QDMA_c2h_ctrl_marker;
  wire [2:0]QDMA_c2h_ctrl_port_id;
  wire [10:0]QDMA_c2h_ctrl_qid;
  wire [6:0]QDMA_c2h_ecc;
  wire [5:0]QDMA_c2h_mty;
  wire [31:0]QDMA_c2h_tcrc;
  wire [511:0]QDMA_c2h_tdata;
  wire QDMA_c2h_tlast;
  wire QDMA_c2h_tready;
  wire QDMA_c2h_tvalid;
  wire QDMA_h2c_err;
  wire [31:0]QDMA_h2c_mdata;
  wire [5:0]QDMA_h2c_mty;
  wire [2:0]QDMA_h2c_port_id;
  wire [10:0]QDMA_h2c_qid;
  wire [31:0]QDMA_h2c_tcrc;
  wire [511:0]QDMA_h2c_tdata;
  wire QDMA_h2c_tlast;
  wire QDMA_h2c_tready;
  wire QDMA_h2c_tvalid;
  wire QDMA_h2c_zero_byte;
  wire [15:0]QDMA_pcie_mgt_rxn;
  wire [15:0]QDMA_pcie_mgt_rxp;
  wire [15:0]QDMA_pcie_mgt_txn;
  wire [15:0]QDMA_pcie_mgt_txp;
  wire QDMA_soft_reset_n;
  wire QDMA_sys_clk;
  wire QDMA_sys_clk_gt;
  wire QDMA_sys_rst_n;
  wire gt_ref_clk_clk_n;
  wire gt_ref_clk_clk_p;
  wire [3:0]gt_rxn_in;
  wire [3:0]gt_rxp_in;
  wire [3:0]gt_txn_out;
  wire [3:0]gt_txp_out;
  wire [511:0]rx_axis_tdata;
  wire [63:0]rx_axis_tkeep;
  wire rx_axis_tlast;
  wire rx_axis_tuser;
  wire rx_axis_tvalid;
  wire [0:0]rx_fifo_aresetn;
  wire [511:0]tx_axis_tdata;
  wire [63:0]tx_axis_tkeep;
  wire tx_axis_tlast;
  wire tx_axis_tready;
  wire tx_axis_tuser;
  wire tx_axis_tvalid;
  wire [0:0]tx_fifo_aresetn;

  mpsoc mpsoc_i
       (.CMAC_axi_aclk(CMAC_axi_aclk),
        .QDMA_axi_aclk(QDMA_axi_aclk),
        .QDMA_axi_aresetn(QDMA_axi_aresetn),
        .QDMA_axil_araddr(QDMA_axil_araddr),
        .QDMA_axil_arprot(QDMA_axil_arprot),
        .QDMA_axil_arready(QDMA_axil_arready),
        .QDMA_axil_aruser(QDMA_axil_aruser),
        .QDMA_axil_arvalid(QDMA_axil_arvalid),
        .QDMA_axil_awaddr(QDMA_axil_awaddr),
        .QDMA_axil_awprot(QDMA_axil_awprot),
        .QDMA_axil_awready(QDMA_axil_awready),
        .QDMA_axil_awuser(QDMA_axil_awuser),
        .QDMA_axil_awvalid(QDMA_axil_awvalid),
        .QDMA_axil_bready(QDMA_axil_bready),
        .QDMA_axil_bresp(QDMA_axil_bresp),
        .QDMA_axil_bvalid(QDMA_axil_bvalid),
        .QDMA_axil_rdata(QDMA_axil_rdata),
        .QDMA_axil_rready(QDMA_axil_rready),
        .QDMA_axil_rresp(QDMA_axil_rresp),
        .QDMA_axil_rvalid(QDMA_axil_rvalid),
        .QDMA_axil_wdata(QDMA_axil_wdata),
        .QDMA_axil_wready(QDMA_axil_wready),
        .QDMA_axil_wstrb(QDMA_axil_wstrb),
        .QDMA_axil_wvalid(QDMA_axil_wvalid),
        .QDMA_c2h_cmpt_cmpt_type(QDMA_c2h_cmpt_cmpt_type),
        .QDMA_c2h_cmpt_col_idx(QDMA_c2h_cmpt_col_idx),
        .QDMA_c2h_cmpt_data(QDMA_c2h_cmpt_data),
        .QDMA_c2h_cmpt_dpar(QDMA_c2h_cmpt_dpar),
        .QDMA_c2h_cmpt_err_idx(QDMA_c2h_cmpt_err_idx),
        .QDMA_c2h_cmpt_marker(QDMA_c2h_cmpt_marker),
        .QDMA_c2h_cmpt_port_id(QDMA_c2h_cmpt_port_id),
        .QDMA_c2h_cmpt_qid(QDMA_c2h_cmpt_qid),
        .QDMA_c2h_cmpt_size(QDMA_c2h_cmpt_size),
        .QDMA_c2h_cmpt_tready(QDMA_c2h_cmpt_tready),
        .QDMA_c2h_cmpt_tvalid(QDMA_c2h_cmpt_tvalid),
        .QDMA_c2h_cmpt_user_trig(QDMA_c2h_cmpt_user_trig),
        .QDMA_c2h_cmpt_wait_pld_pkt_id(QDMA_c2h_cmpt_wait_pld_pkt_id),
        .QDMA_c2h_ctrl_has_cmpt(QDMA_c2h_ctrl_has_cmpt),
        .QDMA_c2h_ctrl_len(QDMA_c2h_ctrl_len),
        .QDMA_c2h_ctrl_marker(QDMA_c2h_ctrl_marker),
        .QDMA_c2h_ctrl_port_id(QDMA_c2h_ctrl_port_id),
        .QDMA_c2h_ctrl_qid(QDMA_c2h_ctrl_qid),
        .QDMA_c2h_ecc(QDMA_c2h_ecc),
        .QDMA_c2h_mty(QDMA_c2h_mty),
        .QDMA_c2h_tcrc(QDMA_c2h_tcrc),
        .QDMA_c2h_tdata(QDMA_c2h_tdata),
        .QDMA_c2h_tlast(QDMA_c2h_tlast),
        .QDMA_c2h_tready(QDMA_c2h_tready),
        .QDMA_c2h_tvalid(QDMA_c2h_tvalid),
        .QDMA_h2c_err(QDMA_h2c_err),
        .QDMA_h2c_mdata(QDMA_h2c_mdata),
        .QDMA_h2c_mty(QDMA_h2c_mty),
        .QDMA_h2c_port_id(QDMA_h2c_port_id),
        .QDMA_h2c_qid(QDMA_h2c_qid),
        .QDMA_h2c_tcrc(QDMA_h2c_tcrc),
        .QDMA_h2c_tdata(QDMA_h2c_tdata),
        .QDMA_h2c_tlast(QDMA_h2c_tlast),
        .QDMA_h2c_tready(QDMA_h2c_tready),
        .QDMA_h2c_tvalid(QDMA_h2c_tvalid),
        .QDMA_h2c_zero_byte(QDMA_h2c_zero_byte),
        .QDMA_pcie_mgt_rxn(QDMA_pcie_mgt_rxn),
        .QDMA_pcie_mgt_rxp(QDMA_pcie_mgt_rxp),
        .QDMA_pcie_mgt_txn(QDMA_pcie_mgt_txn),
        .QDMA_pcie_mgt_txp(QDMA_pcie_mgt_txp),
        .QDMA_soft_reset_n(QDMA_soft_reset_n),
        .QDMA_sys_clk(QDMA_sys_clk),
        .QDMA_sys_clk_gt(QDMA_sys_clk_gt),
        .QDMA_sys_rst_n(QDMA_sys_rst_n),
        .gt_ref_clk_clk_n(gt_ref_clk_clk_n),
        .gt_ref_clk_clk_p(gt_ref_clk_clk_p),
        .gt_rxn_in(gt_rxn_in),
        .gt_rxp_in(gt_rxp_in),
        .gt_txn_out(gt_txn_out),
        .gt_txp_out(gt_txp_out),
        .rx_axis_tdata(rx_axis_tdata),
        .rx_axis_tkeep(rx_axis_tkeep),
        .rx_axis_tlast(rx_axis_tlast),
        .rx_axis_tuser(rx_axis_tuser),
        .rx_axis_tvalid(rx_axis_tvalid),
        .rx_fifo_aresetn(rx_fifo_aresetn),
        .tx_axis_tdata(tx_axis_tdata),
        .tx_axis_tkeep(tx_axis_tkeep),
        .tx_axis_tlast(tx_axis_tlast),
        .tx_axis_tready(tx_axis_tready),
        .tx_axis_tuser(tx_axis_tuser),
        .tx_axis_tvalid(tx_axis_tvalid),
        .tx_fifo_aresetn(tx_fifo_aresetn));
endmodule
