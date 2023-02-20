//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Sat Sep  3 15:01:24 2022
//Host        : Gwins7-Legion running 64-bit major release  (build 9200)
//Command     : generate_target mpsoc_wrapper.bd
//Design      : mpsoc_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mpsoc_wrapper
   (CMAC_in_tdata,
    CMAC_in_tkeep,
    CMAC_in_tlast,
    CMAC_in_tready,
    CMAC_in_tvalid,
    CMAC_out_tdata,
    CMAC_out_tkeep,
    CMAC_out_tlast,
    CMAC_out_tready,
    CMAC_out_tvalid,
    QDMA_axi_aclk,
    QDMA_axi_aresetn,
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
    QDMA_sys_clk,
    QDMA_sys_clk_gt,
    QDMA_sys_rst_n,
    gt_ref_clk_clk_n,
    gt_ref_clk_clk_p,
    gt_rxn_in,
    gt_rxp_in,
    gt_txn_out,
    gt_txp_out);
  input [511:0]CMAC_in_tdata;
  input [63:0]CMAC_in_tkeep;
  input CMAC_in_tlast;
  output CMAC_in_tready;
  input CMAC_in_tvalid;
  output [511:0]CMAC_out_tdata;
  output [63:0]CMAC_out_tkeep;
  output CMAC_out_tlast;
  input CMAC_out_tready;
  output CMAC_out_tvalid;
  output QDMA_axi_aclk;
  output QDMA_axi_aresetn;
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
  input QDMA_sys_clk;
  input QDMA_sys_clk_gt;
  input QDMA_sys_rst_n;
  input gt_ref_clk_clk_n;
  input gt_ref_clk_clk_p;
  input [3:0]gt_rxn_in;
  input [3:0]gt_rxp_in;
  output [3:0]gt_txn_out;
  output [3:0]gt_txp_out;

  wire [511:0]CMAC_in_tdata;
  wire [63:0]CMAC_in_tkeep;
  wire CMAC_in_tlast;
  wire CMAC_in_tready;
  wire CMAC_in_tvalid;
  wire [511:0]CMAC_out_tdata;
  wire [63:0]CMAC_out_tkeep;
  wire CMAC_out_tlast;
  wire CMAC_out_tready;
  wire CMAC_out_tvalid;
  wire QDMA_axi_aclk;
  wire QDMA_axi_aresetn;
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
  wire QDMA_sys_clk;
  wire QDMA_sys_clk_gt;
  wire QDMA_sys_rst_n;
  wire gt_ref_clk_clk_n;
  wire gt_ref_clk_clk_p;
  wire [3:0]gt_rxn_in;
  wire [3:0]gt_rxp_in;
  wire [3:0]gt_txn_out;
  wire [3:0]gt_txp_out;

  mpsoc mpsoc_i
       (.CMAC_in_tdata(CMAC_in_tdata),
        .CMAC_in_tkeep(CMAC_in_tkeep),
        .CMAC_in_tlast(CMAC_in_tlast),
        .CMAC_in_tready(CMAC_in_tready),
        .CMAC_in_tvalid(CMAC_in_tvalid),
        .CMAC_out_tdata(CMAC_out_tdata),
        .CMAC_out_tkeep(CMAC_out_tkeep),
        .CMAC_out_tlast(CMAC_out_tlast),
        .CMAC_out_tready(CMAC_out_tready),
        .CMAC_out_tvalid(CMAC_out_tvalid),
        .QDMA_axi_aclk(QDMA_axi_aclk),
        .QDMA_axi_aresetn(QDMA_axi_aresetn),
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
        .QDMA_sys_clk(QDMA_sys_clk),
        .QDMA_sys_clk_gt(QDMA_sys_clk_gt),
        .QDMA_sys_rst_n(QDMA_sys_rst_n),
        .gt_ref_clk_clk_n(gt_ref_clk_clk_n),
        .gt_ref_clk_clk_p(gt_ref_clk_clk_p),
        .gt_rxn_in(gt_rxn_in),
        .gt_rxp_in(gt_rxp_in),
        .gt_txn_out(gt_txn_out),
        .gt_txp_out(gt_txp_out));
endmodule
