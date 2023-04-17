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
   (
    input QDMA_axi_aclk,
    input QDMA_axi_aresetn,

    input QDMA_h2c_err,
    input [31:0]QDMA_h2c_mdata,
    input [5:0]QDMA_h2c_mty,
    input [2:0]QDMA_h2c_port_id,
    input [10:0]QDMA_h2c_qid,
    input [511:0]QDMA_h2c_tdata,
    input QDMA_h2c_tlast,
    output QDMA_h2c_tready,
    input QDMA_h2c_tvalid,
    input QDMA_h2c_zero_byte,

    output [1:0]QDMA_c2h_cmpt_cmpt_type,
    output [2:0]QDMA_c2h_cmpt_col_idx,
    output [511:0]QDMA_c2h_cmpt_data,
    output [15:0]QDMA_c2h_cmpt_dpar,
    output [2:0]QDMA_c2h_cmpt_err_idx,
    output QDMA_c2h_cmpt_marker,
    output [10:0]QDMA_c2h_cmpt_qid,
    output [1:0]QDMA_c2h_cmpt_size,
    input QDMA_c2h_cmpt_tready,
    output QDMA_c2h_cmpt_tvalid,
    output QDMA_c2h_cmpt_user_trig,
    output [15:0]QDMA_c2h_cmpt_wait_pld_pkt_id,
    
    output QDMA_c2h_ctrl_has_cmpt,
    output [15:0]QDMA_c2h_ctrl_len,
    output QDMA_c2h_ctrl_marker,
    output [10:0]QDMA_c2h_ctrl_qid,

    output [5:0]QDMA_c2h_mty,
    output [511:0]QDMA_c2h_tdata,
    output QDMA_c2h_tlast,
    input QDMA_c2h_tready,
    output QDMA_c2h_tvalid,

    output [31:0] QDMA_h2c_pack_counter,
    output [31:0] QDMA_h2c_err_counter,
    output [31:0]  QDMA_c2h_pack_counter,
    output [31:0]  QDMA_c2h_err_counter,

    input [15:0] op,
    input [31:0] arg0,
    input [31:0] arg1,
    input [31:0] arg2,
    input [31:0] arg3,
    input [31:0] arg4,
    input [31:0] arg5,
    input [31:0] arg6,
    input [31:0] arg7,
    input [31:0] arg8,
    input [31:0] arg9,
    input [31:0] arg10,
    input [31:0] arg11,
    input [31:0] arg12,
    input [31:0] arg13,
    input [31:0] arg14,
    input [31:0] arg15,
    input reset_counter
    );


//==== axis ====
    wire [511:0]QDMA_h2c_stub_out_tdata;
    wire [15:0]QDMA_h2c_stub_out_tdest;
    wire QDMA_h2c_stub_out_tuser;
    wire QDMA_h2c_stub_out_tlast;
    wire QDMA_h2c_stub_out_tready;
    wire QDMA_h2c_stub_out_tvalid;

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
    wire CMAC_out_tuser;

    wire [511:0]QDMA_c2h_stub_in_tdata;
    wire QDMA_c2h_stub_in_tuser;
    wire QDMA_c2h_stub_in_tlast;
    wire QDMA_c2h_stub_in_tready;
    wire QDMA_c2h_stub_in_tvalid;

    //QDMA_h2c(_stub_in)_... are defined in other places.

    wire mdma_c2h_axis_data_exdes_t QDMA_c2h_stub_out_data;
    wire mdma_c2h_axis_ctrl_exdes_t QDMA_c2h_stub_out_ctrl;//port_id unused
    wire c2h_stub_std_cmp_ctrl_t QDMA_c2h_stub_out_cmp_ctrl; //port_id unused
    wire c2h_stub_std_cmp_t QDMA_c2h_stub_out_cmp_data;
    wire QDMA_c2h_stub_out_cmp_tvalid;
    wire [5:0]QDMA_c2h_stub_out_mty;
    wire QDMA_c2h_stub_out_tlast;
    wire QDMA_c2h_stub_out_tvalid;
    
  
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
    .io_CMAC_out_tuser           (1'b0),

    .io_QDMA_c2h_stub_in_tdata   (QDMA_c2h_stub_in_tdata),
    .io_QDMA_c2h_stub_in_tuser   (QDMA_c2h_stub_in_tuser),
    .io_QDMA_c2h_stub_in_tlast   (QDMA_c2h_stub_in_tlast),
    .io_QDMA_c2h_stub_in_tready  (QDMA_c2h_stub_in_tready),
    .io_QDMA_c2h_stub_in_tvalid  (QDMA_c2h_stub_in_tvalid),

    .io_extern_config_op     (op),
    .io_extern_config_arg_0(arg0),
    .io_extern_config_arg_1(arg1),
    .io_extern_config_arg_2(arg2),
    .io_extern_config_arg_3(arg3),
    .io_extern_config_arg_4(arg4),
    .io_extern_config_arg_5(arg5),
    .io_extern_config_arg_6(arg6),
    .io_extern_config_arg_7(arg7),
    .io_extern_config_arg_8(arg8),
    .io_extern_config_arg_9(arg9),
    .io_extern_config_arg_10(arg10),
    .io_extern_config_arg_11(arg11),
    .io_extern_config_arg_12(arg12),
    .io_extern_config_arg_13(arg13),
    .io_extern_config_arg_14(arg14),
    .io_extern_config_arg_15(arg15),
    
    .io_reset_counter            (reset_counter),
    .io_h2c_err_counter          (QDMA_h2c_err_counter),
    .io_h2c_pack_counter         (QDMA_h2c_pack_counter),
    .io_c2h_err_counter          (QDMA_c2h_err_counter),
    .io_c2h_pack_counter         (QDMA_c2h_pack_counter)
);

axis_data_fifo_0 cmac_fifo(
    .s_axis_aclk(QDMA_axi_aclk),
    .s_axis_aresetn(QDMA_axi_aresetn),
    
    .s_axis_tdata(CMAC_in_tdata),
    .s_axis_tkeep(CMAC_in_tkeep),
    .s_axis_tlast(CMAC_in_tlast),
    .s_axis_tready(CMAC_in_tready),
    .s_axis_tvalid(CMAC_in_tvalid),
    .s_axis_tuser(1'b0),
    .m_axis_tdata(CMAC_out_tdata),
    .m_axis_tkeep(CMAC_out_tkeep),
    .m_axis_tlast(CMAC_out_tlast),
    .m_axis_tready(CMAC_out_tready),
    .m_axis_tvalid(CMAC_out_tvalid),
    .m_axis_tuser()
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

endmodule
