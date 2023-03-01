//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
//Date        : Thu Sep 15 10:30:13 2022
//Host        : localhost.localdomain running 64-bit unknown
//Command     : generate_target mpsoc.bd
//Design      : mpsoc
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "mpsoc,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=mpsoc,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=16,numReposBlks=16,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_zynq_ultra_ps_e_cnt=11,synth_mode=Global}" *) (* HW_HANDOFF = "mpsoc.hwdef" *) 
module mpsoc
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
    QDMA_c2h_drop_drop,
    QDMA_c2h_drop_error,
    QDMA_c2h_drop_last,
    QDMA_c2h_drop_qid,
    QDMA_c2h_drop_status_cmp,
    QDMA_c2h_drop_valid,
    QDMA_c2h_ecc,
    QDMA_c2h_mty,
    QDMA_c2h_tcrc,
    QDMA_c2h_tdata,
    QDMA_c2h_tlast,
    QDMA_c2h_tready,
    QDMA_c2h_tvalid,
    QDMA_dsc_crdt_in_crdt,
    QDMA_dsc_crdt_in_dir,
    QDMA_dsc_crdt_in_fence,
    QDMA_dsc_crdt_in_qid,
    QDMA_dsc_crdt_in_rdy,
    QDMA_dsc_crdt_in_valid,
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
    QDMA_tm_dsc_sts_avl,
    QDMA_tm_dsc_sts_byp,
    QDMA_tm_dsc_sts_dir,
    QDMA_tm_dsc_sts_error,
    QDMA_tm_dsc_sts_irq_arm,
    QDMA_tm_dsc_sts_mm,
    QDMA_tm_dsc_sts_pidx,
    QDMA_tm_dsc_sts_port_id,
    QDMA_tm_dsc_sts_qen,
    QDMA_tm_dsc_sts_qid,
    QDMA_tm_dsc_sts_qinv,
    QDMA_tm_dsc_sts_rdy,
    QDMA_tm_dsc_sts_valid,
    QDMA_usr_irq_ack,
    QDMA_usr_irq_fail,
    QDMA_usr_irq_fnc,
    QDMA_usr_irq_valid,
    QDMA_usr_irq_vec,
    gt_ref_clk_clk_n,
    gt_ref_clk_clk_p,
    gt_rxn_in,
    gt_rxp_in,
    gt_txn_out,
    gt_txp_out);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 CMAC_in TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CMAC_in, CLK_DOMAIN mpsoc_qdma_0_0_axi_aclk, FREQ_HZ 250000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [511:0]CMAC_in_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 CMAC_in TKEEP" *) input [63:0]CMAC_in_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 CMAC_in TLAST" *) input CMAC_in_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 CMAC_in TREADY" *) output CMAC_in_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 CMAC_in TVALID" *) input CMAC_in_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 CMAC_out TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CMAC_out, CLK_DOMAIN mpsoc_qdma_0_0_axi_aclk, FREQ_HZ 250000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [511:0]CMAC_out_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 CMAC_out TKEEP" *) output [63:0]CMAC_out_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 CMAC_out TLAST" *) output CMAC_out_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 CMAC_out TREADY" *) input CMAC_out_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 CMAC_out TVALID" *) output CMAC_out_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.QDMA_AXI_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.QDMA_AXI_ACLK, ASSOCIATED_BUSIF CMAC_in:CMAC_out:QDMA_axil, CLK_DOMAIN mpsoc_qdma_0_0_axi_aclk, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) output QDMA_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.QDMA_AXI_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.QDMA_AXI_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) output QDMA_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME QDMA_axil, ADDR_WIDTH 32, ARUSER_WIDTH 55, AWUSER_WIDTH 55, BUSER_WIDTH 0, CLK_DOMAIN mpsoc_qdma_0_0_axi_aclk, DATA_WIDTH 32, FREQ_HZ 250000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [31:0]QDMA_axil_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil ARPROT" *) output [2:0]QDMA_axil_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil ARREADY" *) input QDMA_axil_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil ARUSER" *) output [54:0]QDMA_axil_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil ARVALID" *) output QDMA_axil_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil AWADDR" *) output [31:0]QDMA_axil_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil AWPROT" *) output [2:0]QDMA_axil_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil AWREADY" *) input QDMA_axil_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil AWUSER" *) output [54:0]QDMA_axil_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil AWVALID" *) output QDMA_axil_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil BREADY" *) output QDMA_axil_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil BRESP" *) input [1:0]QDMA_axil_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil BVALID" *) input QDMA_axil_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil RDATA" *) input [31:0]QDMA_axil_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil RREADY" *) output QDMA_axil_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil RRESP" *) input [1:0]QDMA_axil_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil RVALID" *) input QDMA_axil_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil WDATA" *) output [31:0]QDMA_axil_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil WREADY" *) input QDMA_axil_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil WSTRB" *) output [3:0]QDMA_axil_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 QDMA_axil WVALID" *) output QDMA_axil_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt cmpt_type" *) input [1:0]QDMA_c2h_cmpt_cmpt_type;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt col_idx" *) input [2:0]QDMA_c2h_cmpt_col_idx;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt data" *) input [511:0]QDMA_c2h_cmpt_data;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt dpar" *) input [15:0]QDMA_c2h_cmpt_dpar;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt err_idx" *) input [2:0]QDMA_c2h_cmpt_err_idx;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt marker" *) input QDMA_c2h_cmpt_marker;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt port_id" *) input [2:0]QDMA_c2h_cmpt_port_id;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt qid" *) input [10:0]QDMA_c2h_cmpt_qid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt size" *) input [1:0]QDMA_c2h_cmpt_size;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt tready" *) output QDMA_c2h_cmpt_tready;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt tvalid" *) input QDMA_c2h_cmpt_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt user_trig" *) input QDMA_c2h_cmpt_user_trig;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h_cmpt:1.0 QDMA_c2h_cmpt wait_pld_pkt_id" *) input [15:0]QDMA_c2h_cmpt_wait_pld_pkt_id;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 QDMA_c2h ctrl_has_cmpt" *) input QDMA_c2h_ctrl_has_cmpt;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 QDMA_c2h ctrl_len" *) input [15:0]QDMA_c2h_ctrl_len;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 QDMA_c2h ctrl_marker" *) input QDMA_c2h_ctrl_marker;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 QDMA_c2h ctrl_port_id" *) input [2:0]QDMA_c2h_ctrl_port_id;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 QDMA_c2h ctrl_qid" *) input [10:0]QDMA_c2h_ctrl_qid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:axis_c2h_drop:1.0 QDMA_c2h_drop drop" *) output QDMA_c2h_drop_drop;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:axis_c2h_drop:1.0 QDMA_c2h_drop error" *) output QDMA_c2h_drop_error;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:axis_c2h_drop:1.0 QDMA_c2h_drop last" *) output QDMA_c2h_drop_last;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:axis_c2h_drop:1.0 QDMA_c2h_drop qid" *) output [10:0]QDMA_c2h_drop_qid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:axis_c2h_drop:1.0 QDMA_c2h_drop status_cmp" *) output QDMA_c2h_drop_status_cmp;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:axis_c2h_drop:1.0 QDMA_c2h_drop valid" *) output QDMA_c2h_drop_valid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 QDMA_c2h ecc" *) input [6:0]QDMA_c2h_ecc;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 QDMA_c2h mty" *) input [5:0]QDMA_c2h_mty;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 QDMA_c2h tcrc" *) input [31:0]QDMA_c2h_tcrc;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 QDMA_c2h tdata" *) input [511:0]QDMA_c2h_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 QDMA_c2h tlast" *) input QDMA_c2h_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 QDMA_c2h tready" *) output QDMA_c2h_tready;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:s_axis_c2h:1.0 QDMA_c2h tvalid" *) input QDMA_c2h_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:dsc_crdt_in:1.0 QDMA_dsc_crdt_in crdt" *) input [15:0]QDMA_dsc_crdt_in_crdt;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:dsc_crdt_in:1.0 QDMA_dsc_crdt_in dir" *) input QDMA_dsc_crdt_in_dir;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:dsc_crdt_in:1.0 QDMA_dsc_crdt_in fence" *) input QDMA_dsc_crdt_in_fence;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:dsc_crdt_in:1.0 QDMA_dsc_crdt_in qid" *) input [10:0]QDMA_dsc_crdt_in_qid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:dsc_crdt_in:1.0 QDMA_dsc_crdt_in rdy" *) output QDMA_dsc_crdt_in_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:dsc_crdt_in:1.0 QDMA_dsc_crdt_in valid" *) input QDMA_dsc_crdt_in_valid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 QDMA_h2c err" *) output QDMA_h2c_err;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 QDMA_h2c mdata" *) output [31:0]QDMA_h2c_mdata;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 QDMA_h2c mty" *) output [5:0]QDMA_h2c_mty;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 QDMA_h2c port_id" *) output [2:0]QDMA_h2c_port_id;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 QDMA_h2c qid" *) output [10:0]QDMA_h2c_qid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 QDMA_h2c tcrc" *) output [31:0]QDMA_h2c_tcrc;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 QDMA_h2c tdata" *) output [511:0]QDMA_h2c_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 QDMA_h2c tlast" *) output QDMA_h2c_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 QDMA_h2c tready" *) input QDMA_h2c_tready;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 QDMA_h2c tvalid" *) output QDMA_h2c_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:m_axis_h2c:1.0 QDMA_h2c zero_byte" *) output QDMA_h2c_zero_byte;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 QDMA_pcie_mgt rxn" *) input [15:0]QDMA_pcie_mgt_rxn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 QDMA_pcie_mgt rxp" *) input [15:0]QDMA_pcie_mgt_rxp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 QDMA_pcie_mgt txn" *) output [15:0]QDMA_pcie_mgt_txn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 QDMA_pcie_mgt txp" *) output [15:0]QDMA_pcie_mgt_txp;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.QDMA_SOFT_RESET_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.QDMA_SOFT_RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input QDMA_soft_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.QDMA_SYS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.QDMA_SYS_CLK, ASSOCIATED_RESET QDMA_sys_rst_n, CLK_DOMAIN mpsoc_QDMA_sys_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input QDMA_sys_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.QDMA_SYS_CLK_GT CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.QDMA_SYS_CLK_GT, CLK_DOMAIN mpsoc_QDMA_sys_clk_gt, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input QDMA_sys_clk_gt;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.QDMA_SYS_RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.QDMA_SYS_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input QDMA_sys_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts avl" *) output [15:0]QDMA_tm_dsc_sts_avl;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts byp" *) output QDMA_tm_dsc_sts_byp;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts dir" *) output QDMA_tm_dsc_sts_dir;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts error" *) output QDMA_tm_dsc_sts_error;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts irq_arm" *) output QDMA_tm_dsc_sts_irq_arm;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts mm" *) output QDMA_tm_dsc_sts_mm;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts pidx" *) output [15:0]QDMA_tm_dsc_sts_pidx;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts port_id" *) output [2:0]QDMA_tm_dsc_sts_port_id;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts qen" *) output QDMA_tm_dsc_sts_qen;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts qid" *) output [10:0]QDMA_tm_dsc_sts_qid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts qinv" *) output QDMA_tm_dsc_sts_qinv;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts rdy" *) input QDMA_tm_dsc_sts_rdy;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:tm_dsc_sts:1.0 QDMA_tm_dsc_sts valid" *) output QDMA_tm_dsc_sts_valid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:usr_irq:1.0 QDMA_usr_irq ack" *) output QDMA_usr_irq_ack;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:usr_irq:1.0 QDMA_usr_irq fail" *) output QDMA_usr_irq_fail;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:usr_irq:1.0 QDMA_usr_irq fnc" *) input [7:0]QDMA_usr_irq_fnc;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:usr_irq:1.0 QDMA_usr_irq valid" *) input QDMA_usr_irq_valid;
  (* X_INTERFACE_INFO = "xilinx.com:display_eqdma:usr_irq:1.0 QDMA_usr_irq vec" *) input [10:0]QDMA_usr_irq_vec;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_ref_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gt_ref_clk, CAN_DEBUG false, FREQ_HZ 156250000" *) input gt_ref_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 gt_ref_clk CLK_P" *) input gt_ref_clk_clk_p;
  input [3:0]gt_rxn_in;
  input [3:0]gt_rxp_in;
  output [3:0]gt_txn_out;
  output [3:0]gt_txp_out;

  wire [511:0]S_AXIS_0_1_TDATA;
  wire [63:0]S_AXIS_0_1_TKEEP;
  wire S_AXIS_0_1_TLAST;
  wire S_AXIS_0_1_TREADY;
  wire S_AXIS_0_1_TVALID;
  wire [0:0]axi_ic_if_reset;
  wire [511:0]axis_data_fifo_0_m_axis_tdata;
  wire [63:0]axis_data_fifo_0_m_axis_tkeep;
  wire axis_data_fifo_0_m_axis_tlast;
  wire axis_data_fifo_0_m_axis_tvalid;
  wire [511:0]axis_data_fifo_1_M_AXIS_TDATA;
  wire [63:0]axis_data_fifo_1_M_AXIS_TKEEP;
  wire axis_data_fifo_1_M_AXIS_TLAST;
  wire axis_data_fifo_1_M_AXIS_TREADY;
  wire axis_data_fifo_1_M_AXIS_TVALID;
  wire [3:0]cmac_usplus_0_gt_txn_out;
  wire [3:0]cmac_usplus_0_gt_txp_out;
  wire cmac_usplus_0_gt_txusrclk2;
  wire [511:0]cmac_usplus_0_rx_axis_tdata;
  wire [63:0]cmac_usplus_0_rx_axis_tkeep;
  wire cmac_usplus_0_rx_axis_tlast;
  wire cmac_usplus_0_rx_axis_tvalid;
  wire cmac_usplus_0_stat_rx_aligned;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire cmac_usplus_0_stat_rx_status;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire cmac_usplus_0_tx_axis_tready;
  wire cmac_usplus_0_usr_rx_reset;
  wire cmac_usplus_0_usr_tx_reset;
  wire [0:0]const_0_dout;
  wire [0:0]const_1_dout;
  wire [11:0]const_gt_loopback_in_dout;
  wire [0:0]doce_ic_reset_peripheral_reset;
  wire [15:0]dsc_crdt_in_0_1_crdt;
  wire dsc_crdt_in_0_1_dir;
  wire dsc_crdt_in_0_1_fence;
  wire [10:0]dsc_crdt_in_0_1_qid;
  wire dsc_crdt_in_0_1_rdy;
  wire dsc_crdt_in_0_1_valid;
  wire gt_ref_clk_0_1_CLK_N;
  wire gt_ref_clk_0_1_CLK_P;
  wire [3:0]gt_rxn_in_1;
  wire [3:0]gt_rxp_in_1;
  wire pl_clk2_out;
  wire pl_resetn0;
  wire [31:0]qdma_0_M_AXI_LITE_ARADDR;
  wire [2:0]qdma_0_M_AXI_LITE_ARPROT;
  wire qdma_0_M_AXI_LITE_ARREADY;
  wire [54:0]qdma_0_M_AXI_LITE_ARUSER;
  wire qdma_0_M_AXI_LITE_ARVALID;
  wire [31:0]qdma_0_M_AXI_LITE_AWADDR;
  wire [2:0]qdma_0_M_AXI_LITE_AWPROT;
  wire qdma_0_M_AXI_LITE_AWREADY;
  wire [54:0]qdma_0_M_AXI_LITE_AWUSER;
  wire qdma_0_M_AXI_LITE_AWVALID;
  wire qdma_0_M_AXI_LITE_BREADY;
  wire [1:0]qdma_0_M_AXI_LITE_BRESP;
  wire qdma_0_M_AXI_LITE_BVALID;
  wire [31:0]qdma_0_M_AXI_LITE_RDATA;
  wire qdma_0_M_AXI_LITE_RREADY;
  wire [1:0]qdma_0_M_AXI_LITE_RRESP;
  wire qdma_0_M_AXI_LITE_RVALID;
  wire [31:0]qdma_0_M_AXI_LITE_WDATA;
  wire qdma_0_M_AXI_LITE_WREADY;
  wire [3:0]qdma_0_M_AXI_LITE_WSTRB;
  wire qdma_0_M_AXI_LITE_WVALID;
  wire qdma_0_axi_aclk;
  wire qdma_0_axi_aresetn;
  wire qdma_0_axis_c2h_drop_drop;
  wire qdma_0_axis_c2h_drop_error;
  wire qdma_0_axis_c2h_drop_last;
  wire [10:0]qdma_0_axis_c2h_drop_qid;
  wire qdma_0_axis_c2h_drop_status_cmp;
  wire qdma_0_axis_c2h_drop_valid;
  wire qdma_0_m_axis_h2c_err;
  wire [31:0]qdma_0_m_axis_h2c_mdata;
  wire [5:0]qdma_0_m_axis_h2c_mty;
  wire [2:0]qdma_0_m_axis_h2c_port_id;
  wire [10:0]qdma_0_m_axis_h2c_qid;
  wire [31:0]qdma_0_m_axis_h2c_tcrc;
  wire [511:0]qdma_0_m_axis_h2c_tdata;
  wire qdma_0_m_axis_h2c_tlast;
  wire qdma_0_m_axis_h2c_tready;
  wire qdma_0_m_axis_h2c_tvalid;
  wire qdma_0_m_axis_h2c_zero_byte;
  wire [15:0]qdma_0_pcie_mgt_rxn;
  wire [15:0]qdma_0_pcie_mgt_rxp;
  wire [15:0]qdma_0_pcie_mgt_txn;
  wire [15:0]qdma_0_pcie_mgt_txp;
  wire [15:0]qdma_0_tm_dsc_sts_avl;
  wire qdma_0_tm_dsc_sts_byp;
  wire qdma_0_tm_dsc_sts_dir;
  wire qdma_0_tm_dsc_sts_error;
  wire qdma_0_tm_dsc_sts_irq_arm;
  wire qdma_0_tm_dsc_sts_mm;
  wire [15:0]qdma_0_tm_dsc_sts_pidx;
  wire [2:0]qdma_0_tm_dsc_sts_port_id;
  wire qdma_0_tm_dsc_sts_qen;
  wire [10:0]qdma_0_tm_dsc_sts_qid;
  wire qdma_0_tm_dsc_sts_qinv;
  wire qdma_0_tm_dsc_sts_rdy;
  wire qdma_0_tm_dsc_sts_valid;
  wire [0:0]rx_datapath_reset1_peripheral_aresetn;
  wire rx_reset_cnt_0_gtwiz_rx_reset;
  wire s_axis_c2h_0_1_ctrl_has_cmpt;
  wire [15:0]s_axis_c2h_0_1_ctrl_len;
  wire s_axis_c2h_0_1_ctrl_marker;
  wire [2:0]s_axis_c2h_0_1_ctrl_port_id;
  wire [10:0]s_axis_c2h_0_1_ctrl_qid;
  wire [6:0]s_axis_c2h_0_1_ecc;
  wire [5:0]s_axis_c2h_0_1_mty;
  wire [31:0]s_axis_c2h_0_1_tcrc;
  wire [511:0]s_axis_c2h_0_1_tdata;
  wire s_axis_c2h_0_1_tlast;
  wire s_axis_c2h_0_1_tready;
  wire s_axis_c2h_0_1_tvalid;
  wire [1:0]s_axis_c2h_cmpt_0_1_cmpt_type;
  wire [2:0]s_axis_c2h_cmpt_0_1_col_idx;
  wire [511:0]s_axis_c2h_cmpt_0_1_data;
  wire [15:0]s_axis_c2h_cmpt_0_1_dpar;
  wire [2:0]s_axis_c2h_cmpt_0_1_err_idx;
  wire s_axis_c2h_cmpt_0_1_marker;
  wire [2:0]s_axis_c2h_cmpt_0_1_port_id;
  wire [10:0]s_axis_c2h_cmpt_0_1_qid;
  wire [1:0]s_axis_c2h_cmpt_0_1_size;
  wire s_axis_c2h_cmpt_0_1_tready;
  wire s_axis_c2h_cmpt_0_1_tvalid;
  wire s_axis_c2h_cmpt_0_1_user_trig;
  wire [15:0]s_axis_c2h_cmpt_0_1_wait_pld_pkt_id;
  wire soft_reset_n_0_1;
  wire sys_clk_0_1;
  wire sys_clk_gt_0_1;
  wire sys_rst_n_0_1;
  wire tx_padding_0_deoi_axis_tready;
  wire [511:0]tx_padding_0_eth_axis_tdata;
  wire [63:0]tx_padding_0_eth_axis_tkeep;
  wire tx_padding_0_eth_axis_tlast;
  wire tx_padding_0_eth_axis_tuser;
  wire tx_padding_0_eth_axis_tvalid;
  wire [0:0]tx_reset_peripheral_aresetn;
  wire [0:0]tx_reset_peripheral_reset;
  wire usr_irq_0_1_ack;
  wire usr_irq_0_1_fail;
  wire [7:0]usr_irq_0_1_fnc;
  wire usr_irq_0_1_valid;
  wire [10:0]usr_irq_0_1_vec;
  wire [0:0]xlconstant_0_dout;

  assign CMAC_in_tready = S_AXIS_0_1_TREADY;
  assign CMAC_out_tdata[511:0] = axis_data_fifo_1_M_AXIS_TDATA;
  assign CMAC_out_tkeep[63:0] = axis_data_fifo_1_M_AXIS_TKEEP;
  assign CMAC_out_tlast = axis_data_fifo_1_M_AXIS_TLAST;
  assign CMAC_out_tvalid = axis_data_fifo_1_M_AXIS_TVALID;
  assign QDMA_axi_aclk = qdma_0_axi_aclk;
  assign QDMA_axi_aresetn = qdma_0_axi_aresetn;
  assign QDMA_axil_araddr[31:0] = qdma_0_M_AXI_LITE_ARADDR;
  assign QDMA_axil_arprot[2:0] = qdma_0_M_AXI_LITE_ARPROT;
  assign QDMA_axil_aruser[54:0] = qdma_0_M_AXI_LITE_ARUSER;
  assign QDMA_axil_arvalid = qdma_0_M_AXI_LITE_ARVALID;
  assign QDMA_axil_awaddr[31:0] = qdma_0_M_AXI_LITE_AWADDR;
  assign QDMA_axil_awprot[2:0] = qdma_0_M_AXI_LITE_AWPROT;
  assign QDMA_axil_awuser[54:0] = qdma_0_M_AXI_LITE_AWUSER;
  assign QDMA_axil_awvalid = qdma_0_M_AXI_LITE_AWVALID;
  assign QDMA_axil_bready = qdma_0_M_AXI_LITE_BREADY;
  assign QDMA_axil_rready = qdma_0_M_AXI_LITE_RREADY;
  assign QDMA_axil_wdata[31:0] = qdma_0_M_AXI_LITE_WDATA;
  assign QDMA_axil_wstrb[3:0] = qdma_0_M_AXI_LITE_WSTRB;
  assign QDMA_axil_wvalid = qdma_0_M_AXI_LITE_WVALID;
  assign QDMA_c2h_cmpt_tready = s_axis_c2h_cmpt_0_1_tready;
  assign QDMA_c2h_drop_drop = qdma_0_axis_c2h_drop_drop;
  assign QDMA_c2h_drop_error = qdma_0_axis_c2h_drop_error;
  assign QDMA_c2h_drop_last = qdma_0_axis_c2h_drop_last;
  assign QDMA_c2h_drop_qid[10:0] = qdma_0_axis_c2h_drop_qid;
  assign QDMA_c2h_drop_status_cmp = qdma_0_axis_c2h_drop_status_cmp;
  assign QDMA_c2h_drop_valid = qdma_0_axis_c2h_drop_valid;
  assign QDMA_c2h_tready = s_axis_c2h_0_1_tready;
  assign QDMA_dsc_crdt_in_rdy = dsc_crdt_in_0_1_rdy;
  assign QDMA_h2c_err = qdma_0_m_axis_h2c_err;
  assign QDMA_h2c_mdata[31:0] = qdma_0_m_axis_h2c_mdata;
  assign QDMA_h2c_mty[5:0] = qdma_0_m_axis_h2c_mty;
  assign QDMA_h2c_port_id[2:0] = qdma_0_m_axis_h2c_port_id;
  assign QDMA_h2c_qid[10:0] = qdma_0_m_axis_h2c_qid;
  assign QDMA_h2c_tcrc[31:0] = qdma_0_m_axis_h2c_tcrc;
  assign QDMA_h2c_tdata[511:0] = qdma_0_m_axis_h2c_tdata;
  assign QDMA_h2c_tlast = qdma_0_m_axis_h2c_tlast;
  assign QDMA_h2c_tvalid = qdma_0_m_axis_h2c_tvalid;
  assign QDMA_h2c_zero_byte = qdma_0_m_axis_h2c_zero_byte;
  assign QDMA_pcie_mgt_txn[15:0] = qdma_0_pcie_mgt_txn;
  assign QDMA_pcie_mgt_txp[15:0] = qdma_0_pcie_mgt_txp;
  assign QDMA_tm_dsc_sts_avl[15:0] = qdma_0_tm_dsc_sts_avl;
  assign QDMA_tm_dsc_sts_byp = qdma_0_tm_dsc_sts_byp;
  assign QDMA_tm_dsc_sts_dir = qdma_0_tm_dsc_sts_dir;
  assign QDMA_tm_dsc_sts_error = qdma_0_tm_dsc_sts_error;
  assign QDMA_tm_dsc_sts_irq_arm = qdma_0_tm_dsc_sts_irq_arm;
  assign QDMA_tm_dsc_sts_mm = qdma_0_tm_dsc_sts_mm;
  assign QDMA_tm_dsc_sts_pidx[15:0] = qdma_0_tm_dsc_sts_pidx;
  assign QDMA_tm_dsc_sts_port_id[2:0] = qdma_0_tm_dsc_sts_port_id;
  assign QDMA_tm_dsc_sts_qen = qdma_0_tm_dsc_sts_qen;
  assign QDMA_tm_dsc_sts_qid[10:0] = qdma_0_tm_dsc_sts_qid;
  assign QDMA_tm_dsc_sts_qinv = qdma_0_tm_dsc_sts_qinv;
  assign QDMA_tm_dsc_sts_valid = qdma_0_tm_dsc_sts_valid;
  assign QDMA_usr_irq_ack = usr_irq_0_1_ack;
  assign QDMA_usr_irq_fail = usr_irq_0_1_fail;
  assign S_AXIS_0_1_TDATA = CMAC_in_tdata[511:0];
  assign S_AXIS_0_1_TKEEP = CMAC_in_tkeep[63:0];
  assign S_AXIS_0_1_TLAST = CMAC_in_tlast;
  assign S_AXIS_0_1_TVALID = CMAC_in_tvalid;
  assign axis_data_fifo_1_M_AXIS_TREADY = CMAC_out_tready;
  assign dsc_crdt_in_0_1_crdt = QDMA_dsc_crdt_in_crdt[15:0];
  assign dsc_crdt_in_0_1_dir = QDMA_dsc_crdt_in_dir;
  assign dsc_crdt_in_0_1_fence = QDMA_dsc_crdt_in_fence;
  assign dsc_crdt_in_0_1_qid = QDMA_dsc_crdt_in_qid[10:0];
  assign dsc_crdt_in_0_1_valid = QDMA_dsc_crdt_in_valid;
  assign gt_ref_clk_0_1_CLK_N = gt_ref_clk_clk_n;
  assign gt_ref_clk_0_1_CLK_P = gt_ref_clk_clk_p;
  assign gt_rxn_in_1 = gt_rxn_in[3:0];
  assign gt_rxp_in_1 = gt_rxp_in[3:0];
  assign gt_txn_out[3:0] = cmac_usplus_0_gt_txn_out;
  assign gt_txp_out[3:0] = cmac_usplus_0_gt_txp_out;
  assign qdma_0_M_AXI_LITE_ARREADY = QDMA_axil_arready;
  assign qdma_0_M_AXI_LITE_AWREADY = QDMA_axil_awready;
  assign qdma_0_M_AXI_LITE_BRESP = QDMA_axil_bresp[1:0];
  assign qdma_0_M_AXI_LITE_BVALID = QDMA_axil_bvalid;
  assign qdma_0_M_AXI_LITE_RDATA = QDMA_axil_rdata[31:0];
  assign qdma_0_M_AXI_LITE_RRESP = QDMA_axil_rresp[1:0];
  assign qdma_0_M_AXI_LITE_RVALID = QDMA_axil_rvalid;
  assign qdma_0_M_AXI_LITE_WREADY = QDMA_axil_wready;
  assign qdma_0_m_axis_h2c_tready = QDMA_h2c_tready;
  assign qdma_0_pcie_mgt_rxn = QDMA_pcie_mgt_rxn[15:0];
  assign qdma_0_pcie_mgt_rxp = QDMA_pcie_mgt_rxp[15:0];
  assign qdma_0_tm_dsc_sts_rdy = QDMA_tm_dsc_sts_rdy;
  assign s_axis_c2h_0_1_ctrl_has_cmpt = QDMA_c2h_ctrl_has_cmpt;
  assign s_axis_c2h_0_1_ctrl_len = QDMA_c2h_ctrl_len[15:0];
  assign s_axis_c2h_0_1_ctrl_marker = QDMA_c2h_ctrl_marker;
  assign s_axis_c2h_0_1_ctrl_port_id = QDMA_c2h_ctrl_port_id[2:0];
  assign s_axis_c2h_0_1_ctrl_qid = QDMA_c2h_ctrl_qid[10:0];
  assign s_axis_c2h_0_1_ecc = QDMA_c2h_ecc[6:0];
  assign s_axis_c2h_0_1_mty = QDMA_c2h_mty[5:0];
  assign s_axis_c2h_0_1_tcrc = QDMA_c2h_tcrc[31:0];
  assign s_axis_c2h_0_1_tdata = QDMA_c2h_tdata[511:0];
  assign s_axis_c2h_0_1_tlast = QDMA_c2h_tlast;
  assign s_axis_c2h_0_1_tvalid = QDMA_c2h_tvalid;
  assign s_axis_c2h_cmpt_0_1_cmpt_type = QDMA_c2h_cmpt_cmpt_type[1:0];
  assign s_axis_c2h_cmpt_0_1_col_idx = QDMA_c2h_cmpt_col_idx[2:0];
  assign s_axis_c2h_cmpt_0_1_data = QDMA_c2h_cmpt_data[511:0];
  assign s_axis_c2h_cmpt_0_1_dpar = QDMA_c2h_cmpt_dpar[15:0];
  assign s_axis_c2h_cmpt_0_1_err_idx = QDMA_c2h_cmpt_err_idx[2:0];
  assign s_axis_c2h_cmpt_0_1_marker = QDMA_c2h_cmpt_marker;
  assign s_axis_c2h_cmpt_0_1_port_id = QDMA_c2h_cmpt_port_id[2:0];
  assign s_axis_c2h_cmpt_0_1_qid = QDMA_c2h_cmpt_qid[10:0];
  assign s_axis_c2h_cmpt_0_1_size = QDMA_c2h_cmpt_size[1:0];
  assign s_axis_c2h_cmpt_0_1_tvalid = QDMA_c2h_cmpt_tvalid;
  assign s_axis_c2h_cmpt_0_1_user_trig = QDMA_c2h_cmpt_user_trig;
  assign s_axis_c2h_cmpt_0_1_wait_pld_pkt_id = QDMA_c2h_cmpt_wait_pld_pkt_id[15:0];
  assign soft_reset_n_0_1 = QDMA_soft_reset_n;
  assign sys_clk_0_1 = QDMA_sys_clk;
  assign sys_clk_gt_0_1 = QDMA_sys_clk_gt;
  assign sys_rst_n_0_1 = QDMA_sys_rst_n;
  assign usr_irq_0_1_fnc = QDMA_usr_irq_fnc[7:0];
  assign usr_irq_0_1_valid = QDMA_usr_irq_valid;
  assign usr_irq_0_1_vec = QDMA_usr_irq_vec[10:0];
  mpsoc_axis_data_fifo_0_0 axis_data_fifo_0
       (.m_axis_aclk(cmac_usplus_0_gt_txusrclk2),
        .m_axis_tdata(axis_data_fifo_0_m_axis_tdata),
        .m_axis_tkeep(axis_data_fifo_0_m_axis_tkeep),
        .m_axis_tlast(axis_data_fifo_0_m_axis_tlast),
        .m_axis_tready(tx_padding_0_deoi_axis_tready),
        .m_axis_tvalid(axis_data_fifo_0_m_axis_tvalid),
        .s_axis_aclk(qdma_0_axi_aclk),
        .s_axis_aresetn(rx_datapath_reset1_peripheral_aresetn),
        .s_axis_tdata(S_AXIS_0_1_TDATA),
        .s_axis_tkeep(S_AXIS_0_1_TKEEP),
        .s_axis_tlast(S_AXIS_0_1_TLAST),
        .s_axis_tready(S_AXIS_0_1_TREADY),
        .s_axis_tvalid(S_AXIS_0_1_TVALID));
  mpsoc_axis_data_fifo_1_0 axis_data_fifo_1
       (.m_axis_aclk(qdma_0_axi_aclk),
        .m_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .m_axis_tkeep(axis_data_fifo_1_M_AXIS_TKEEP),
        .m_axis_tlast(axis_data_fifo_1_M_AXIS_TLAST),
        .m_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .s_axis_aclk(cmac_usplus_0_gt_txusrclk2),
        .s_axis_aresetn(tx_reset_peripheral_aresetn),
        .s_axis_tdata(cmac_usplus_0_rx_axis_tdata),
        .s_axis_tkeep(cmac_usplus_0_rx_axis_tkeep),
        .s_axis_tlast(cmac_usplus_0_rx_axis_tlast),
        .s_axis_tvalid(cmac_usplus_0_rx_axis_tvalid));
  mpsoc_cmac_const_0_0 cmac_const_0
       (.dout(const_0_dout));
  mpsoc_cmac_const_1_0 cmac_const_1
       (.dout(const_1_dout));
  mpsoc_cmac_const_gt_loopback_in_0 cmac_const_gt_loopback_in
       (.dout(const_gt_loopback_in_dout));
  mpsoc_cmac_usplus_0_0 cmac_usplus_0
       (.core_drp_reset(axi_ic_if_reset),
        .core_rx_reset(axi_ic_if_reset),
        .core_tx_reset(axi_ic_if_reset),
        .ctl_rx_enable(const_1_dout),
        .ctl_rx_force_resync(const_0_dout),
        .ctl_rx_test_pattern(const_0_dout),
        .ctl_tx_enable(const_1_dout),
        .ctl_tx_send_idle(const_0_dout),
        .ctl_tx_send_lfi(const_0_dout),
        .ctl_tx_send_rfi(const_0_dout),
        .ctl_tx_test_pattern(const_0_dout),
        .drp_addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_clk(pl_clk2_out),
        .drp_di({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_en(1'b0),
        .drp_we(1'b0),
        .gt_loopback_in(const_gt_loopback_in_dout),
        .gt_ref_clk_n(gt_ref_clk_0_1_CLK_N),
        .gt_ref_clk_p(gt_ref_clk_0_1_CLK_P),
        .gt_rxn_in(gt_rxn_in_1),
        .gt_rxp_in(gt_rxp_in_1),
        .gt_txn_out(cmac_usplus_0_gt_txn_out),
        .gt_txp_out(cmac_usplus_0_gt_txp_out),
        .gt_txusrclk2(cmac_usplus_0_gt_txusrclk2),
        .gtwiz_reset_rx_datapath(rx_reset_cnt_0_gtwiz_rx_reset),
        .gtwiz_reset_tx_datapath(axi_ic_if_reset),
        .init_clk(pl_clk2_out),
        .rx_axis_tdata(cmac_usplus_0_rx_axis_tdata),
        .rx_axis_tkeep(cmac_usplus_0_rx_axis_tkeep),
        .rx_axis_tlast(cmac_usplus_0_rx_axis_tlast),
        .rx_axis_tvalid(cmac_usplus_0_rx_axis_tvalid),
        .rx_clk(cmac_usplus_0_gt_txusrclk2),
        .stat_rx_aligned(cmac_usplus_0_stat_rx_aligned),
        .stat_rx_status(cmac_usplus_0_stat_rx_status),
        .sys_reset(axi_ic_if_reset),
        .tx_axis_tdata(tx_padding_0_eth_axis_tdata),
        .tx_axis_tkeep(tx_padding_0_eth_axis_tkeep),
        .tx_axis_tlast(tx_padding_0_eth_axis_tlast),
        .tx_axis_tready(cmac_usplus_0_tx_axis_tready),
        .tx_axis_tuser(tx_padding_0_eth_axis_tuser),
        .tx_axis_tvalid(tx_padding_0_eth_axis_tvalid),
        .tx_preamblein({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .usr_rx_reset(cmac_usplus_0_usr_rx_reset),
        .usr_tx_reset(cmac_usplus_0_usr_tx_reset));
  mpsoc_tx_reset_0 cmactz_user_reset
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(cmac_usplus_0_usr_rx_reset),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(tx_reset_peripheral_aresetn),
        .peripheral_reset(tx_reset_peripheral_reset),
        .slowest_sync_clk(cmac_usplus_0_gt_txusrclk2));
  mpsoc_pl_clk_sys_reset_0 pl_clk_sys_reset
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_reset(axi_ic_if_reset),
        .slowest_sync_clk(pl_clk2_out));
  mpsoc_qdma_0_0 qdma_0
       (.axi_aclk(qdma_0_axi_aclk),
        .axi_aresetn(qdma_0_axi_aresetn),
        .axis_c2h_status_cmp(qdma_0_axis_c2h_drop_status_cmp),
        .axis_c2h_status_drop(qdma_0_axis_c2h_drop_drop),
        .axis_c2h_status_error(qdma_0_axis_c2h_drop_error),
        .axis_c2h_status_last(qdma_0_axis_c2h_drop_last),
        .axis_c2h_status_qid(qdma_0_axis_c2h_drop_qid),
        .axis_c2h_status_valid(qdma_0_axis_c2h_drop_valid),
        .dsc_crdt_in_crdt(dsc_crdt_in_0_1_crdt),
        .dsc_crdt_in_dir(dsc_crdt_in_0_1_dir),
        .dsc_crdt_in_fence(dsc_crdt_in_0_1_fence),
        .dsc_crdt_in_qid(dsc_crdt_in_0_1_qid),
        .dsc_crdt_in_rdy(dsc_crdt_in_0_1_rdy),
        .dsc_crdt_in_vld(dsc_crdt_in_0_1_valid),
        .m_axil_araddr(qdma_0_M_AXI_LITE_ARADDR),
        .m_axil_arprot(qdma_0_M_AXI_LITE_ARPROT),
        .m_axil_arready(qdma_0_M_AXI_LITE_ARREADY),
        .m_axil_aruser(qdma_0_M_AXI_LITE_ARUSER),
        .m_axil_arvalid(qdma_0_M_AXI_LITE_ARVALID),
        .m_axil_awaddr(qdma_0_M_AXI_LITE_AWADDR),
        .m_axil_awprot(qdma_0_M_AXI_LITE_AWPROT),
        .m_axil_awready(qdma_0_M_AXI_LITE_AWREADY),
        .m_axil_awuser(qdma_0_M_AXI_LITE_AWUSER),
        .m_axil_awvalid(qdma_0_M_AXI_LITE_AWVALID),
        .m_axil_bready(qdma_0_M_AXI_LITE_BREADY),
        .m_axil_bresp(qdma_0_M_AXI_LITE_BRESP),
        .m_axil_bvalid(qdma_0_M_AXI_LITE_BVALID),
        .m_axil_rdata(qdma_0_M_AXI_LITE_RDATA),
        .m_axil_rready(qdma_0_M_AXI_LITE_RREADY),
        .m_axil_rresp(qdma_0_M_AXI_LITE_RRESP),
        .m_axil_rvalid(qdma_0_M_AXI_LITE_RVALID),
        .m_axil_wdata(qdma_0_M_AXI_LITE_WDATA),
        .m_axil_wready(qdma_0_M_AXI_LITE_WREADY),
        .m_axil_wstrb(qdma_0_M_AXI_LITE_WSTRB),
        .m_axil_wvalid(qdma_0_M_AXI_LITE_WVALID),
        .m_axis_h2c_tcrc(qdma_0_m_axis_h2c_tcrc),
        .m_axis_h2c_tdata(qdma_0_m_axis_h2c_tdata),
        .m_axis_h2c_tlast(qdma_0_m_axis_h2c_tlast),
        .m_axis_h2c_tready(qdma_0_m_axis_h2c_tready),
        .m_axis_h2c_tuser_err(qdma_0_m_axis_h2c_err),
        .m_axis_h2c_tuser_mdata(qdma_0_m_axis_h2c_mdata),
        .m_axis_h2c_tuser_mty(qdma_0_m_axis_h2c_mty),
        .m_axis_h2c_tuser_port_id(qdma_0_m_axis_h2c_port_id),
        .m_axis_h2c_tuser_qid(qdma_0_m_axis_h2c_qid),
        .m_axis_h2c_tuser_zero_byte(qdma_0_m_axis_h2c_zero_byte),
        .m_axis_h2c_tvalid(qdma_0_m_axis_h2c_tvalid),
        .pci_exp_rxn(qdma_0_pcie_mgt_rxn),
        .pci_exp_rxp(qdma_0_pcie_mgt_rxp),
        .pci_exp_txn(qdma_0_pcie_mgt_txn),
        .pci_exp_txp(qdma_0_pcie_mgt_txp),
        .qsts_out_rdy(xlconstant_0_dout),
        .s_axis_c2h_cmpt_ctrl_cmpt_type(s_axis_c2h_cmpt_0_1_cmpt_type),
        .s_axis_c2h_cmpt_ctrl_col_idx(s_axis_c2h_cmpt_0_1_col_idx),
        .s_axis_c2h_cmpt_ctrl_err_idx(s_axis_c2h_cmpt_0_1_err_idx),
        .s_axis_c2h_cmpt_ctrl_marker(s_axis_c2h_cmpt_0_1_marker),
        .s_axis_c2h_cmpt_ctrl_port_id(s_axis_c2h_cmpt_0_1_port_id),
        .s_axis_c2h_cmpt_ctrl_qid(s_axis_c2h_cmpt_0_1_qid),
        .s_axis_c2h_cmpt_ctrl_user_trig(s_axis_c2h_cmpt_0_1_user_trig),
        .s_axis_c2h_cmpt_ctrl_wait_pld_pkt_id(s_axis_c2h_cmpt_0_1_wait_pld_pkt_id),
        .s_axis_c2h_cmpt_dpar(s_axis_c2h_cmpt_0_1_dpar),
        .s_axis_c2h_cmpt_size(s_axis_c2h_cmpt_0_1_size),
        .s_axis_c2h_cmpt_tdata(s_axis_c2h_cmpt_0_1_data),
        .s_axis_c2h_cmpt_tready(s_axis_c2h_cmpt_0_1_tready),
        .s_axis_c2h_cmpt_tvalid(s_axis_c2h_cmpt_0_1_tvalid),
        .s_axis_c2h_ctrl_ecc(s_axis_c2h_0_1_ecc),
        .s_axis_c2h_ctrl_has_cmpt(s_axis_c2h_0_1_ctrl_has_cmpt),
        .s_axis_c2h_ctrl_len(s_axis_c2h_0_1_ctrl_len),
        .s_axis_c2h_ctrl_marker(s_axis_c2h_0_1_ctrl_marker),
        .s_axis_c2h_ctrl_port_id(s_axis_c2h_0_1_ctrl_port_id),
        .s_axis_c2h_ctrl_qid(s_axis_c2h_0_1_ctrl_qid),
        .s_axis_c2h_mty(s_axis_c2h_0_1_mty),
        .s_axis_c2h_tcrc(s_axis_c2h_0_1_tcrc),
        .s_axis_c2h_tdata(s_axis_c2h_0_1_tdata),
        .s_axis_c2h_tlast(s_axis_c2h_0_1_tlast),
        .s_axis_c2h_tready(s_axis_c2h_0_1_tready),
        .s_axis_c2h_tvalid(s_axis_c2h_0_1_tvalid),
        .soft_reset_n(soft_reset_n_0_1),
        .sys_clk(sys_clk_0_1),
        .sys_clk_gt(sys_clk_gt_0_1),
        .sys_rst_n(sys_rst_n_0_1),
        .tm_dsc_sts_avl(qdma_0_tm_dsc_sts_avl),
        .tm_dsc_sts_byp(qdma_0_tm_dsc_sts_byp),
        .tm_dsc_sts_dir(qdma_0_tm_dsc_sts_dir),
        .tm_dsc_sts_error(qdma_0_tm_dsc_sts_error),
        .tm_dsc_sts_irq_arm(qdma_0_tm_dsc_sts_irq_arm),
        .tm_dsc_sts_mm(qdma_0_tm_dsc_sts_mm),
        .tm_dsc_sts_pidx(qdma_0_tm_dsc_sts_pidx),
        .tm_dsc_sts_port_id(qdma_0_tm_dsc_sts_port_id),
        .tm_dsc_sts_qen(qdma_0_tm_dsc_sts_qen),
        .tm_dsc_sts_qid(qdma_0_tm_dsc_sts_qid),
        .tm_dsc_sts_qinv(qdma_0_tm_dsc_sts_qinv),
        .tm_dsc_sts_rdy(qdma_0_tm_dsc_sts_rdy),
        .tm_dsc_sts_vld(qdma_0_tm_dsc_sts_valid),
        .usr_irq_in_fnc(usr_irq_0_1_fnc),
        .usr_irq_in_vec(usr_irq_0_1_vec),
        .usr_irq_in_vld(usr_irq_0_1_valid),
        .usr_irq_out_ack(usr_irq_0_1_ack),
        .usr_irq_out_fail(usr_irq_0_1_fail));
  mpsoc_rx_reset_0 rx_datapath_reset
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_reset(doce_ic_reset_peripheral_reset),
        .slowest_sync_clk(cmac_usplus_0_gt_txusrclk2));
  mpsoc_rx_reset_cnt_0_0 rx_datapath_reset_cnt_0
       (.clk(cmac_usplus_0_gt_txusrclk2),
        .gtwiz_rx_reset(rx_reset_cnt_0_gtwiz_rx_reset),
        .reset(doce_ic_reset_peripheral_reset),
        .rx_status(cmac_usplus_0_stat_rx_status));
  mpsoc_system_ila_0_0 system_ila_0
       (.clk(qdma_0_axi_aclk),
        .probe0(cmac_usplus_0_stat_rx_status),
        .probe1(cmac_usplus_0_tx_axis_tready),
        .probe2(cmac_usplus_0_stat_rx_aligned),
        .probe3(tx_padding_0_deoi_axis_tready),
        .probe4(qdma_0_axi_aresetn),
        .probe5(sys_rst_n_0_1),
        .probe6(soft_reset_n_0_1),
        .probe7(rx_datapath_reset1_peripheral_aresetn));
  mpsoc_rx_datapath_reset_0 tx_fifo_reset
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(cmac_usplus_0_usr_tx_reset),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rx_datapath_reset1_peripheral_aresetn),
        .slowest_sync_clk(qdma_0_axi_aclk));
  mpsoc_tx_padding_0_0 tx_padding_0
       (.aclk(cmac_usplus_0_gt_txusrclk2),
        .deoi_axis_tdata(axis_data_fifo_0_m_axis_tdata),
        .deoi_axis_tkeep(axis_data_fifo_0_m_axis_tkeep),
        .deoi_axis_tlast(axis_data_fifo_0_m_axis_tlast),
        .deoi_axis_tready(tx_padding_0_deoi_axis_tready),
        .deoi_axis_tvalid(axis_data_fifo_0_m_axis_tvalid),
        .eth_axis_tdata(tx_padding_0_eth_axis_tdata),
        .eth_axis_tkeep(tx_padding_0_eth_axis_tkeep),
        .eth_axis_tlast(tx_padding_0_eth_axis_tlast),
        .eth_axis_tready(cmac_usplus_0_tx_axis_tready),
        .eth_axis_tuser(tx_padding_0_eth_axis_tuser),
        .eth_axis_tvalid(tx_padding_0_eth_axis_tvalid),
        .reset(tx_reset_peripheral_reset));
  mpsoc_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  mpsoc_zynq_mpsoc_0 zynq_mpsoc
       (.pl_clk2(pl_clk2_out),
        .pl_ps_irq0(1'b0),
        .pl_resetn0(pl_resetn0));
endmodule
