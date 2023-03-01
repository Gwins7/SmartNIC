module TxConverter(
  input          clock,
  input          reset,
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input          io_in_tuser,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  output [7:0]   io_out_extern_config_c2h_match_op,
  input  [7:0]   io_extern_config_c2h_match_op,
  input  [31:0]  io_extern_config_c2h_match_arg_0,
  input  [31:0]  io_extern_config_c2h_match_arg_1,
  input  [31:0]  io_extern_config_c2h_match_arg_2,
  input  [31:0]  io_extern_config_c2h_match_arg_3,
  input  [31:0]  io_extern_config_c2h_match_arg_4,
  input  [31:0]  io_extern_config_c2h_match_arg_5,
  input  [31:0]  io_extern_config_c2h_match_arg_6,
  input  [31:0]  io_extern_config_c2h_match_arg_7,
  input  [31:0]  io_extern_config_c2h_match_arg_8,
  input  [31:0]  io_extern_config_c2h_match_arg_9,
  input  [31:0]  io_extern_config_c2h_match_arg_10,
  input  [31:0]  io_extern_config_c2h_match_arg_11,
  input  [31:0]  io_extern_config_c2h_match_arg_12,
  input  [31:0]  io_extern_config_c2h_match_arg_13,
  input  [31:0]  io_extern_config_c2h_match_arg_14,
  input  [31:0]  io_extern_config_c2h_match_arg_15
);
`ifdef RANDOMIZE_REG_INIT
  reg [543:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [255:0] extern_config_reg_lo = {io_extern_config_c2h_match_arg_7,io_extern_config_c2h_match_arg_6,
    io_extern_config_c2h_match_arg_5,io_extern_config_c2h_match_arg_4,io_extern_config_c2h_match_arg_3,
    io_extern_config_c2h_match_arg_2,io_extern_config_c2h_match_arg_1,io_extern_config_c2h_match_arg_0}; // @[TxConverter.scala 17:54]
  wire [519:0] _extern_config_reg_T = {io_extern_config_c2h_match_op,io_extern_config_c2h_match_arg_15,
    io_extern_config_c2h_match_arg_14,io_extern_config_c2h_match_arg_13,io_extern_config_c2h_match_arg_12,
    io_extern_config_c2h_match_arg_11,io_extern_config_c2h_match_arg_10,io_extern_config_c2h_match_arg_9,
    io_extern_config_c2h_match_arg_8,extern_config_reg_lo}; // @[TxConverter.scala 17:54]
  wire  _extern_config_reg_T_1 = io_out_tready & io_out_tvalid; // @[TxConverter.scala 17:79]
  reg [519:0] extern_config_reg_r; // @[Reg.scala 28:20]
  assign io_in_tready = io_out_tready; // @[TxConverter.scala 24:26]
  assign io_out_tdata = io_in_tdata; // @[TxConverter.scala 23:26]
  assign io_out_tvalid = io_in_tvalid & ~io_in_tuser; // @[TxConverter.scala 15:34]
  assign io_out_tlast = io_in_tlast; // @[TxConverter.scala 22:26]
  assign io_out_extern_config_c2h_match_op = extern_config_reg_r[519:512]; // @[TxConverter.scala 17:104]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 28:20]
      extern_config_reg_r <= 520'h0; // @[Reg.scala 28:20]
    end else if (_extern_config_reg_T_1) begin // @[Reg.scala 29:18]
      extern_config_reg_r <= _extern_config_reg_T; // @[Reg.scala 29:22]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {17{`RANDOM}};
  extern_config_reg_r = _RAND_0[519:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ReduceAddSync(
  input         clock,
  input  [31:0] io_in_vec_0,
  input  [31:0] io_in_vec_1,
  input  [31:0] io_in_vec_2,
  input  [31:0] io_in_vec_3,
  input  [31:0] io_in_vec_4,
  input  [31:0] io_in_vec_5,
  input  [31:0] io_in_vec_6,
  input  [31:0] io_in_vec_7,
  input  [31:0] io_in_vec_8,
  input  [31:0] io_in_vec_9,
  output [31:0] io_out_sum
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] cal_reg_0; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_1; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_2; // @[Misc.scala 174:20]
  wire [31:0] _cal_reg_0_T_1 = io_in_vec_0 + io_in_vec_1; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_0_T_3 = io_in_vec_2 + io_in_vec_3; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_1_T_1 = io_in_vec_4 + io_in_vec_5; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_1_T_3 = io_in_vec_6 + io_in_vec_7; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_2_T_1 = io_in_vec_8 + io_in_vec_9; // @[Misc.scala 189:42]
  wire [32:0] _cal_reg_2_T_4 = {{1'd0}, _cal_reg_2_T_1}; // @[Misc.scala 189:42]
  wire [31:0] _io_out_sum_T_1 = cal_reg_0 + cal_reg_1; // @[Misc.scala 191:37]
  wire [32:0] _io_out_sum_T_2 = {{1'd0}, cal_reg_2}; // @[Misc.scala 191:37]
  assign io_out_sum = _io_out_sum_T_1 + _io_out_sum_T_2[31:0]; // @[Misc.scala 191:37]
  always @(posedge clock) begin
    cal_reg_0 <= _cal_reg_0_T_1 + _cal_reg_0_T_3; // @[Misc.scala 189:42]
    cal_reg_1 <= _cal_reg_1_T_1 + _cal_reg_1_T_3; // @[Misc.scala 189:42]
    cal_reg_2 <= _cal_reg_2_T_4[31:0]; // @[Misc.scala 189:42]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cal_reg_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  cal_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  cal_reg_2 = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ReduceAddSync_1(
  input         clock,
  input  [31:0] io_in_vec_0,
  input  [31:0] io_in_vec_1,
  input  [31:0] io_in_vec_2,
  input  [31:0] io_in_vec_3,
  input  [31:0] io_in_vec_4,
  input  [31:0] io_in_vec_5,
  input  [31:0] io_in_vec_6,
  input  [31:0] io_in_vec_7,
  input  [31:0] io_in_vec_8,
  input  [31:0] io_in_vec_9,
  input  [31:0] io_in_vec_10,
  input  [31:0] io_in_vec_11,
  input  [31:0] io_in_vec_12,
  input  [31:0] io_in_vec_13,
  input  [31:0] io_in_vec_14,
  input  [31:0] io_in_vec_15,
  input  [31:0] io_in_vec_16,
  input  [31:0] io_in_vec_17,
  input  [31:0] io_in_vec_18,
  input  [31:0] io_in_vec_19,
  input  [31:0] io_in_vec_20,
  input  [31:0] io_in_vec_21,
  input  [31:0] io_in_vec_22,
  input  [31:0] io_in_vec_23,
  input  [31:0] io_in_vec_24,
  input  [31:0] io_in_vec_25,
  input  [31:0] io_in_vec_26,
  input  [31:0] io_in_vec_27,
  input  [31:0] io_in_vec_28,
  input  [31:0] io_in_vec_29,
  input  [31:0] io_in_vec_30,
  input  [31:0] io_in_vec_31,
  output [31:0] io_out_sum
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] cal_reg_0; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_1; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_2; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_3; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_4; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_5; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_6; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_7; // @[Misc.scala 174:20]
  wire [31:0] _cal_reg_0_T_1 = io_in_vec_0 + io_in_vec_1; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_0_T_3 = io_in_vec_2 + io_in_vec_3; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_1_T_1 = io_in_vec_4 + io_in_vec_5; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_1_T_3 = io_in_vec_6 + io_in_vec_7; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_2_T_1 = io_in_vec_8 + io_in_vec_9; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_2_T_3 = io_in_vec_10 + io_in_vec_11; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_3_T_1 = io_in_vec_12 + io_in_vec_13; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_3_T_3 = io_in_vec_14 + io_in_vec_15; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_4_T_1 = io_in_vec_16 + io_in_vec_17; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_4_T_3 = io_in_vec_18 + io_in_vec_19; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_5_T_1 = io_in_vec_20 + io_in_vec_21; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_5_T_3 = io_in_vec_22 + io_in_vec_23; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_6_T_1 = io_in_vec_24 + io_in_vec_25; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_6_T_3 = io_in_vec_26 + io_in_vec_27; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_7_T_1 = io_in_vec_28 + io_in_vec_29; // @[Misc.scala 189:42]
  wire [31:0] _cal_reg_7_T_3 = io_in_vec_30 + io_in_vec_31; // @[Misc.scala 189:42]
  wire [31:0] _io_out_sum_T_1 = cal_reg_0 + cal_reg_1; // @[Misc.scala 191:37]
  wire [31:0] _io_out_sum_T_3 = cal_reg_2 + cal_reg_3; // @[Misc.scala 191:37]
  wire [31:0] _io_out_sum_T_5 = cal_reg_4 + cal_reg_5; // @[Misc.scala 191:37]
  wire [31:0] _io_out_sum_T_7 = cal_reg_6 + cal_reg_7; // @[Misc.scala 191:37]
  wire [31:0] _io_out_sum_T_9 = _io_out_sum_T_1 + _io_out_sum_T_3; // @[Misc.scala 191:37]
  wire [31:0] _io_out_sum_T_11 = _io_out_sum_T_5 + _io_out_sum_T_7; // @[Misc.scala 191:37]
  assign io_out_sum = _io_out_sum_T_9 + _io_out_sum_T_11; // @[Misc.scala 191:37]
  always @(posedge clock) begin
    cal_reg_0 <= _cal_reg_0_T_1 + _cal_reg_0_T_3; // @[Misc.scala 189:42]
    cal_reg_1 <= _cal_reg_1_T_1 + _cal_reg_1_T_3; // @[Misc.scala 189:42]
    cal_reg_2 <= _cal_reg_2_T_1 + _cal_reg_2_T_3; // @[Misc.scala 189:42]
    cal_reg_3 <= _cal_reg_3_T_1 + _cal_reg_3_T_3; // @[Misc.scala 189:42]
    cal_reg_4 <= _cal_reg_4_T_1 + _cal_reg_4_T_3; // @[Misc.scala 189:42]
    cal_reg_5 <= _cal_reg_5_T_1 + _cal_reg_5_T_3; // @[Misc.scala 189:42]
    cal_reg_6 <= _cal_reg_6_T_1 + _cal_reg_6_T_3; // @[Misc.scala 189:42]
    cal_reg_7 <= _cal_reg_7_T_1 + _cal_reg_7_T_3; // @[Misc.scala 189:42]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cal_reg_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  cal_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  cal_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  cal_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  cal_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  cal_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  cal_reg_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  cal_reg_7 = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TxChksumGenerator(
  input          clock,
  input          reset,
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input  [7:0]   io_in_extern_config_c2h_match_op,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  output [31:0]  io_out_tx_info_ip_chksum,
  output [31:0]  io_out_tx_info_tcp_chksum,
  output [7:0]   io_out_extern_config_c2h_match_op
);
`ifdef RANDOMIZE_REG_INIT
  reg [607:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  ip_chksum_cal_clock; // @[TxPipelineHandler.scala 37:29]
  wire [31:0] ip_chksum_cal_io_in_vec_0; // @[TxPipelineHandler.scala 37:29]
  wire [31:0] ip_chksum_cal_io_in_vec_1; // @[TxPipelineHandler.scala 37:29]
  wire [31:0] ip_chksum_cal_io_in_vec_2; // @[TxPipelineHandler.scala 37:29]
  wire [31:0] ip_chksum_cal_io_in_vec_3; // @[TxPipelineHandler.scala 37:29]
  wire [31:0] ip_chksum_cal_io_in_vec_4; // @[TxPipelineHandler.scala 37:29]
  wire [31:0] ip_chksum_cal_io_in_vec_5; // @[TxPipelineHandler.scala 37:29]
  wire [31:0] ip_chksum_cal_io_in_vec_6; // @[TxPipelineHandler.scala 37:29]
  wire [31:0] ip_chksum_cal_io_in_vec_7; // @[TxPipelineHandler.scala 37:29]
  wire [31:0] ip_chksum_cal_io_in_vec_8; // @[TxPipelineHandler.scala 37:29]
  wire [31:0] ip_chksum_cal_io_in_vec_9; // @[TxPipelineHandler.scala 37:29]
  wire [31:0] ip_chksum_cal_io_out_sum; // @[TxPipelineHandler.scala 37:29]
  wire  tcp_pld_chksum_cal_clock; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_0; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_1; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_2; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_3; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_4; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_5; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_6; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_7; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_8; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_9; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_10; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_11; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_12; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_13; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_14; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_15; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_16; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_17; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_18; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_19; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_20; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_21; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_22; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_23; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_24; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_25; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_26; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_27; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_28; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_29; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_30; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_31; // @[TxPipelineHandler.scala 45:34]
  wire [31:0] tcp_pld_chksum_cal_io_out_sum; // @[TxPipelineHandler.scala 45:34]
  wire  tcp_hdr_chksum_cal_clock; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_0; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_1; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_2; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_3; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_4; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_5; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_6; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_7; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_8; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_9; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_10; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_11; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_12; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_13; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_14; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_15; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_16; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_17; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_18; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_19; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_20; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_21; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_22; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_23; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_24; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_25; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_26; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_27; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_28; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_29; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_30; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_31; // @[TxPipelineHandler.scala 52:34]
  wire [31:0] tcp_hdr_chksum_cal_io_out_sum; // @[TxPipelineHandler.scala 52:34]
  wire  in_shake_hand = io_in_tvalid & io_in_tready; // @[TxPipelineHandler.scala 12:36]
  wire  out_shake_hand = io_out_tready & io_out_tvalid; // @[TxPipelineHandler.scala 13:38]
  wire [577:0] _in_reg_T_1 = {64'h0,io_in_tdata,io_in_tvalid,io_in_tlast}; // @[Cat.scala 31:58]
  reg [577:0] in_reg_r; // @[Reg.scala 28:20]
  wire  in_reg_tlast = in_reg_r[0]; // @[TxPipelineHandler.scala 15:116]
  wire  in_reg_tvalid = in_reg_r[1]; // @[TxPipelineHandler.scala 15:116]
  wire [511:0] in_reg_tdata = in_reg_r[513:2]; // @[TxPipelineHandler.scala 15:116]
  reg  first_beat_reg; // @[Reg.scala 28:20]
  wire  _GEN_1 = in_shake_hand ? in_reg_tlast : first_beat_reg; // @[Reg.scala 29:18 28:20 29:22]
  reg  in_reg_used_reg; // @[TxPipelineHandler.scala 19:32]
  wire  _GEN_2 = out_shake_hand ? 1'h0 : in_reg_used_reg; // @[TxPipelineHandler.scala 22:29 23:21 19:32]
  wire  _GEN_3 = in_shake_hand | _GEN_2; // @[TxPipelineHandler.scala 20:23 21:21]
  wire [511:0] cal_tdata = in_shake_hand ? io_in_tdata : in_reg_tdata; // @[TxPipelineHandler.scala 35:22]
  wire [15:0] _ip_chksum_cal_io_in_vec_0_T_3 = {cal_tdata[119:112],cal_tdata[127:120]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_1_T_3 = {cal_tdata[135:128],cal_tdata[143:136]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_2_T_3 = {cal_tdata[151:144],cal_tdata[159:152]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_3_T_3 = {cal_tdata[167:160],cal_tdata[175:168]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_4_T_3 = {cal_tdata[183:176],cal_tdata[191:184]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_6_T_3 = {cal_tdata[215:208],cal_tdata[223:216]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_7_T_3 = {cal_tdata[231:224],cal_tdata[239:232]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_8_T_3 = {cal_tdata[247:240],cal_tdata[255:248]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_9_T_3 = {cal_tdata[263:256],cal_tdata[271:264]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_0_T_3 = {cal_tdata[7:0],cal_tdata[15:8]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_1_T_3 = {cal_tdata[23:16],cal_tdata[31:24]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_2_T_3 = {cal_tdata[39:32],cal_tdata[47:40]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_3_T_3 = {cal_tdata[55:48],cal_tdata[63:56]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_4_T_3 = {cal_tdata[71:64],cal_tdata[79:72]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_5_T_3 = {cal_tdata[87:80],cal_tdata[95:88]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_6_T_3 = {cal_tdata[103:96],cal_tdata[111:104]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_12_T_3 = {cal_tdata[199:192],cal_tdata[207:200]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_17_T_3 = {cal_tdata[279:272],cal_tdata[287:280]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_18_T_3 = {cal_tdata[295:288],cal_tdata[303:296]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_19_T_3 = {cal_tdata[311:304],cal_tdata[319:312]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_20_T_3 = {cal_tdata[327:320],cal_tdata[335:328]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_21_T_3 = {cal_tdata[343:336],cal_tdata[351:344]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_22_T_3 = {cal_tdata[359:352],cal_tdata[367:360]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_23_T_3 = {cal_tdata[375:368],cal_tdata[383:376]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_24_T_3 = {cal_tdata[391:384],cal_tdata[399:392]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_25_T_3 = {cal_tdata[407:400],cal_tdata[415:408]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_26_T_3 = {cal_tdata[423:416],cal_tdata[431:424]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_27_T_3 = {cal_tdata[439:432],cal_tdata[447:440]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_28_T_3 = {cal_tdata[455:448],cal_tdata[463:456]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_29_T_3 = {cal_tdata[471:464],cal_tdata[479:472]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_30_T_3 = {cal_tdata[487:480],cal_tdata[495:488]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_31_T_3 = {cal_tdata[503:496],cal_tdata[511:504]}; // @[Cat.scala 31:58]
  wire [31:0] tcp_hdr_chksum_result = tcp_hdr_chksum_cal_io_out_sum - 32'h14; // @[TxPipelineHandler.scala 58:61]
  reg [31:0] cal_ip_chksum_reg; // @[TxPipelineHandler.scala 60:34]
  reg [31:0] cal_tcp_chksum_reg; // @[TxPipelineHandler.scala 61:35]
  wire [31:0] _cal_tcp_chksum_reg_T_1 = cal_tcp_chksum_reg + tcp_pld_chksum_cal_io_out_sum; // @[TxPipelineHandler.scala 68:48]
  ReduceAddSync ip_chksum_cal ( // @[TxPipelineHandler.scala 37:29]
    .clock(ip_chksum_cal_clock),
    .io_in_vec_0(ip_chksum_cal_io_in_vec_0),
    .io_in_vec_1(ip_chksum_cal_io_in_vec_1),
    .io_in_vec_2(ip_chksum_cal_io_in_vec_2),
    .io_in_vec_3(ip_chksum_cal_io_in_vec_3),
    .io_in_vec_4(ip_chksum_cal_io_in_vec_4),
    .io_in_vec_5(ip_chksum_cal_io_in_vec_5),
    .io_in_vec_6(ip_chksum_cal_io_in_vec_6),
    .io_in_vec_7(ip_chksum_cal_io_in_vec_7),
    .io_in_vec_8(ip_chksum_cal_io_in_vec_8),
    .io_in_vec_9(ip_chksum_cal_io_in_vec_9),
    .io_out_sum(ip_chksum_cal_io_out_sum)
  );
  ReduceAddSync_1 tcp_pld_chksum_cal ( // @[TxPipelineHandler.scala 45:34]
    .clock(tcp_pld_chksum_cal_clock),
    .io_in_vec_0(tcp_pld_chksum_cal_io_in_vec_0),
    .io_in_vec_1(tcp_pld_chksum_cal_io_in_vec_1),
    .io_in_vec_2(tcp_pld_chksum_cal_io_in_vec_2),
    .io_in_vec_3(tcp_pld_chksum_cal_io_in_vec_3),
    .io_in_vec_4(tcp_pld_chksum_cal_io_in_vec_4),
    .io_in_vec_5(tcp_pld_chksum_cal_io_in_vec_5),
    .io_in_vec_6(tcp_pld_chksum_cal_io_in_vec_6),
    .io_in_vec_7(tcp_pld_chksum_cal_io_in_vec_7),
    .io_in_vec_8(tcp_pld_chksum_cal_io_in_vec_8),
    .io_in_vec_9(tcp_pld_chksum_cal_io_in_vec_9),
    .io_in_vec_10(tcp_pld_chksum_cal_io_in_vec_10),
    .io_in_vec_11(tcp_pld_chksum_cal_io_in_vec_11),
    .io_in_vec_12(tcp_pld_chksum_cal_io_in_vec_12),
    .io_in_vec_13(tcp_pld_chksum_cal_io_in_vec_13),
    .io_in_vec_14(tcp_pld_chksum_cal_io_in_vec_14),
    .io_in_vec_15(tcp_pld_chksum_cal_io_in_vec_15),
    .io_in_vec_16(tcp_pld_chksum_cal_io_in_vec_16),
    .io_in_vec_17(tcp_pld_chksum_cal_io_in_vec_17),
    .io_in_vec_18(tcp_pld_chksum_cal_io_in_vec_18),
    .io_in_vec_19(tcp_pld_chksum_cal_io_in_vec_19),
    .io_in_vec_20(tcp_pld_chksum_cal_io_in_vec_20),
    .io_in_vec_21(tcp_pld_chksum_cal_io_in_vec_21),
    .io_in_vec_22(tcp_pld_chksum_cal_io_in_vec_22),
    .io_in_vec_23(tcp_pld_chksum_cal_io_in_vec_23),
    .io_in_vec_24(tcp_pld_chksum_cal_io_in_vec_24),
    .io_in_vec_25(tcp_pld_chksum_cal_io_in_vec_25),
    .io_in_vec_26(tcp_pld_chksum_cal_io_in_vec_26),
    .io_in_vec_27(tcp_pld_chksum_cal_io_in_vec_27),
    .io_in_vec_28(tcp_pld_chksum_cal_io_in_vec_28),
    .io_in_vec_29(tcp_pld_chksum_cal_io_in_vec_29),
    .io_in_vec_30(tcp_pld_chksum_cal_io_in_vec_30),
    .io_in_vec_31(tcp_pld_chksum_cal_io_in_vec_31),
    .io_out_sum(tcp_pld_chksum_cal_io_out_sum)
  );
  ReduceAddSync_1 tcp_hdr_chksum_cal ( // @[TxPipelineHandler.scala 52:34]
    .clock(tcp_hdr_chksum_cal_clock),
    .io_in_vec_0(tcp_hdr_chksum_cal_io_in_vec_0),
    .io_in_vec_1(tcp_hdr_chksum_cal_io_in_vec_1),
    .io_in_vec_2(tcp_hdr_chksum_cal_io_in_vec_2),
    .io_in_vec_3(tcp_hdr_chksum_cal_io_in_vec_3),
    .io_in_vec_4(tcp_hdr_chksum_cal_io_in_vec_4),
    .io_in_vec_5(tcp_hdr_chksum_cal_io_in_vec_5),
    .io_in_vec_6(tcp_hdr_chksum_cal_io_in_vec_6),
    .io_in_vec_7(tcp_hdr_chksum_cal_io_in_vec_7),
    .io_in_vec_8(tcp_hdr_chksum_cal_io_in_vec_8),
    .io_in_vec_9(tcp_hdr_chksum_cal_io_in_vec_9),
    .io_in_vec_10(tcp_hdr_chksum_cal_io_in_vec_10),
    .io_in_vec_11(tcp_hdr_chksum_cal_io_in_vec_11),
    .io_in_vec_12(tcp_hdr_chksum_cal_io_in_vec_12),
    .io_in_vec_13(tcp_hdr_chksum_cal_io_in_vec_13),
    .io_in_vec_14(tcp_hdr_chksum_cal_io_in_vec_14),
    .io_in_vec_15(tcp_hdr_chksum_cal_io_in_vec_15),
    .io_in_vec_16(tcp_hdr_chksum_cal_io_in_vec_16),
    .io_in_vec_17(tcp_hdr_chksum_cal_io_in_vec_17),
    .io_in_vec_18(tcp_hdr_chksum_cal_io_in_vec_18),
    .io_in_vec_19(tcp_hdr_chksum_cal_io_in_vec_19),
    .io_in_vec_20(tcp_hdr_chksum_cal_io_in_vec_20),
    .io_in_vec_21(tcp_hdr_chksum_cal_io_in_vec_21),
    .io_in_vec_22(tcp_hdr_chksum_cal_io_in_vec_22),
    .io_in_vec_23(tcp_hdr_chksum_cal_io_in_vec_23),
    .io_in_vec_24(tcp_hdr_chksum_cal_io_in_vec_24),
    .io_in_vec_25(tcp_hdr_chksum_cal_io_in_vec_25),
    .io_in_vec_26(tcp_hdr_chksum_cal_io_in_vec_26),
    .io_in_vec_27(tcp_hdr_chksum_cal_io_in_vec_27),
    .io_in_vec_28(tcp_hdr_chksum_cal_io_in_vec_28),
    .io_in_vec_29(tcp_hdr_chksum_cal_io_in_vec_29),
    .io_in_vec_30(tcp_hdr_chksum_cal_io_in_vec_30),
    .io_in_vec_31(tcp_hdr_chksum_cal_io_in_vec_31),
    .io_out_sum(tcp_hdr_chksum_cal_io_out_sum)
  );
  assign io_in_tready = io_out_tready | ~in_reg_used_reg; // @[TxPipelineHandler.scala 26:46]
  assign io_out_tdata = in_reg_r[513:2]; // @[TxPipelineHandler.scala 15:116]
  assign io_out_tvalid = in_reg_tvalid & in_reg_used_reg; // @[TxPipelineHandler.scala 28:46]
  assign io_out_tlast = in_reg_r[0]; // @[TxPipelineHandler.scala 15:116]
  assign io_out_tx_info_ip_chksum = first_beat_reg ? ip_chksum_cal_io_out_sum : cal_ip_chksum_reg; // @[TxPipelineHandler.scala 71:34]
  assign io_out_tx_info_tcp_chksum = first_beat_reg ? tcp_hdr_chksum_result : _cal_tcp_chksum_reg_T_1; // @[TxPipelineHandler.scala 72:35]
  assign io_out_extern_config_c2h_match_op = io_in_extern_config_c2h_match_op; // @[TxPipelineHandler.scala 31:24]
  assign ip_chksum_cal_clock = clock;
  assign ip_chksum_cal_io_in_vec_0 = {{16'd0}, _ip_chksum_cal_io_in_vec_0_T_3}; // @[TxPipelineHandler.scala 40:37]
  assign ip_chksum_cal_io_in_vec_1 = {{16'd0}, _ip_chksum_cal_io_in_vec_1_T_3}; // @[TxPipelineHandler.scala 40:37]
  assign ip_chksum_cal_io_in_vec_2 = {{16'd0}, _ip_chksum_cal_io_in_vec_2_T_3}; // @[TxPipelineHandler.scala 40:37]
  assign ip_chksum_cal_io_in_vec_3 = {{16'd0}, _ip_chksum_cal_io_in_vec_3_T_3}; // @[TxPipelineHandler.scala 40:37]
  assign ip_chksum_cal_io_in_vec_4 = {{16'd0}, _ip_chksum_cal_io_in_vec_4_T_3}; // @[TxPipelineHandler.scala 40:37]
  assign ip_chksum_cal_io_in_vec_5 = 32'h0; // @[TxPipelineHandler.scala 39:44]
  assign ip_chksum_cal_io_in_vec_6 = {{16'd0}, _ip_chksum_cal_io_in_vec_6_T_3}; // @[TxPipelineHandler.scala 40:37]
  assign ip_chksum_cal_io_in_vec_7 = {{16'd0}, _ip_chksum_cal_io_in_vec_7_T_3}; // @[TxPipelineHandler.scala 40:37]
  assign ip_chksum_cal_io_in_vec_8 = {{16'd0}, _ip_chksum_cal_io_in_vec_8_T_3}; // @[TxPipelineHandler.scala 40:37]
  assign ip_chksum_cal_io_in_vec_9 = {{16'd0}, _ip_chksum_cal_io_in_vec_9_T_3}; // @[TxPipelineHandler.scala 40:37]
  assign tcp_pld_chksum_cal_clock = clock;
  assign tcp_pld_chksum_cal_io_in_vec_0 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_0_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_1 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_1_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_2 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_2_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_3 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_3_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_4 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_4_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_5 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_5_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_6 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_6_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_7 = {{16'd0}, _ip_chksum_cal_io_in_vec_0_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_8 = {{16'd0}, _ip_chksum_cal_io_in_vec_1_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_9 = {{16'd0}, _ip_chksum_cal_io_in_vec_2_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_10 = {{16'd0}, _ip_chksum_cal_io_in_vec_3_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_11 = {{16'd0}, _ip_chksum_cal_io_in_vec_4_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_12 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_12_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_13 = {{16'd0}, _ip_chksum_cal_io_in_vec_6_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_14 = {{16'd0}, _ip_chksum_cal_io_in_vec_7_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_15 = {{16'd0}, _ip_chksum_cal_io_in_vec_8_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_16 = {{16'd0}, _ip_chksum_cal_io_in_vec_9_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_17 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_17_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_18 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_18_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_19 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_19_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_20 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_20_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_21 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_21_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_22 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_22_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_23 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_23_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_24 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_24_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_25 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_25_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_26 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_26_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_27 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_27_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_28 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_28_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_29 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_29_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_30 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_30_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_pld_chksum_cal_io_in_vec_31 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_31_T_3}; // @[TxPipelineHandler.scala 47:37]
  assign tcp_hdr_chksum_cal_clock = clock;
  assign tcp_hdr_chksum_cal_io_in_vec_0 = 32'h0; // @[TxPipelineHandler.scala 56:42]
  assign tcp_hdr_chksum_cal_io_in_vec_1 = 32'h0; // @[TxPipelineHandler.scala 56:42]
  assign tcp_hdr_chksum_cal_io_in_vec_2 = 32'h0; // @[TxPipelineHandler.scala 56:42]
  assign tcp_hdr_chksum_cal_io_in_vec_3 = 32'h0; // @[TxPipelineHandler.scala 56:42]
  assign tcp_hdr_chksum_cal_io_in_vec_4 = 32'h0; // @[TxPipelineHandler.scala 56:42]
  assign tcp_hdr_chksum_cal_io_in_vec_5 = 32'h0; // @[TxPipelineHandler.scala 56:42]
  assign tcp_hdr_chksum_cal_io_in_vec_6 = 32'h0; // @[TxPipelineHandler.scala 56:42]
  assign tcp_hdr_chksum_cal_io_in_vec_7 = 32'h0; // @[TxPipelineHandler.scala 56:42]
  assign tcp_hdr_chksum_cal_io_in_vec_8 = {{16'd0}, _ip_chksum_cal_io_in_vec_1_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_9 = 32'h0; // @[TxPipelineHandler.scala 56:42]
  assign tcp_hdr_chksum_cal_io_in_vec_10 = 32'h0; // @[TxPipelineHandler.scala 56:42]
  assign tcp_hdr_chksum_cal_io_in_vec_11 = {{24'd0}, cal_tdata[191:184]}; // @[TxPipelineHandler.scala 55:53]
  assign tcp_hdr_chksum_cal_io_in_vec_12 = 32'h0; // @[TxPipelineHandler.scala 56:42]
  assign tcp_hdr_chksum_cal_io_in_vec_13 = {{16'd0}, _ip_chksum_cal_io_in_vec_6_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_14 = {{16'd0}, _ip_chksum_cal_io_in_vec_7_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_15 = {{16'd0}, _ip_chksum_cal_io_in_vec_8_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_16 = {{16'd0}, _ip_chksum_cal_io_in_vec_9_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_17 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_17_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_18 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_18_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_19 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_19_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_20 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_20_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_21 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_21_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_22 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_22_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_23 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_23_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_24 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_24_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_25 = 32'h0; // @[TxPipelineHandler.scala 56:42]
  assign tcp_hdr_chksum_cal_io_in_vec_26 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_26_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_27 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_27_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_28 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_28_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_29 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_29_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_30 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_30_T_3}; // @[TxPipelineHandler.scala 54:67]
  assign tcp_hdr_chksum_cal_io_in_vec_31 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_31_T_3}; // @[TxPipelineHandler.scala 54:67]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 28:20]
      in_reg_r <= 578'h1; // @[Reg.scala 28:20]
    end else if (in_shake_hand) begin // @[Reg.scala 29:18]
      in_reg_r <= _in_reg_T_1; // @[Reg.scala 29:22]
    end
    first_beat_reg <= reset | _GEN_1; // @[Reg.scala 28:{20,20}]
    if (reset) begin // @[TxPipelineHandler.scala 19:32]
      in_reg_used_reg <= 1'h0; // @[TxPipelineHandler.scala 19:32]
    end else begin
      in_reg_used_reg <= _GEN_3;
    end
    if (reset) begin // @[TxPipelineHandler.scala 60:34]
      cal_ip_chksum_reg <= 32'h0; // @[TxPipelineHandler.scala 60:34]
    end else if (in_shake_hand) begin // @[TxPipelineHandler.scala 63:24]
      if (first_beat_reg) begin // @[TxPipelineHandler.scala 64:27]
        cal_ip_chksum_reg <= ip_chksum_cal_io_out_sum; // @[TxPipelineHandler.scala 65:25]
      end
    end
    if (reset) begin // @[TxPipelineHandler.scala 61:35]
      cal_tcp_chksum_reg <= 32'h0; // @[TxPipelineHandler.scala 61:35]
    end else if (in_shake_hand) begin // @[TxPipelineHandler.scala 63:24]
      if (first_beat_reg) begin // @[TxPipelineHandler.scala 64:27]
        cal_tcp_chksum_reg <= tcp_hdr_chksum_result; // @[TxPipelineHandler.scala 66:26]
      end else begin
        cal_tcp_chksum_reg <= _cal_tcp_chksum_reg_T_1; // @[TxPipelineHandler.scala 68:26]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {19{`RANDOM}};
  in_reg_r = _RAND_0[577:0];
  _RAND_1 = {1{`RANDOM}};
  first_beat_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  in_reg_used_reg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cal_ip_chksum_reg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  cal_tcp_chksum_reg = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TxPipeline(
  input          clock,
  input          reset,
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input  [7:0]   io_in_extern_config_c2h_match_op,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  output [31:0]  io_out_tx_info_ip_chksum,
  output [31:0]  io_out_tx_info_tcp_chksum,
  output [7:0]   io_out_extern_config_c2h_match_op
);
  wire  tx_chksum_generator_clock; // @[TxPipeline.scala 15:35]
  wire  tx_chksum_generator_reset; // @[TxPipeline.scala 15:35]
  wire [511:0] tx_chksum_generator_io_in_tdata; // @[TxPipeline.scala 15:35]
  wire  tx_chksum_generator_io_in_tvalid; // @[TxPipeline.scala 15:35]
  wire  tx_chksum_generator_io_in_tready; // @[TxPipeline.scala 15:35]
  wire  tx_chksum_generator_io_in_tlast; // @[TxPipeline.scala 15:35]
  wire [7:0] tx_chksum_generator_io_in_extern_config_c2h_match_op; // @[TxPipeline.scala 15:35]
  wire [511:0] tx_chksum_generator_io_out_tdata; // @[TxPipeline.scala 15:35]
  wire  tx_chksum_generator_io_out_tvalid; // @[TxPipeline.scala 15:35]
  wire  tx_chksum_generator_io_out_tready; // @[TxPipeline.scala 15:35]
  wire  tx_chksum_generator_io_out_tlast; // @[TxPipeline.scala 15:35]
  wire [31:0] tx_chksum_generator_io_out_tx_info_ip_chksum; // @[TxPipeline.scala 15:35]
  wire [31:0] tx_chksum_generator_io_out_tx_info_tcp_chksum; // @[TxPipeline.scala 15:35]
  wire [7:0] tx_chksum_generator_io_out_extern_config_c2h_match_op; // @[TxPipeline.scala 15:35]
  TxChksumGenerator tx_chksum_generator ( // @[TxPipeline.scala 15:35]
    .clock(tx_chksum_generator_clock),
    .reset(tx_chksum_generator_reset),
    .io_in_tdata(tx_chksum_generator_io_in_tdata),
    .io_in_tvalid(tx_chksum_generator_io_in_tvalid),
    .io_in_tready(tx_chksum_generator_io_in_tready),
    .io_in_tlast(tx_chksum_generator_io_in_tlast),
    .io_in_extern_config_c2h_match_op(tx_chksum_generator_io_in_extern_config_c2h_match_op),
    .io_out_tdata(tx_chksum_generator_io_out_tdata),
    .io_out_tvalid(tx_chksum_generator_io_out_tvalid),
    .io_out_tready(tx_chksum_generator_io_out_tready),
    .io_out_tlast(tx_chksum_generator_io_out_tlast),
    .io_out_tx_info_ip_chksum(tx_chksum_generator_io_out_tx_info_ip_chksum),
    .io_out_tx_info_tcp_chksum(tx_chksum_generator_io_out_tx_info_tcp_chksum),
    .io_out_extern_config_c2h_match_op(tx_chksum_generator_io_out_extern_config_c2h_match_op)
  );
  assign io_in_tready = tx_chksum_generator_io_in_tready; // @[TxPipeline.scala 16:9]
  assign io_out_tdata = tx_chksum_generator_io_out_tdata; // @[TxPipeline.scala 17:30]
  assign io_out_tvalid = tx_chksum_generator_io_out_tvalid; // @[TxPipeline.scala 17:30]
  assign io_out_tlast = tx_chksum_generator_io_out_tlast; // @[TxPipeline.scala 17:30]
  assign io_out_tx_info_ip_chksum = tx_chksum_generator_io_out_tx_info_ip_chksum; // @[TxPipeline.scala 17:30]
  assign io_out_tx_info_tcp_chksum = tx_chksum_generator_io_out_tx_info_tcp_chksum; // @[TxPipeline.scala 17:30]
  assign io_out_extern_config_c2h_match_op = tx_chksum_generator_io_out_extern_config_c2h_match_op; // @[TxPipeline.scala 17:30]
  assign tx_chksum_generator_clock = clock;
  assign tx_chksum_generator_reset = reset;
  assign tx_chksum_generator_io_in_tdata = io_in_tdata; // @[TxPipeline.scala 16:9]
  assign tx_chksum_generator_io_in_tvalid = io_in_tvalid; // @[TxPipeline.scala 16:9]
  assign tx_chksum_generator_io_in_tlast = io_in_tlast; // @[TxPipeline.scala 16:9]
  assign tx_chksum_generator_io_in_extern_config_c2h_match_op = io_in_extern_config_c2h_match_op; // @[TxPipeline.scala 16:9]
  assign tx_chksum_generator_io_out_tready = io_out_tready; // @[TxPipeline.scala 17:30]
endmodule
module TxBufferFifo(
  input          clock,
  input          reset,
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input  [31:0]  io_in_tx_info_ip_chksum,
  input  [31:0]  io_in_tx_info_tcp_chksum,
  input  [7:0]   io_in_extern_config_c2h_match_op,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  input          io_reset_counter,
  output [31:0]  io_h2c_pack_counter,
  output [31:0]  io_h2c_err_counter
);
`ifdef RANDOMIZE_MEM_INIT
  reg [511:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
`endif // RANDOMIZE_REG_INIT
  reg [511:0] data_buf_reg [0:63]; // @[TxBufferFifo.scala 39:33]
  wire  data_buf_reg_rd_data_en; // @[TxBufferFifo.scala 39:33]
  wire [5:0] data_buf_reg_rd_data_addr; // @[TxBufferFifo.scala 39:33]
  wire [511:0] data_buf_reg_rd_data_data; // @[TxBufferFifo.scala 39:33]
  wire [511:0] data_buf_reg_MPORT_data; // @[TxBufferFifo.scala 39:33]
  wire [5:0] data_buf_reg_MPORT_addr; // @[TxBufferFifo.scala 39:33]
  wire  data_buf_reg_MPORT_mask; // @[TxBufferFifo.scala 39:33]
  wire  data_buf_reg_MPORT_en; // @[TxBufferFifo.scala 39:33]
  reg  data_buf_reg_rd_data_en_pipe_0;
  reg [5:0] data_buf_reg_rd_data_addr_pipe_0;
  wire  in_shake_hand = io_in_tvalid & io_in_tready; // @[TxBufferFifo.scala 38:36]
  reg  info_buf_reg_0_used; // @[TxBufferFifo.scala 42:29]
  reg  info_buf_reg_0_valid; // @[TxBufferFifo.scala 42:29]
  reg  info_buf_reg_0_chksum_offload; // @[TxBufferFifo.scala 42:29]
  reg [1:0] info_buf_reg_0_pkt_type; // @[TxBufferFifo.scala 42:29]
  reg [15:0] info_buf_reg_0_ip_chksum; // @[TxBufferFifo.scala 42:29]
  reg [15:0] info_buf_reg_0_tcp_chksum; // @[TxBufferFifo.scala 42:29]
  reg [5:0] info_buf_reg_0_burst; // @[TxBufferFifo.scala 42:29]
  reg  info_buf_reg_1_used; // @[TxBufferFifo.scala 42:29]
  reg  info_buf_reg_1_valid; // @[TxBufferFifo.scala 42:29]
  reg  info_buf_reg_1_chksum_offload; // @[TxBufferFifo.scala 42:29]
  reg [1:0] info_buf_reg_1_pkt_type; // @[TxBufferFifo.scala 42:29]
  reg [15:0] info_buf_reg_1_ip_chksum; // @[TxBufferFifo.scala 42:29]
  reg [15:0] info_buf_reg_1_tcp_chksum; // @[TxBufferFifo.scala 42:29]
  reg [5:0] info_buf_reg_1_burst; // @[TxBufferFifo.scala 42:29]
  reg [6:0] wr_index_reg; // @[TxBufferFifo.scala 43:29]
  reg [6:0] rd_index_reg; // @[TxBufferFifo.scala 44:29]
  reg [6:0] wr_pos_reg; // @[TxBufferFifo.scala 45:29]
  reg [6:0] rd_pos_reg; // @[TxBufferFifo.scala 46:29]
  wire  buf_full = info_buf_reg_0_valid & info_buf_reg_1_valid; // @[TxBufferFifo.scala 51:40]
  reg [31:0] pack_counter; // @[TxBufferFifo.scala 54:29]
  reg [31:0] err_counter; // @[TxBufferFifo.scala 55:28]
  reg  is_overflowed; // @[TxBufferFifo.scala 62:30]
  wire [15:0] _mid_ip_chksum_T_3 = io_in_tx_info_ip_chksum[31:16] + io_in_tx_info_ip_chksum[15:0]; // @[Misc.scala 14:14]
  wire [15:0] _mid_tcp_chksum_T_3 = io_in_tx_info_tcp_chksum[31:16] + io_in_tx_info_tcp_chksum[15:0]; // @[Misc.scala 14:14]
  wire [31:0] mid_ip_chksum = {{16'd0}, _mid_ip_chksum_T_3}; // @[TxBufferFifo.scala 65:27 66:17]
  wire [15:0] _end_ip_chksum_T_3 = mid_ip_chksum[31:16] + mid_ip_chksum[15:0]; // @[Misc.scala 14:14]
  wire [15:0] end_ip_chksum = ~_end_ip_chksum_T_3; // @[TxBufferFifo.scala 71:20]
  wire [31:0] mid_tcp_chksum = {{16'd0}, _mid_tcp_chksum_T_3}; // @[TxBufferFifo.scala 67:28 68:18]
  wire [15:0] _end_tcp_chksum_T_3 = mid_tcp_chksum[31:16] + mid_tcp_chksum[15:0]; // @[Misc.scala 14:14]
  wire [15:0] end_tcp_chksum = ~_end_tcp_chksum_T_3; // @[TxBufferFifo.scala 73:21]
  wire [31:0] _pack_counter_T_1 = pack_counter + 32'h1; // @[TxBufferFifo.scala 82:38]
  wire [5:0] _GEN_2 = wr_index_reg[0] ? info_buf_reg_1_burst : info_buf_reg_0_burst; // @[TxBufferFifo.scala 84:{46,46}]
  wire [11:0] _GEN_236 = {wr_index_reg, 5'h0}; // @[TxBufferFifo.scala 94:40]
  wire [13:0] _wr_pos_reg_T = {{2'd0}, _GEN_236}; // @[TxBufferFifo.scala 94:40]
  wire  _GEN_3 = ~io_in_tlast | is_overflowed; // @[TxBufferFifo.scala 86:29 87:25 62:30]
  wire [13:0] _GEN_4 = ~io_in_tlast ? {{7'd0}, wr_pos_reg} : _wr_pos_reg_T; // @[TxBufferFifo.scala 45:29 86:29 94:24]
  wire [31:0] _err_counter_T_1 = err_counter + 32'h1; // @[TxBufferFifo.scala 97:36]
  wire [5:0] _GEN_5 = ~wr_index_reg[0] ? 6'h0 : info_buf_reg_0_burst; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire [5:0] _GEN_6 = wr_index_reg[0] ? 6'h0 : info_buf_reg_1_burst; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire [15:0] _GEN_7 = ~wr_index_reg[0] ? 16'h0 : info_buf_reg_0_tcp_chksum; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire [15:0] _GEN_8 = wr_index_reg[0] ? 16'h0 : info_buf_reg_1_tcp_chksum; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire [15:0] _GEN_9 = ~wr_index_reg[0] ? 16'h0 : info_buf_reg_0_ip_chksum; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire [15:0] _GEN_10 = wr_index_reg[0] ? 16'h0 : info_buf_reg_1_ip_chksum; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire [1:0] _GEN_11 = ~wr_index_reg[0] ? 2'h0 : info_buf_reg_0_pkt_type; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire [1:0] _GEN_12 = wr_index_reg[0] ? 2'h0 : info_buf_reg_1_pkt_type; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire  _GEN_13 = ~wr_index_reg[0] ? 1'h0 : info_buf_reg_0_chksum_offload; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire  _GEN_14 = wr_index_reg[0] ? 1'h0 : info_buf_reg_1_chksum_offload; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire  _GEN_15 = ~wr_index_reg[0] ? 1'h0 : info_buf_reg_0_valid; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire  _GEN_16 = wr_index_reg[0] ? 1'h0 : info_buf_reg_1_valid; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire  _GEN_17 = ~wr_index_reg[0] ? 1'h0 : info_buf_reg_0_used; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire  _GEN_18 = wr_index_reg[0] ? 1'h0 : info_buf_reg_1_used; // @[TxBufferFifo.scala 42:29 98:{36,36}]
  wire  _T_4 = ~is_overflowed; // @[TxBufferFifo.scala 102:15]
  wire  _GEN_20 = wr_index_reg[0] ? info_buf_reg_1_used : info_buf_reg_0_used; // @[TxBufferFifo.scala 104:{17,17}]
  wire [15:0] _info_buf_reg_pkt_type_T_3 = {io_in_tdata[103:96],io_in_tdata[111:104]}; // @[Cat.scala 31:58]
  wire  _info_buf_reg_pkt_type_T_4 = _info_buf_reg_pkt_type_T_3 == 16'h800; // @[TxBufferFifo.scala 105:94]
  wire  _info_buf_reg_pkt_type_T_7 = _info_buf_reg_pkt_type_T_3 == 16'h800 & io_in_tdata[191:184] == 8'h6; // @[TxBufferFifo.scala 105:110]
  wire [1:0] _info_buf_reg_pkt_type_T_13 = {_info_buf_reg_pkt_type_T_7,_info_buf_reg_pkt_type_T_4}; // @[Cat.scala 31:58]
  wire [1:0] _GEN_21 = ~wr_index_reg[0] ? _info_buf_reg_pkt_type_T_13 : info_buf_reg_0_pkt_type; // @[TxBufferFifo.scala 105:{49,49} 42:29]
  wire [1:0] _GEN_22 = wr_index_reg[0] ? _info_buf_reg_pkt_type_T_13 : info_buf_reg_1_pkt_type; // @[TxBufferFifo.scala 105:{49,49} 42:29]
  wire  _GEN_237 = ~wr_index_reg[0]; // @[TxBufferFifo.scala 107:{45,45} 42:29]
  wire  _GEN_23 = ~wr_index_reg[0] | info_buf_reg_0_used; // @[TxBufferFifo.scala 107:{45,45} 42:29]
  wire  _GEN_24 = wr_index_reg[0] | info_buf_reg_1_used; // @[TxBufferFifo.scala 107:{45,45} 42:29]
  wire  _GEN_25 = ~wr_index_reg[0] ? io_in_extern_config_c2h_match_op[6] : info_buf_reg_0_chksum_offload; // @[TxBufferFifo.scala 108:{55,55} 42:29]
  wire  _GEN_26 = wr_index_reg[0] ? io_in_extern_config_c2h_match_op[6] : info_buf_reg_1_chksum_offload; // @[TxBufferFifo.scala 108:{55,55} 42:29]
  wire [1:0] _GEN_27 = ~_GEN_20 ? _GEN_21 : info_buf_reg_0_pkt_type; // @[TxBufferFifo.scala 104:51 42:29]
  wire [1:0] _GEN_28 = ~_GEN_20 ? _GEN_22 : info_buf_reg_1_pkt_type; // @[TxBufferFifo.scala 104:51 42:29]
  wire  _GEN_29 = ~_GEN_20 ? _GEN_23 : info_buf_reg_0_used; // @[TxBufferFifo.scala 104:51 42:29]
  wire  _GEN_30 = ~_GEN_20 ? _GEN_24 : info_buf_reg_1_used; // @[TxBufferFifo.scala 104:51 42:29]
  wire  _GEN_31 = ~_GEN_20 ? _GEN_25 : info_buf_reg_0_chksum_offload; // @[TxBufferFifo.scala 104:51 42:29]
  wire  _GEN_32 = ~_GEN_20 ? _GEN_26 : info_buf_reg_1_chksum_offload; // @[TxBufferFifo.scala 104:51 42:29]
  wire [5:0] _info_buf_reg_burst_T_2 = _GEN_2 + 6'h1; // @[TxBufferFifo.scala 111:80]
  wire [5:0] _GEN_35 = ~wr_index_reg[0] ? _info_buf_reg_burst_T_2 : info_buf_reg_0_burst; // @[TxBufferFifo.scala 111:{44,44} 42:29]
  wire [5:0] _GEN_36 = wr_index_reg[0] ? _info_buf_reg_burst_T_2 : info_buf_reg_1_burst; // @[TxBufferFifo.scala 111:{44,44} 42:29]
  wire  _GEN_37 = _GEN_237 | info_buf_reg_0_valid; // @[TxBufferFifo.scala 113:{46,46} 42:29]
  wire  _GEN_38 = wr_index_reg[0] | info_buf_reg_1_valid; // @[TxBufferFifo.scala 113:{46,46} 42:29]
  wire [15:0] _GEN_39 = ~wr_index_reg[0] ? end_ip_chksum : info_buf_reg_0_ip_chksum; // @[TxBufferFifo.scala 114:{50,50} 42:29]
  wire [15:0] _GEN_40 = wr_index_reg[0] ? end_ip_chksum : info_buf_reg_1_ip_chksum; // @[TxBufferFifo.scala 114:{50,50} 42:29]
  wire [15:0] _GEN_41 = ~wr_index_reg[0] ? end_tcp_chksum : info_buf_reg_0_tcp_chksum; // @[TxBufferFifo.scala 115:{51,51} 42:29]
  wire [15:0] _GEN_42 = wr_index_reg[0] ? end_tcp_chksum : info_buf_reg_1_tcp_chksum; // @[TxBufferFifo.scala 115:{51,51} 42:29]
  wire [6:0] _wr_index_reg_T_1 = wr_index_reg + 7'h1; // @[TxBufferFifo.scala 33:12]
  wire [6:0] _wr_index_reg_T_2 = _wr_index_reg_T_1 & 7'h1; // @[TxBufferFifo.scala 33:19]
  wire [11:0] _GEN_239 = {_wr_index_reg_T_2, 5'h0}; // @[TxBufferFifo.scala 117:51]
  wire [13:0] _wr_pos_reg_T_4 = {{2'd0}, _GEN_239}; // @[TxBufferFifo.scala 117:51]
  wire [6:0] _wr_pos_reg_T_6 = wr_pos_reg + 7'h1; // @[TxBufferFifo.scala 119:38]
  wire  _GEN_43 = io_in_tlast ? _GEN_37 : info_buf_reg_0_valid; // @[TxBufferFifo.scala 112:30 42:29]
  wire  _GEN_44 = io_in_tlast ? _GEN_38 : info_buf_reg_1_valid; // @[TxBufferFifo.scala 112:30 42:29]
  wire [15:0] _GEN_45 = io_in_tlast ? _GEN_39 : info_buf_reg_0_ip_chksum; // @[TxBufferFifo.scala 112:30 42:29]
  wire [15:0] _GEN_46 = io_in_tlast ? _GEN_40 : info_buf_reg_1_ip_chksum; // @[TxBufferFifo.scala 112:30 42:29]
  wire [15:0] _GEN_47 = io_in_tlast ? _GEN_41 : info_buf_reg_0_tcp_chksum; // @[TxBufferFifo.scala 112:30 42:29]
  wire [15:0] _GEN_48 = io_in_tlast ? _GEN_42 : info_buf_reg_1_tcp_chksum; // @[TxBufferFifo.scala 112:30 42:29]
  wire [6:0] _GEN_49 = io_in_tlast ? _wr_index_reg_T_2 : wr_index_reg; // @[TxBufferFifo.scala 112:30 116:26 43:29]
  wire [13:0] _GEN_50 = io_in_tlast ? _wr_pos_reg_T_4 : {{7'd0}, _wr_pos_reg_T_6}; // @[TxBufferFifo.scala 112:30 117:24 119:24]
  wire  _GEN_51 = io_in_tlast ? 1'h0 : is_overflowed; // @[TxBufferFifo.scala 121:34 123:25 62:30]
  wire [13:0] _GEN_52 = io_in_tlast ? _wr_pos_reg_T : {{7'd0}, wr_pos_reg}; // @[TxBufferFifo.scala 121:34 124:22 45:29]
  wire [1:0] _GEN_53 = ~is_overflowed ? _GEN_27 : info_buf_reg_0_pkt_type; // @[TxBufferFifo.scala 102:30 42:29]
  wire [1:0] _GEN_54 = ~is_overflowed ? _GEN_28 : info_buf_reg_1_pkt_type; // @[TxBufferFifo.scala 102:30 42:29]
  wire  _GEN_55 = ~is_overflowed ? _GEN_29 : info_buf_reg_0_used; // @[TxBufferFifo.scala 102:30 42:29]
  wire  _GEN_56 = ~is_overflowed ? _GEN_30 : info_buf_reg_1_used; // @[TxBufferFifo.scala 102:30 42:29]
  wire  _GEN_57 = ~is_overflowed ? _GEN_31 : info_buf_reg_0_chksum_offload; // @[TxBufferFifo.scala 102:30 42:29]
  wire  _GEN_58 = ~is_overflowed ? _GEN_32 : info_buf_reg_1_chksum_offload; // @[TxBufferFifo.scala 102:30 42:29]
  wire [5:0] _GEN_64 = ~is_overflowed ? _GEN_35 : info_buf_reg_0_burst; // @[TxBufferFifo.scala 102:30 42:29]
  wire [5:0] _GEN_65 = ~is_overflowed ? _GEN_36 : info_buf_reg_1_burst; // @[TxBufferFifo.scala 102:30 42:29]
  wire  _GEN_66 = ~is_overflowed ? _GEN_43 : info_buf_reg_0_valid; // @[TxBufferFifo.scala 102:30 42:29]
  wire  _GEN_67 = ~is_overflowed ? _GEN_44 : info_buf_reg_1_valid; // @[TxBufferFifo.scala 102:30 42:29]
  wire [15:0] _GEN_68 = ~is_overflowed ? _GEN_45 : info_buf_reg_0_ip_chksum; // @[TxBufferFifo.scala 102:30 42:29]
  wire [15:0] _GEN_69 = ~is_overflowed ? _GEN_46 : info_buf_reg_1_ip_chksum; // @[TxBufferFifo.scala 102:30 42:29]
  wire [15:0] _GEN_70 = ~is_overflowed ? _GEN_47 : info_buf_reg_0_tcp_chksum; // @[TxBufferFifo.scala 102:30 42:29]
  wire [15:0] _GEN_71 = ~is_overflowed ? _GEN_48 : info_buf_reg_1_tcp_chksum; // @[TxBufferFifo.scala 102:30 42:29]
  wire [6:0] _GEN_72 = ~is_overflowed ? _GEN_49 : wr_index_reg; // @[TxBufferFifo.scala 102:30 43:29]
  wire [13:0] _GEN_73 = ~is_overflowed ? _GEN_50 : _GEN_52; // @[TxBufferFifo.scala 102:30]
  wire  _GEN_74 = ~is_overflowed ? is_overflowed : _GEN_51; // @[TxBufferFifo.scala 102:30 62:30]
  wire [1:0] _GEN_75 = io_in_tvalid ? _GEN_53 : info_buf_reg_0_pkt_type; // @[TxBufferFifo.scala 100:31 42:29]
  wire [1:0] _GEN_76 = io_in_tvalid ? _GEN_54 : info_buf_reg_1_pkt_type; // @[TxBufferFifo.scala 100:31 42:29]
  wire  _GEN_77 = io_in_tvalid ? _GEN_55 : info_buf_reg_0_used; // @[TxBufferFifo.scala 100:31 42:29]
  wire  _GEN_78 = io_in_tvalid ? _GEN_56 : info_buf_reg_1_used; // @[TxBufferFifo.scala 100:31 42:29]
  wire  _GEN_79 = io_in_tvalid ? _GEN_57 : info_buf_reg_0_chksum_offload; // @[TxBufferFifo.scala 100:31 42:29]
  wire  _GEN_80 = io_in_tvalid ? _GEN_58 : info_buf_reg_1_chksum_offload; // @[TxBufferFifo.scala 100:31 42:29]
  wire  _GEN_83 = io_in_tvalid & _T_4; // @[TxBufferFifo.scala 100:31 39:33]
  wire [5:0] _GEN_86 = io_in_tvalid ? _GEN_64 : info_buf_reg_0_burst; // @[TxBufferFifo.scala 100:31 42:29]
  wire [5:0] _GEN_87 = io_in_tvalid ? _GEN_65 : info_buf_reg_1_burst; // @[TxBufferFifo.scala 100:31 42:29]
  wire  _GEN_88 = io_in_tvalid ? _GEN_66 : info_buf_reg_0_valid; // @[TxBufferFifo.scala 100:31 42:29]
  wire  _GEN_89 = io_in_tvalid ? _GEN_67 : info_buf_reg_1_valid; // @[TxBufferFifo.scala 100:31 42:29]
  wire [15:0] _GEN_90 = io_in_tvalid ? _GEN_68 : info_buf_reg_0_ip_chksum; // @[TxBufferFifo.scala 100:31 42:29]
  wire [15:0] _GEN_91 = io_in_tvalid ? _GEN_69 : info_buf_reg_1_ip_chksum; // @[TxBufferFifo.scala 100:31 42:29]
  wire [15:0] _GEN_92 = io_in_tvalid ? _GEN_70 : info_buf_reg_0_tcp_chksum; // @[TxBufferFifo.scala 100:31 42:29]
  wire [15:0] _GEN_93 = io_in_tvalid ? _GEN_71 : info_buf_reg_1_tcp_chksum; // @[TxBufferFifo.scala 100:31 42:29]
  wire [6:0] _GEN_94 = io_in_tvalid ? _GEN_72 : wr_index_reg; // @[TxBufferFifo.scala 100:31 43:29]
  wire [13:0] _GEN_95 = io_in_tvalid ? _GEN_73 : {{7'd0}, wr_pos_reg}; // @[TxBufferFifo.scala 100:31 45:29]
  wire  _GEN_96 = io_in_tvalid ? _GEN_74 : is_overflowed; // @[TxBufferFifo.scala 100:31 62:30]
  wire [13:0] _GEN_98 = _GEN_2 == 6'h20 ? _GEN_4 : _GEN_95; // @[TxBufferFifo.scala 84:63]
  wire [5:0] _GEN_100 = _GEN_2 == 6'h20 ? _GEN_5 : _GEN_86; // @[TxBufferFifo.scala 84:63]
  wire [5:0] _GEN_101 = _GEN_2 == 6'h20 ? _GEN_6 : _GEN_87; // @[TxBufferFifo.scala 84:63]
  wire [15:0] _GEN_102 = _GEN_2 == 6'h20 ? _GEN_7 : _GEN_92; // @[TxBufferFifo.scala 84:63]
  wire [15:0] _GEN_103 = _GEN_2 == 6'h20 ? _GEN_8 : _GEN_93; // @[TxBufferFifo.scala 84:63]
  wire [15:0] _GEN_104 = _GEN_2 == 6'h20 ? _GEN_9 : _GEN_90; // @[TxBufferFifo.scala 84:63]
  wire [15:0] _GEN_105 = _GEN_2 == 6'h20 ? _GEN_10 : _GEN_91; // @[TxBufferFifo.scala 84:63]
  wire [1:0] _GEN_106 = _GEN_2 == 6'h20 ? _GEN_11 : _GEN_75; // @[TxBufferFifo.scala 84:63]
  wire [1:0] _GEN_107 = _GEN_2 == 6'h20 ? _GEN_12 : _GEN_76; // @[TxBufferFifo.scala 84:63]
  wire  _GEN_108 = _GEN_2 == 6'h20 ? _GEN_13 : _GEN_79; // @[TxBufferFifo.scala 84:63]
  wire  _GEN_109 = _GEN_2 == 6'h20 ? _GEN_14 : _GEN_80; // @[TxBufferFifo.scala 84:63]
  wire  _GEN_110 = _GEN_2 == 6'h20 ? _GEN_15 : _GEN_88; // @[TxBufferFifo.scala 84:63]
  wire  _GEN_111 = _GEN_2 == 6'h20 ? _GEN_16 : _GEN_89; // @[TxBufferFifo.scala 84:63]
  wire  _GEN_112 = _GEN_2 == 6'h20 ? _GEN_17 : _GEN_77; // @[TxBufferFifo.scala 84:63]
  wire  _GEN_113 = _GEN_2 == 6'h20 ? _GEN_18 : _GEN_78; // @[TxBufferFifo.scala 84:63]
  wire  _GEN_116 = _GEN_2 == 6'h20 ? 1'h0 : _GEN_83; // @[TxBufferFifo.scala 39:33 84:63]
  wire [13:0] _GEN_122 = in_shake_hand ? _GEN_98 : {{7'd0}, wr_pos_reg}; // @[TxBufferFifo.scala 45:29 80:31]
  wire [5:0] _GEN_124 = in_shake_hand ? _GEN_100 : info_buf_reg_0_burst; // @[TxBufferFifo.scala 42:29 80:31]
  wire [5:0] _GEN_125 = in_shake_hand ? _GEN_101 : info_buf_reg_1_burst; // @[TxBufferFifo.scala 42:29 80:31]
  wire [15:0] _GEN_126 = in_shake_hand ? _GEN_102 : info_buf_reg_0_tcp_chksum; // @[TxBufferFifo.scala 42:29 80:31]
  wire [15:0] _GEN_127 = in_shake_hand ? _GEN_103 : info_buf_reg_1_tcp_chksum; // @[TxBufferFifo.scala 42:29 80:31]
  wire [15:0] _GEN_128 = in_shake_hand ? _GEN_104 : info_buf_reg_0_ip_chksum; // @[TxBufferFifo.scala 42:29 80:31]
  wire [15:0] _GEN_129 = in_shake_hand ? _GEN_105 : info_buf_reg_1_ip_chksum; // @[TxBufferFifo.scala 42:29 80:31]
  wire [1:0] _GEN_130 = in_shake_hand ? _GEN_106 : info_buf_reg_0_pkt_type; // @[TxBufferFifo.scala 42:29 80:31]
  wire [1:0] _GEN_131 = in_shake_hand ? _GEN_107 : info_buf_reg_1_pkt_type; // @[TxBufferFifo.scala 42:29 80:31]
  wire  _GEN_132 = in_shake_hand ? _GEN_108 : info_buf_reg_0_chksum_offload; // @[TxBufferFifo.scala 42:29 80:31]
  wire  _GEN_133 = in_shake_hand ? _GEN_109 : info_buf_reg_1_chksum_offload; // @[TxBufferFifo.scala 42:29 80:31]
  wire  _GEN_134 = in_shake_hand ? _GEN_110 : info_buf_reg_0_valid; // @[TxBufferFifo.scala 42:29 80:31]
  wire  _GEN_135 = in_shake_hand ? _GEN_111 : info_buf_reg_1_valid; // @[TxBufferFifo.scala 42:29 80:31]
  wire  _GEN_136 = in_shake_hand ? _GEN_112 : info_buf_reg_0_used; // @[TxBufferFifo.scala 42:29 80:31]
  wire  _GEN_137 = in_shake_hand ? _GEN_113 : info_buf_reg_1_used; // @[TxBufferFifo.scala 42:29 80:31]
  wire  _GEN_140 = in_shake_hand & _GEN_116; // @[TxBufferFifo.scala 80:31 39:33]
  wire [13:0] _GEN_147 = io_reset_counter ? {{7'd0}, wr_pos_reg} : _GEN_122; // @[TxBufferFifo.scala 76:26 45:29]
  wire [5:0] _GEN_148 = io_reset_counter ? info_buf_reg_0_burst : _GEN_124; // @[TxBufferFifo.scala 76:26 42:29]
  wire [5:0] _GEN_149 = io_reset_counter ? info_buf_reg_1_burst : _GEN_125; // @[TxBufferFifo.scala 76:26 42:29]
  wire [15:0] _GEN_150 = io_reset_counter ? info_buf_reg_0_tcp_chksum : _GEN_126; // @[TxBufferFifo.scala 76:26 42:29]
  wire [15:0] _GEN_151 = io_reset_counter ? info_buf_reg_1_tcp_chksum : _GEN_127; // @[TxBufferFifo.scala 76:26 42:29]
  wire [15:0] _GEN_152 = io_reset_counter ? info_buf_reg_0_ip_chksum : _GEN_128; // @[TxBufferFifo.scala 76:26 42:29]
  wire [15:0] _GEN_153 = io_reset_counter ? info_buf_reg_1_ip_chksum : _GEN_129; // @[TxBufferFifo.scala 76:26 42:29]
  wire [1:0] _GEN_154 = io_reset_counter ? info_buf_reg_0_pkt_type : _GEN_130; // @[TxBufferFifo.scala 76:26 42:29]
  wire [1:0] _GEN_155 = io_reset_counter ? info_buf_reg_1_pkt_type : _GEN_131; // @[TxBufferFifo.scala 76:26 42:29]
  wire  _GEN_156 = io_reset_counter ? info_buf_reg_0_chksum_offload : _GEN_132; // @[TxBufferFifo.scala 76:26 42:29]
  wire  _GEN_157 = io_reset_counter ? info_buf_reg_1_chksum_offload : _GEN_133; // @[TxBufferFifo.scala 76:26 42:29]
  wire  _GEN_158 = io_reset_counter ? info_buf_reg_0_valid : _GEN_134; // @[TxBufferFifo.scala 76:26 42:29]
  wire  _GEN_159 = io_reset_counter ? info_buf_reg_1_valid : _GEN_135; // @[TxBufferFifo.scala 76:26 42:29]
  wire  _GEN_160 = io_reset_counter ? info_buf_reg_0_used : _GEN_136; // @[TxBufferFifo.scala 76:26 42:29]
  wire  _GEN_161 = io_reset_counter ? info_buf_reg_1_used : _GEN_137; // @[TxBufferFifo.scala 76:26 42:29]
  wire  out_shake_hand = io_out_tready & io_out_tvalid; // @[TxBufferFifo.scala 130:38]
  wire [5:0] _GEN_171 = rd_index_reg[0] ? info_buf_reg_1_burst : info_buf_reg_0_burst; // @[TxBufferFifo.scala 135:{70,70}]
  wire  _io_out_tlast_T_1 = _GEN_171 == 6'h1; // @[TxBufferFifo.scala 135:70]
  wire [6:0] _rd_pos_next_T_1 = rd_index_reg + 7'h1; // @[TxBufferFifo.scala 33:12]
  wire [6:0] _rd_pos_next_T_2 = _rd_pos_next_T_1 & 7'h1; // @[TxBufferFifo.scala 33:19]
  wire [11:0] _GEN_241 = {_rd_pos_next_T_2, 5'h0}; // @[TxBufferFifo.scala 165:44]
  wire [13:0] _rd_pos_next_T_3 = {{2'd0}, _GEN_241}; // @[TxBufferFifo.scala 165:44]
  wire [6:0] _rd_pos_next_T_5 = rd_pos_reg + 7'h1; // @[TxBufferFifo.scala 167:31]
  wire [13:0] _GEN_235 = _io_out_tlast_T_1 ? _rd_pos_next_T_3 : {{7'd0}, _rd_pos_next_T_5}; // @[TxBufferFifo.scala 164:51 165:17 167:17]
  wire [6:0] rd_pos_next = _GEN_235[6:0];
  wire [6:0] _rd_data_T = out_shake_hand ? rd_pos_next : rd_pos_reg; // @[TxBufferFifo.scala 138:33]
  wire [15:0] _GEN_173 = rd_index_reg[0] ? info_buf_reg_1_ip_chksum : info_buf_reg_0_ip_chksum; // @[Misc.scala 8:{10,10}]
  wire [15:0] rev_ip_chksum = {_GEN_173[7:0],_GEN_173[15:8]}; // @[Cat.scala 31:58]
  wire [15:0] _GEN_175 = rd_index_reg[0] ? info_buf_reg_1_tcp_chksum : info_buf_reg_0_tcp_chksum; // @[Misc.scala 8:{10,10}]
  wire [15:0] rev_tcp_chksum = {_GEN_175[7:0],_GEN_175[15:8]}; // @[Cat.scala 31:58]
  wire [11:0] _GEN_242 = {rd_index_reg, 5'h0}; // @[TxBufferFifo.scala 146:52]
  wire [13:0] _io_out_tdata_T = {{2'd0}, _GEN_242}; // @[TxBufferFifo.scala 146:52]
  wire [13:0] _GEN_243 = {{7'd0}, rd_pos_reg}; // @[TxBufferFifo.scala 146:34]
  wire  _GEN_177 = rd_index_reg[0] ? info_buf_reg_1_chksum_offload : info_buf_reg_0_chksum_offload; // @[TxBufferFifo.scala 146:{86,86}]
  wire [1:0] _GEN_179 = rd_index_reg[0] ? info_buf_reg_1_pkt_type : info_buf_reg_0_pkt_type; // @[TxBufferFifo.scala 148:{66,66}]
  wire [15:0] _io_out_tdata_T_8 = _GEN_179[1] ? rev_tcp_chksum : data_buf_reg_rd_data_data[415:400]; // @[TxBufferFifo.scala 148:30]
  wire [15:0] _io_out_tdata_T_13 = _GEN_179[0] ? rev_ip_chksum : data_buf_reg_rd_data_data[207:192]; // @[TxBufferFifo.scala 150:30]
  wire [511:0] _io_out_tdata_T_15 = {data_buf_reg_rd_data_data[511:416],_io_out_tdata_T_8,data_buf_reg_rd_data_data[399:
    208],_io_out_tdata_T_13,data_buf_reg_rd_data_data[191:0]}; // @[Cat.scala 31:58]
  wire [5:0] _info_buf_reg_burst_T_5 = _GEN_171 - 6'h1; // @[TxBufferFifo.scala 161:76]
  wire [13:0] _GEN_244 = reset ? 14'h0 : _GEN_147; // @[TxBufferFifo.scala 45:{29,29}]
  assign data_buf_reg_rd_data_en = data_buf_reg_rd_data_en_pipe_0;
  assign data_buf_reg_rd_data_addr = data_buf_reg_rd_data_addr_pipe_0;
  assign data_buf_reg_rd_data_data = data_buf_reg[data_buf_reg_rd_data_addr]; // @[TxBufferFifo.scala 39:33]
  assign data_buf_reg_MPORT_data = io_in_tdata;
  assign data_buf_reg_MPORT_addr = wr_pos_reg[5:0];
  assign data_buf_reg_MPORT_mask = 1'h1;
  assign data_buf_reg_MPORT_en = io_reset_counter ? 1'h0 : _GEN_140;
  assign io_in_tready = ~buf_full; // @[TxBufferFifo.scala 53:19]
  assign io_out_tdata = _GEN_243 == _io_out_tdata_T & _GEN_177 ? _io_out_tdata_T_15 : data_buf_reg_rd_data_data; // @[TxBufferFifo.scala 146:22]
  assign io_out_tvalid = rd_index_reg[0] ? info_buf_reg_1_valid : info_buf_reg_0_valid; // @[TxBufferFifo.scala 134:{17,17}]
  assign io_out_tlast = io_out_tvalid & _GEN_171 == 6'h1; // @[TxBufferFifo.scala 135:34]
  assign io_h2c_pack_counter = pack_counter; // @[TxBufferFifo.scala 57:23]
  assign io_h2c_err_counter = err_counter; // @[TxBufferFifo.scala 58:22]
  always @(posedge clock) begin
    if (data_buf_reg_MPORT_en & data_buf_reg_MPORT_mask) begin
      data_buf_reg[data_buf_reg_MPORT_addr] <= data_buf_reg_MPORT_data; // @[TxBufferFifo.scala 39:33]
    end
    data_buf_reg_rd_data_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      data_buf_reg_rd_data_addr_pipe_0 <= _rd_data_T[5:0];
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_0_used <= 1'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (~rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_0_used <= 1'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_0_used <= _GEN_160;
        end
      end else begin
        info_buf_reg_0_used <= _GEN_160;
      end
    end else begin
      info_buf_reg_0_used <= _GEN_160;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_0_valid <= 1'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (~rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_0_valid <= 1'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_0_valid <= _GEN_158;
        end
      end else begin
        info_buf_reg_0_valid <= _GEN_158;
      end
    end else begin
      info_buf_reg_0_valid <= _GEN_158;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_0_chksum_offload <= 1'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (~rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_0_chksum_offload <= 1'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_0_chksum_offload <= _GEN_156;
        end
      end else begin
        info_buf_reg_0_chksum_offload <= _GEN_156;
      end
    end else begin
      info_buf_reg_0_chksum_offload <= _GEN_156;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_0_pkt_type <= 2'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (~rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_0_pkt_type <= 2'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_0_pkt_type <= _GEN_154;
        end
      end else begin
        info_buf_reg_0_pkt_type <= _GEN_154;
      end
    end else begin
      info_buf_reg_0_pkt_type <= _GEN_154;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_0_ip_chksum <= 16'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (~rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_0_ip_chksum <= 16'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_0_ip_chksum <= _GEN_152;
        end
      end else begin
        info_buf_reg_0_ip_chksum <= _GEN_152;
      end
    end else begin
      info_buf_reg_0_ip_chksum <= _GEN_152;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_0_tcp_chksum <= 16'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (~rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_0_tcp_chksum <= 16'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_0_tcp_chksum <= _GEN_150;
        end
      end else begin
        info_buf_reg_0_tcp_chksum <= _GEN_150;
      end
    end else begin
      info_buf_reg_0_tcp_chksum <= _GEN_150;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_0_burst <= 6'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (~rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_0_burst <= 6'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_0_burst <= _GEN_148;
        end
      end else if (~rd_index_reg[0]) begin // @[TxBufferFifo.scala 161:40]
        info_buf_reg_0_burst <= _info_buf_reg_burst_T_5; // @[TxBufferFifo.scala 161:40]
      end else begin
        info_buf_reg_0_burst <= _GEN_148;
      end
    end else begin
      info_buf_reg_0_burst <= _GEN_148;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_1_used <= 1'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_1_used <= 1'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_1_used <= _GEN_161;
        end
      end else begin
        info_buf_reg_1_used <= _GEN_161;
      end
    end else begin
      info_buf_reg_1_used <= _GEN_161;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_1_valid <= 1'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_1_valid <= 1'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_1_valid <= _GEN_159;
        end
      end else begin
        info_buf_reg_1_valid <= _GEN_159;
      end
    end else begin
      info_buf_reg_1_valid <= _GEN_159;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_1_chksum_offload <= 1'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_1_chksum_offload <= 1'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_1_chksum_offload <= _GEN_157;
        end
      end else begin
        info_buf_reg_1_chksum_offload <= _GEN_157;
      end
    end else begin
      info_buf_reg_1_chksum_offload <= _GEN_157;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_1_pkt_type <= 2'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_1_pkt_type <= 2'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_1_pkt_type <= _GEN_155;
        end
      end else begin
        info_buf_reg_1_pkt_type <= _GEN_155;
      end
    end else begin
      info_buf_reg_1_pkt_type <= _GEN_155;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_1_ip_chksum <= 16'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_1_ip_chksum <= 16'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_1_ip_chksum <= _GEN_153;
        end
      end else begin
        info_buf_reg_1_ip_chksum <= _GEN_153;
      end
    end else begin
      info_buf_reg_1_ip_chksum <= _GEN_153;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_1_tcp_chksum <= 16'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_1_tcp_chksum <= 16'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_1_tcp_chksum <= _GEN_151;
        end
      end else begin
        info_buf_reg_1_tcp_chksum <= _GEN_151;
      end
    end else begin
      info_buf_reg_1_tcp_chksum <= _GEN_151;
    end
    if (reset) begin // @[TxBufferFifo.scala 42:29]
      info_buf_reg_1_burst <= 6'h0; // @[TxBufferFifo.scala 42:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        if (rd_index_reg[0]) begin // @[TxBufferFifo.scala 158:34]
          info_buf_reg_1_burst <= 6'h0; // @[TxBufferFifo.scala 158:34]
        end else begin
          info_buf_reg_1_burst <= _GEN_149;
        end
      end else if (rd_index_reg[0]) begin // @[TxBufferFifo.scala 161:40]
        info_buf_reg_1_burst <= _info_buf_reg_burst_T_5; // @[TxBufferFifo.scala 161:40]
      end else begin
        info_buf_reg_1_burst <= _GEN_149;
      end
    end else begin
      info_buf_reg_1_burst <= _GEN_149;
    end
    if (reset) begin // @[TxBufferFifo.scala 43:29]
      wr_index_reg <= 7'h0; // @[TxBufferFifo.scala 43:29]
    end else if (!(io_reset_counter)) begin // @[TxBufferFifo.scala 76:26]
      if (in_shake_hand) begin // @[TxBufferFifo.scala 80:31]
        if (!(_GEN_2 == 6'h20)) begin // @[TxBufferFifo.scala 84:63]
          wr_index_reg <= _GEN_94;
        end
      end
    end
    if (reset) begin // @[TxBufferFifo.scala 44:29]
      rd_index_reg <= 7'h0; // @[TxBufferFifo.scala 44:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 153:24]
      if (_io_out_tlast_T_1) begin // @[TxBufferFifo.scala 157:53]
        rd_index_reg <= _rd_pos_next_T_2; // @[TxBufferFifo.scala 159:20]
      end
    end
    wr_pos_reg <= _GEN_244[6:0]; // @[TxBufferFifo.scala 45:{29,29}]
    if (reset) begin // @[TxBufferFifo.scala 46:29]
      rd_pos_reg <= 7'h0; // @[TxBufferFifo.scala 46:29]
    end else if (out_shake_hand) begin // @[TxBufferFifo.scala 138:33]
      rd_pos_reg <= rd_pos_next;
    end
    if (reset) begin // @[TxBufferFifo.scala 54:29]
      pack_counter <= 32'h0; // @[TxBufferFifo.scala 54:29]
    end else if (io_reset_counter) begin // @[TxBufferFifo.scala 76:26]
      pack_counter <= 32'h0; // @[TxBufferFifo.scala 77:18]
    end else if (in_shake_hand) begin // @[TxBufferFifo.scala 80:31]
      if (io_in_tlast) begin // @[TxBufferFifo.scala 81:26]
        pack_counter <= _pack_counter_T_1; // @[TxBufferFifo.scala 82:22]
      end
    end
    if (reset) begin // @[TxBufferFifo.scala 55:28]
      err_counter <= 32'h0; // @[TxBufferFifo.scala 55:28]
    end else if (io_reset_counter) begin // @[TxBufferFifo.scala 76:26]
      err_counter <= 32'h0; // @[TxBufferFifo.scala 78:17]
    end else if (in_shake_hand) begin // @[TxBufferFifo.scala 80:31]
      if (_GEN_2 == 6'h20) begin // @[TxBufferFifo.scala 84:63]
        err_counter <= _err_counter_T_1; // @[TxBufferFifo.scala 97:21]
      end
    end
    if (reset) begin // @[TxBufferFifo.scala 62:30]
      is_overflowed <= 1'h0; // @[TxBufferFifo.scala 62:30]
    end else if (!(io_reset_counter)) begin // @[TxBufferFifo.scala 76:26]
      if (in_shake_hand) begin // @[TxBufferFifo.scala 80:31]
        if (_GEN_2 == 6'h20) begin // @[TxBufferFifo.scala 84:63]
          is_overflowed <= _GEN_3;
        end else begin
          is_overflowed <= _GEN_96;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {16{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    data_buf_reg[initvar] = _RAND_0[511:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  data_buf_reg_rd_data_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  data_buf_reg_rd_data_addr_pipe_0 = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  info_buf_reg_0_used = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  info_buf_reg_0_valid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  info_buf_reg_0_chksum_offload = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  info_buf_reg_0_pkt_type = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  info_buf_reg_0_ip_chksum = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  info_buf_reg_0_tcp_chksum = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  info_buf_reg_0_burst = _RAND_9[5:0];
  _RAND_10 = {1{`RANDOM}};
  info_buf_reg_1_used = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  info_buf_reg_1_valid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  info_buf_reg_1_chksum_offload = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  info_buf_reg_1_pkt_type = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  info_buf_reg_1_ip_chksum = _RAND_14[15:0];
  _RAND_15 = {1{`RANDOM}};
  info_buf_reg_1_tcp_chksum = _RAND_15[15:0];
  _RAND_16 = {1{`RANDOM}};
  info_buf_reg_1_burst = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  wr_index_reg = _RAND_17[6:0];
  _RAND_18 = {1{`RANDOM}};
  rd_index_reg = _RAND_18[6:0];
  _RAND_19 = {1{`RANDOM}};
  wr_pos_reg = _RAND_19[6:0];
  _RAND_20 = {1{`RANDOM}};
  rd_pos_reg = _RAND_20[6:0];
  _RAND_21 = {1{`RANDOM}};
  pack_counter = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  err_counter = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  is_overflowed = _RAND_23[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TxHandler(
  input          clock,
  input          reset,
  input  [511:0] io_QDMA_h2c_stub_out_tdata,
  input          io_QDMA_h2c_stub_out_tvalid,
  output         io_QDMA_h2c_stub_out_tready,
  input          io_QDMA_h2c_stub_out_tlast,
  input          io_QDMA_h2c_stub_out_tuser,
  output [511:0] io_CMAC_in_tdata,
  output         io_CMAC_in_tvalid,
  input          io_CMAC_in_tready,
  output         io_CMAC_in_tlast,
  input          io_reset_counter,
  output [31:0]  io_h2c_pack_counter,
  output [31:0]  io_h2c_err_counter,
  input  [7:0]   io_extern_config_c2h_match_op,
  input  [31:0]  io_extern_config_c2h_match_arg_0,
  input  [31:0]  io_extern_config_c2h_match_arg_1,
  input  [31:0]  io_extern_config_c2h_match_arg_2,
  input  [31:0]  io_extern_config_c2h_match_arg_3,
  input  [31:0]  io_extern_config_c2h_match_arg_4,
  input  [31:0]  io_extern_config_c2h_match_arg_5,
  input  [31:0]  io_extern_config_c2h_match_arg_6,
  input  [31:0]  io_extern_config_c2h_match_arg_7,
  input  [31:0]  io_extern_config_c2h_match_arg_8,
  input  [31:0]  io_extern_config_c2h_match_arg_9,
  input  [31:0]  io_extern_config_c2h_match_arg_10,
  input  [31:0]  io_extern_config_c2h_match_arg_11,
  input  [31:0]  io_extern_config_c2h_match_arg_12,
  input  [31:0]  io_extern_config_c2h_match_arg_13,
  input  [31:0]  io_extern_config_c2h_match_arg_14,
  input  [31:0]  io_extern_config_c2h_match_arg_15
);
  wire  tx_converter_clock; // @[TxHandler.scala 20:28]
  wire  tx_converter_reset; // @[TxHandler.scala 20:28]
  wire [511:0] tx_converter_io_in_tdata; // @[TxHandler.scala 20:28]
  wire  tx_converter_io_in_tvalid; // @[TxHandler.scala 20:28]
  wire  tx_converter_io_in_tready; // @[TxHandler.scala 20:28]
  wire  tx_converter_io_in_tlast; // @[TxHandler.scala 20:28]
  wire  tx_converter_io_in_tuser; // @[TxHandler.scala 20:28]
  wire [511:0] tx_converter_io_out_tdata; // @[TxHandler.scala 20:28]
  wire  tx_converter_io_out_tvalid; // @[TxHandler.scala 20:28]
  wire  tx_converter_io_out_tready; // @[TxHandler.scala 20:28]
  wire  tx_converter_io_out_tlast; // @[TxHandler.scala 20:28]
  wire [7:0] tx_converter_io_out_extern_config_c2h_match_op; // @[TxHandler.scala 20:28]
  wire [7:0] tx_converter_io_extern_config_c2h_match_op; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_0; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_1; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_2; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_3; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_4; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_5; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_6; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_7; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_8; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_9; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_10; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_11; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_12; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_13; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_14; // @[TxHandler.scala 20:28]
  wire [31:0] tx_converter_io_extern_config_c2h_match_arg_15; // @[TxHandler.scala 20:28]
  wire  tx_pipeline_clock; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_reset; // @[TxHandler.scala 24:27]
  wire [511:0] tx_pipeline_io_in_tdata; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_io_in_tvalid; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_io_in_tready; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_io_in_tlast; // @[TxHandler.scala 24:27]
  wire [7:0] tx_pipeline_io_in_extern_config_c2h_match_op; // @[TxHandler.scala 24:27]
  wire [511:0] tx_pipeline_io_out_tdata; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_io_out_tvalid; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_io_out_tready; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_io_out_tlast; // @[TxHandler.scala 24:27]
  wire [31:0] tx_pipeline_io_out_tx_info_ip_chksum; // @[TxHandler.scala 24:27]
  wire [31:0] tx_pipeline_io_out_tx_info_tcp_chksum; // @[TxHandler.scala 24:27]
  wire [7:0] tx_pipeline_io_out_extern_config_c2h_match_op; // @[TxHandler.scala 24:27]
  wire  tx_buffer_fifo_clock; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_reset; // @[TxHandler.scala 27:30]
  wire [511:0] tx_buffer_fifo_io_in_tdata; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_in_tvalid; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_in_tready; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_in_tlast; // @[TxHandler.scala 27:30]
  wire [31:0] tx_buffer_fifo_io_in_tx_info_ip_chksum; // @[TxHandler.scala 27:30]
  wire [31:0] tx_buffer_fifo_io_in_tx_info_tcp_chksum; // @[TxHandler.scala 27:30]
  wire [7:0] tx_buffer_fifo_io_in_extern_config_c2h_match_op; // @[TxHandler.scala 27:30]
  wire [511:0] tx_buffer_fifo_io_out_tdata; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_out_tvalid; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_out_tready; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_out_tlast; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_reset_counter; // @[TxHandler.scala 27:30]
  wire [31:0] tx_buffer_fifo_io_h2c_pack_counter; // @[TxHandler.scala 27:30]
  wire [31:0] tx_buffer_fifo_io_h2c_err_counter; // @[TxHandler.scala 27:30]
  TxConverter tx_converter ( // @[TxHandler.scala 20:28]
    .clock(tx_converter_clock),
    .reset(tx_converter_reset),
    .io_in_tdata(tx_converter_io_in_tdata),
    .io_in_tvalid(tx_converter_io_in_tvalid),
    .io_in_tready(tx_converter_io_in_tready),
    .io_in_tlast(tx_converter_io_in_tlast),
    .io_in_tuser(tx_converter_io_in_tuser),
    .io_out_tdata(tx_converter_io_out_tdata),
    .io_out_tvalid(tx_converter_io_out_tvalid),
    .io_out_tready(tx_converter_io_out_tready),
    .io_out_tlast(tx_converter_io_out_tlast),
    .io_out_extern_config_c2h_match_op(tx_converter_io_out_extern_config_c2h_match_op),
    .io_extern_config_c2h_match_op(tx_converter_io_extern_config_c2h_match_op),
    .io_extern_config_c2h_match_arg_0(tx_converter_io_extern_config_c2h_match_arg_0),
    .io_extern_config_c2h_match_arg_1(tx_converter_io_extern_config_c2h_match_arg_1),
    .io_extern_config_c2h_match_arg_2(tx_converter_io_extern_config_c2h_match_arg_2),
    .io_extern_config_c2h_match_arg_3(tx_converter_io_extern_config_c2h_match_arg_3),
    .io_extern_config_c2h_match_arg_4(tx_converter_io_extern_config_c2h_match_arg_4),
    .io_extern_config_c2h_match_arg_5(tx_converter_io_extern_config_c2h_match_arg_5),
    .io_extern_config_c2h_match_arg_6(tx_converter_io_extern_config_c2h_match_arg_6),
    .io_extern_config_c2h_match_arg_7(tx_converter_io_extern_config_c2h_match_arg_7),
    .io_extern_config_c2h_match_arg_8(tx_converter_io_extern_config_c2h_match_arg_8),
    .io_extern_config_c2h_match_arg_9(tx_converter_io_extern_config_c2h_match_arg_9),
    .io_extern_config_c2h_match_arg_10(tx_converter_io_extern_config_c2h_match_arg_10),
    .io_extern_config_c2h_match_arg_11(tx_converter_io_extern_config_c2h_match_arg_11),
    .io_extern_config_c2h_match_arg_12(tx_converter_io_extern_config_c2h_match_arg_12),
    .io_extern_config_c2h_match_arg_13(tx_converter_io_extern_config_c2h_match_arg_13),
    .io_extern_config_c2h_match_arg_14(tx_converter_io_extern_config_c2h_match_arg_14),
    .io_extern_config_c2h_match_arg_15(tx_converter_io_extern_config_c2h_match_arg_15)
  );
  TxPipeline tx_pipeline ( // @[TxHandler.scala 24:27]
    .clock(tx_pipeline_clock),
    .reset(tx_pipeline_reset),
    .io_in_tdata(tx_pipeline_io_in_tdata),
    .io_in_tvalid(tx_pipeline_io_in_tvalid),
    .io_in_tready(tx_pipeline_io_in_tready),
    .io_in_tlast(tx_pipeline_io_in_tlast),
    .io_in_extern_config_c2h_match_op(tx_pipeline_io_in_extern_config_c2h_match_op),
    .io_out_tdata(tx_pipeline_io_out_tdata),
    .io_out_tvalid(tx_pipeline_io_out_tvalid),
    .io_out_tready(tx_pipeline_io_out_tready),
    .io_out_tlast(tx_pipeline_io_out_tlast),
    .io_out_tx_info_ip_chksum(tx_pipeline_io_out_tx_info_ip_chksum),
    .io_out_tx_info_tcp_chksum(tx_pipeline_io_out_tx_info_tcp_chksum),
    .io_out_extern_config_c2h_match_op(tx_pipeline_io_out_extern_config_c2h_match_op)
  );
  TxBufferFifo tx_buffer_fifo ( // @[TxHandler.scala 27:30]
    .clock(tx_buffer_fifo_clock),
    .reset(tx_buffer_fifo_reset),
    .io_in_tdata(tx_buffer_fifo_io_in_tdata),
    .io_in_tvalid(tx_buffer_fifo_io_in_tvalid),
    .io_in_tready(tx_buffer_fifo_io_in_tready),
    .io_in_tlast(tx_buffer_fifo_io_in_tlast),
    .io_in_tx_info_ip_chksum(tx_buffer_fifo_io_in_tx_info_ip_chksum),
    .io_in_tx_info_tcp_chksum(tx_buffer_fifo_io_in_tx_info_tcp_chksum),
    .io_in_extern_config_c2h_match_op(tx_buffer_fifo_io_in_extern_config_c2h_match_op),
    .io_out_tdata(tx_buffer_fifo_io_out_tdata),
    .io_out_tvalid(tx_buffer_fifo_io_out_tvalid),
    .io_out_tready(tx_buffer_fifo_io_out_tready),
    .io_out_tlast(tx_buffer_fifo_io_out_tlast),
    .io_reset_counter(tx_buffer_fifo_io_reset_counter),
    .io_h2c_pack_counter(tx_buffer_fifo_io_h2c_pack_counter),
    .io_h2c_err_counter(tx_buffer_fifo_io_h2c_err_counter)
  );
  assign io_QDMA_h2c_stub_out_tready = tx_converter_io_in_tready; // @[TxHandler.scala 21:32]
  assign io_CMAC_in_tdata = tx_buffer_fifo_io_out_tdata; // @[TxHandler.scala 29:35]
  assign io_CMAC_in_tvalid = tx_buffer_fifo_io_out_tvalid; // @[TxHandler.scala 29:35]
  assign io_CMAC_in_tlast = tx_buffer_fifo_io_out_tlast; // @[TxHandler.scala 29:35]
  assign io_h2c_pack_counter = tx_buffer_fifo_io_h2c_pack_counter; // @[TxHandler.scala 31:35]
  assign io_h2c_err_counter = tx_buffer_fifo_io_h2c_err_counter; // @[TxHandler.scala 32:35]
  assign tx_converter_clock = clock;
  assign tx_converter_reset = reset;
  assign tx_converter_io_in_tdata = io_QDMA_h2c_stub_out_tdata; // @[TxHandler.scala 21:32]
  assign tx_converter_io_in_tvalid = io_QDMA_h2c_stub_out_tvalid; // @[TxHandler.scala 21:32]
  assign tx_converter_io_in_tlast = io_QDMA_h2c_stub_out_tlast; // @[TxHandler.scala 21:32]
  assign tx_converter_io_in_tuser = io_QDMA_h2c_stub_out_tuser; // @[TxHandler.scala 21:32]
  assign tx_converter_io_out_tready = tx_pipeline_io_in_tready; // @[TxHandler.scala 25:23]
  assign tx_converter_io_extern_config_c2h_match_op = io_extern_config_c2h_match_op; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_0 = io_extern_config_c2h_match_arg_0; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_1 = io_extern_config_c2h_match_arg_1; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_2 = io_extern_config_c2h_match_arg_2; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_3 = io_extern_config_c2h_match_arg_3; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_4 = io_extern_config_c2h_match_arg_4; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_5 = io_extern_config_c2h_match_arg_5; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_6 = io_extern_config_c2h_match_arg_6; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_7 = io_extern_config_c2h_match_arg_7; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_8 = io_extern_config_c2h_match_arg_8; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_9 = io_extern_config_c2h_match_arg_9; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_10 = io_extern_config_c2h_match_arg_10; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_11 = io_extern_config_c2h_match_arg_11; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_12 = io_extern_config_c2h_match_arg_12; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_13 = io_extern_config_c2h_match_arg_13; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_14 = io_extern_config_c2h_match_arg_14; // @[TxHandler.scala 22:33]
  assign tx_converter_io_extern_config_c2h_match_arg_15 = io_extern_config_c2h_match_arg_15; // @[TxHandler.scala 22:33]
  assign tx_pipeline_clock = clock;
  assign tx_pipeline_reset = reset;
  assign tx_pipeline_io_in_tdata = tx_converter_io_out_tdata; // @[TxHandler.scala 25:23]
  assign tx_pipeline_io_in_tvalid = tx_converter_io_out_tvalid; // @[TxHandler.scala 25:23]
  assign tx_pipeline_io_in_tlast = tx_converter_io_out_tlast; // @[TxHandler.scala 25:23]
  assign tx_pipeline_io_in_extern_config_c2h_match_op = tx_converter_io_out_extern_config_c2h_match_op; // @[TxHandler.scala 25:23]
  assign tx_pipeline_io_out_tready = tx_buffer_fifo_io_in_tready; // @[TxHandler.scala 28:35]
  assign tx_buffer_fifo_clock = clock;
  assign tx_buffer_fifo_reset = reset;
  assign tx_buffer_fifo_io_in_tdata = tx_pipeline_io_out_tdata; // @[TxHandler.scala 28:35]
  assign tx_buffer_fifo_io_in_tvalid = tx_pipeline_io_out_tvalid; // @[TxHandler.scala 28:35]
  assign tx_buffer_fifo_io_in_tlast = tx_pipeline_io_out_tlast; // @[TxHandler.scala 28:35]
  assign tx_buffer_fifo_io_in_tx_info_ip_chksum = tx_pipeline_io_out_tx_info_ip_chksum; // @[TxHandler.scala 28:35]
  assign tx_buffer_fifo_io_in_tx_info_tcp_chksum = tx_pipeline_io_out_tx_info_tcp_chksum; // @[TxHandler.scala 28:35]
  assign tx_buffer_fifo_io_in_extern_config_c2h_match_op = tx_pipeline_io_out_extern_config_c2h_match_op; // @[TxHandler.scala 28:35]
  assign tx_buffer_fifo_io_out_tready = io_CMAC_in_tready; // @[TxHandler.scala 29:35]
  assign tx_buffer_fifo_io_reset_counter = io_reset_counter; // @[TxHandler.scala 30:35]
endmodule
module ReduceAddSync_3(
  input        clock,
  input  [7:0] io_in_vec_0,
  input  [7:0] io_in_vec_1,
  input  [7:0] io_in_vec_2,
  input  [7:0] io_in_vec_3,
  input  [7:0] io_in_vec_4,
  input  [7:0] io_in_vec_5,
  input  [7:0] io_in_vec_6,
  input  [7:0] io_in_vec_7,
  input  [7:0] io_in_vec_8,
  input  [7:0] io_in_vec_9,
  input  [7:0] io_in_vec_10,
  input  [7:0] io_in_vec_11,
  input  [7:0] io_in_vec_12,
  input  [7:0] io_in_vec_13,
  input  [7:0] io_in_vec_14,
  input  [7:0] io_in_vec_15,
  input  [7:0] io_in_vec_16,
  input  [7:0] io_in_vec_17,
  input  [7:0] io_in_vec_18,
  input  [7:0] io_in_vec_19,
  input  [7:0] io_in_vec_20,
  input  [7:0] io_in_vec_21,
  input  [7:0] io_in_vec_22,
  input  [7:0] io_in_vec_23,
  input  [7:0] io_in_vec_24,
  input  [7:0] io_in_vec_25,
  input  [7:0] io_in_vec_26,
  input  [7:0] io_in_vec_27,
  input  [7:0] io_in_vec_28,
  input  [7:0] io_in_vec_29,
  input  [7:0] io_in_vec_30,
  input  [7:0] io_in_vec_31,
  input  [7:0] io_in_vec_32,
  input  [7:0] io_in_vec_33,
  input  [7:0] io_in_vec_34,
  input  [7:0] io_in_vec_35,
  input  [7:0] io_in_vec_36,
  input  [7:0] io_in_vec_37,
  input  [7:0] io_in_vec_38,
  input  [7:0] io_in_vec_39,
  input  [7:0] io_in_vec_40,
  input  [7:0] io_in_vec_41,
  input  [7:0] io_in_vec_42,
  input  [7:0] io_in_vec_43,
  input  [7:0] io_in_vec_44,
  input  [7:0] io_in_vec_45,
  input  [7:0] io_in_vec_46,
  input  [7:0] io_in_vec_47,
  input  [7:0] io_in_vec_48,
  input  [7:0] io_in_vec_49,
  input  [7:0] io_in_vec_50,
  input  [7:0] io_in_vec_51,
  input  [7:0] io_in_vec_52,
  input  [7:0] io_in_vec_53,
  input  [7:0] io_in_vec_54,
  input  [7:0] io_in_vec_55,
  input  [7:0] io_in_vec_56,
  input  [7:0] io_in_vec_57,
  input  [7:0] io_in_vec_58,
  input  [7:0] io_in_vec_59,
  input  [7:0] io_in_vec_60,
  input  [7:0] io_in_vec_61,
  input  [7:0] io_in_vec_62,
  input  [7:0] io_in_vec_63,
  output [7:0] io_out_sum
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] cal_reg_0; // @[Misc.scala 174:20]
  reg [7:0] cal_reg_1; // @[Misc.scala 174:20]
  reg [7:0] cal_reg_2; // @[Misc.scala 174:20]
  reg [7:0] cal_reg_3; // @[Misc.scala 174:20]
  reg [7:0] cal_reg_4; // @[Misc.scala 174:20]
  reg [7:0] cal_reg_5; // @[Misc.scala 174:20]
  reg [7:0] cal_reg_6; // @[Misc.scala 174:20]
  reg [7:0] cal_reg_7; // @[Misc.scala 174:20]
  wire [7:0] _cal_reg_0_T_1 = io_in_vec_0 + io_in_vec_1; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_0_T_3 = io_in_vec_2 + io_in_vec_3; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_0_T_5 = io_in_vec_4 + io_in_vec_5; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_0_T_7 = io_in_vec_6 + io_in_vec_7; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_0_T_9 = _cal_reg_0_T_1 + _cal_reg_0_T_3; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_0_T_11 = _cal_reg_0_T_5 + _cal_reg_0_T_7; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_1_T_1 = io_in_vec_8 + io_in_vec_9; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_1_T_3 = io_in_vec_10 + io_in_vec_11; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_1_T_5 = io_in_vec_12 + io_in_vec_13; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_1_T_7 = io_in_vec_14 + io_in_vec_15; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_1_T_9 = _cal_reg_1_T_1 + _cal_reg_1_T_3; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_1_T_11 = _cal_reg_1_T_5 + _cal_reg_1_T_7; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_2_T_1 = io_in_vec_16 + io_in_vec_17; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_2_T_3 = io_in_vec_18 + io_in_vec_19; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_2_T_5 = io_in_vec_20 + io_in_vec_21; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_2_T_7 = io_in_vec_22 + io_in_vec_23; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_2_T_9 = _cal_reg_2_T_1 + _cal_reg_2_T_3; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_2_T_11 = _cal_reg_2_T_5 + _cal_reg_2_T_7; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_3_T_1 = io_in_vec_24 + io_in_vec_25; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_3_T_3 = io_in_vec_26 + io_in_vec_27; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_3_T_5 = io_in_vec_28 + io_in_vec_29; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_3_T_7 = io_in_vec_30 + io_in_vec_31; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_3_T_9 = _cal_reg_3_T_1 + _cal_reg_3_T_3; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_3_T_11 = _cal_reg_3_T_5 + _cal_reg_3_T_7; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_4_T_1 = io_in_vec_32 + io_in_vec_33; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_4_T_3 = io_in_vec_34 + io_in_vec_35; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_4_T_5 = io_in_vec_36 + io_in_vec_37; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_4_T_7 = io_in_vec_38 + io_in_vec_39; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_4_T_9 = _cal_reg_4_T_1 + _cal_reg_4_T_3; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_4_T_11 = _cal_reg_4_T_5 + _cal_reg_4_T_7; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_5_T_1 = io_in_vec_40 + io_in_vec_41; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_5_T_3 = io_in_vec_42 + io_in_vec_43; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_5_T_5 = io_in_vec_44 + io_in_vec_45; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_5_T_7 = io_in_vec_46 + io_in_vec_47; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_5_T_9 = _cal_reg_5_T_1 + _cal_reg_5_T_3; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_5_T_11 = _cal_reg_5_T_5 + _cal_reg_5_T_7; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_6_T_1 = io_in_vec_48 + io_in_vec_49; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_6_T_3 = io_in_vec_50 + io_in_vec_51; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_6_T_5 = io_in_vec_52 + io_in_vec_53; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_6_T_7 = io_in_vec_54 + io_in_vec_55; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_6_T_9 = _cal_reg_6_T_1 + _cal_reg_6_T_3; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_6_T_11 = _cal_reg_6_T_5 + _cal_reg_6_T_7; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_7_T_1 = io_in_vec_56 + io_in_vec_57; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_7_T_3 = io_in_vec_58 + io_in_vec_59; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_7_T_5 = io_in_vec_60 + io_in_vec_61; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_7_T_7 = io_in_vec_62 + io_in_vec_63; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_7_T_9 = _cal_reg_7_T_1 + _cal_reg_7_T_3; // @[Misc.scala 189:42]
  wire [7:0] _cal_reg_7_T_11 = _cal_reg_7_T_5 + _cal_reg_7_T_7; // @[Misc.scala 189:42]
  wire [7:0] _io_out_sum_T_1 = cal_reg_0 + cal_reg_1; // @[Misc.scala 191:37]
  wire [7:0] _io_out_sum_T_3 = cal_reg_2 + cal_reg_3; // @[Misc.scala 191:37]
  wire [7:0] _io_out_sum_T_5 = cal_reg_4 + cal_reg_5; // @[Misc.scala 191:37]
  wire [7:0] _io_out_sum_T_7 = cal_reg_6 + cal_reg_7; // @[Misc.scala 191:37]
  wire [7:0] _io_out_sum_T_9 = _io_out_sum_T_1 + _io_out_sum_T_3; // @[Misc.scala 191:37]
  wire [7:0] _io_out_sum_T_11 = _io_out_sum_T_5 + _io_out_sum_T_7; // @[Misc.scala 191:37]
  assign io_out_sum = _io_out_sum_T_9 + _io_out_sum_T_11; // @[Misc.scala 191:37]
  always @(posedge clock) begin
    cal_reg_0 <= _cal_reg_0_T_9 + _cal_reg_0_T_11; // @[Misc.scala 189:42]
    cal_reg_1 <= _cal_reg_1_T_9 + _cal_reg_1_T_11; // @[Misc.scala 189:42]
    cal_reg_2 <= _cal_reg_2_T_9 + _cal_reg_2_T_11; // @[Misc.scala 189:42]
    cal_reg_3 <= _cal_reg_3_T_9 + _cal_reg_3_T_11; // @[Misc.scala 189:42]
    cal_reg_4 <= _cal_reg_4_T_9 + _cal_reg_4_T_11; // @[Misc.scala 189:42]
    cal_reg_5 <= _cal_reg_5_T_9 + _cal_reg_5_T_11; // @[Misc.scala 189:42]
    cal_reg_6 <= _cal_reg_6_T_9 + _cal_reg_6_T_11; // @[Misc.scala 189:42]
    cal_reg_7 <= _cal_reg_7_T_9 + _cal_reg_7_T_11; // @[Misc.scala 189:42]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cal_reg_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  cal_reg_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  cal_reg_2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  cal_reg_3 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  cal_reg_4 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  cal_reg_5 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  cal_reg_6 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  cal_reg_7 = _RAND_7[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RxConverter(
  input          clock,
  input          reset,
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input          io_in_tuser,
  input  [63:0]  io_in_tkeep,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  output         io_out_tuser,
  output [15:0]  io_out_rx_info_tlen,
  output [7:0]   io_out_extern_config_c2h_match_op,
  output [31:0]  io_out_extern_config_c2h_match_arg_0,
  output [31:0]  io_out_extern_config_c2h_match_arg_1,
  output [31:0]  io_out_extern_config_c2h_match_arg_2,
  output [31:0]  io_out_extern_config_c2h_match_arg_3,
  output [31:0]  io_out_extern_config_c2h_match_arg_4,
  output [31:0]  io_out_extern_config_c2h_match_arg_5,
  output [31:0]  io_out_extern_config_c2h_match_arg_6,
  output [31:0]  io_out_extern_config_c2h_match_arg_7,
  output [31:0]  io_out_extern_config_c2h_match_arg_8,
  output [31:0]  io_out_extern_config_c2h_match_arg_9,
  output [31:0]  io_out_extern_config_c2h_match_arg_10,
  output [31:0]  io_out_extern_config_c2h_match_arg_11,
  output [31:0]  io_out_extern_config_c2h_match_arg_12,
  output [31:0]  io_out_extern_config_c2h_match_arg_13,
  output [31:0]  io_out_extern_config_c2h_match_arg_14,
  output [31:0]  io_out_extern_config_c2h_match_arg_15,
  input  [7:0]   io_extern_config_c2h_match_op,
  input  [31:0]  io_extern_config_c2h_match_arg_0,
  input  [31:0]  io_extern_config_c2h_match_arg_1,
  input  [31:0]  io_extern_config_c2h_match_arg_2,
  input  [31:0]  io_extern_config_c2h_match_arg_3,
  input  [31:0]  io_extern_config_c2h_match_arg_4,
  input  [31:0]  io_extern_config_c2h_match_arg_5,
  input  [31:0]  io_extern_config_c2h_match_arg_6,
  input  [31:0]  io_extern_config_c2h_match_arg_7,
  input  [31:0]  io_extern_config_c2h_match_arg_8,
  input  [31:0]  io_extern_config_c2h_match_arg_9,
  input  [31:0]  io_extern_config_c2h_match_arg_10,
  input  [31:0]  io_extern_config_c2h_match_arg_11,
  input  [31:0]  io_extern_config_c2h_match_arg_12,
  input  [31:0]  io_extern_config_c2h_match_arg_13,
  input  [31:0]  io_extern_config_c2h_match_arg_14,
  input  [31:0]  io_extern_config_c2h_match_arg_15
);
`ifdef RANDOMIZE_REG_INIT
  reg [607:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [543:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  burst_size_cal_clock; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_0; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_1; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_2; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_3; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_4; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_5; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_6; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_7; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_8; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_9; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_10; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_11; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_12; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_13; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_14; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_15; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_16; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_17; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_18; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_19; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_20; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_21; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_22; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_23; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_24; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_25; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_26; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_27; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_28; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_29; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_30; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_31; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_32; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_33; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_34; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_35; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_36; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_37; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_38; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_39; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_40; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_41; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_42; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_43; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_44; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_45; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_46; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_47; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_48; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_49; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_50; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_51; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_52; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_53; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_54; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_55; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_56; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_57; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_58; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_59; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_60; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_61; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_62; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_in_vec_63; // @[RxConverter.scala 28:30]
  wire [7:0] burst_size_cal_io_out_sum; // @[RxConverter.scala 28:30]
  wire  in_shake_hand = io_in_tvalid & io_in_tready; // @[RxConverter.scala 15:36]
  wire  out_shake_hand = io_out_tready & io_out_tvalid; // @[RxConverter.scala 16:38]
  wire [578:0] _in_reg_T = {io_in_tuser,io_in_tkeep,io_in_tdata,io_in_tvalid,io_in_tlast}; // @[Cat.scala 31:58]
  reg [578:0] in_reg_r; // @[Reg.scala 28:20]
  wire  in_reg_tlast = in_reg_r[0]; // @[RxConverter.scala 17:119]
  wire  in_reg_tvalid = in_reg_r[1]; // @[RxConverter.scala 17:119]
  wire [511:0] in_reg_tdata = in_reg_r[513:2]; // @[RxConverter.scala 17:119]
  wire [63:0] in_reg_tkeep = in_reg_r[577:514]; // @[RxConverter.scala 17:119]
  reg  first_beat_reg; // @[Reg.scala 28:20]
  wire  _GEN_1 = in_shake_hand ? in_reg_tlast : first_beat_reg; // @[Reg.scala 29:18 28:20 29:22]
  reg  in_reg_used_reg; // @[RxConverter.scala 19:32]
  wire  _GEN_2 = out_shake_hand ? 1'h0 : in_reg_used_reg; // @[RxConverter.scala 22:29 23:21 19:32]
  wire  _GEN_3 = in_shake_hand | _GEN_2; // @[RxConverter.scala 20:23 21:21]
  wire [255:0] extern_config_reg_lo = {io_extern_config_c2h_match_arg_7,io_extern_config_c2h_match_arg_6,
    io_extern_config_c2h_match_arg_5,io_extern_config_c2h_match_arg_4,io_extern_config_c2h_match_arg_3,
    io_extern_config_c2h_match_arg_2,io_extern_config_c2h_match_arg_1,io_extern_config_c2h_match_arg_0}; // @[RxConverter.scala 25:54]
  wire [519:0] _extern_config_reg_T = {io_extern_config_c2h_match_op,io_extern_config_c2h_match_arg_15,
    io_extern_config_c2h_match_arg_14,io_extern_config_c2h_match_arg_13,io_extern_config_c2h_match_arg_12,
    io_extern_config_c2h_match_arg_11,io_extern_config_c2h_match_arg_10,io_extern_config_c2h_match_arg_9,
    io_extern_config_c2h_match_arg_8,extern_config_reg_lo}; // @[RxConverter.scala 25:54]
  reg [519:0] extern_config_reg_r; // @[Reg.scala 28:20]
  wire [63:0] cal_tkeep = in_shake_hand ? io_in_tkeep : in_reg_tkeep; // @[RxConverter.scala 27:22]
  reg [15:0] tlen_reg; // @[RxConverter.scala 33:25]
  wire [15:0] _GEN_7 = {{8'd0}, burst_size_cal_io_out_sum}; // @[RxConverter.scala 38:28]
  wire [15:0] _tlen_reg_T_1 = tlen_reg + _GEN_7; // @[RxConverter.scala 38:28]
  wire  keep_val_0 = in_reg_tkeep[0]; // @[RxConverter.scala 44:32]
  wire  keep_val_8 = in_reg_tkeep[1]; // @[RxConverter.scala 44:32]
  wire  keep_val_16 = in_reg_tkeep[2]; // @[RxConverter.scala 44:32]
  wire  keep_val_24 = in_reg_tkeep[3]; // @[RxConverter.scala 44:32]
  wire  keep_val_32 = in_reg_tkeep[4]; // @[RxConverter.scala 44:32]
  wire  keep_val_40 = in_reg_tkeep[5]; // @[RxConverter.scala 44:32]
  wire  keep_val_48 = in_reg_tkeep[6]; // @[RxConverter.scala 44:32]
  wire  keep_val_56 = in_reg_tkeep[7]; // @[RxConverter.scala 44:32]
  wire  keep_val_64 = in_reg_tkeep[8]; // @[RxConverter.scala 44:32]
  wire  keep_val_72 = in_reg_tkeep[9]; // @[RxConverter.scala 44:32]
  wire  keep_val_80 = in_reg_tkeep[10]; // @[RxConverter.scala 44:32]
  wire  keep_val_88 = in_reg_tkeep[11]; // @[RxConverter.scala 44:32]
  wire  keep_val_96 = in_reg_tkeep[12]; // @[RxConverter.scala 44:32]
  wire  keep_val_104 = in_reg_tkeep[13]; // @[RxConverter.scala 44:32]
  wire  keep_val_112 = in_reg_tkeep[14]; // @[RxConverter.scala 44:32]
  wire  keep_val_120 = in_reg_tkeep[15]; // @[RxConverter.scala 44:32]
  wire  keep_val_128 = in_reg_tkeep[16]; // @[RxConverter.scala 44:32]
  wire  keep_val_136 = in_reg_tkeep[17]; // @[RxConverter.scala 44:32]
  wire  keep_val_144 = in_reg_tkeep[18]; // @[RxConverter.scala 44:32]
  wire  keep_val_152 = in_reg_tkeep[19]; // @[RxConverter.scala 44:32]
  wire  keep_val_160 = in_reg_tkeep[20]; // @[RxConverter.scala 44:32]
  wire  keep_val_168 = in_reg_tkeep[21]; // @[RxConverter.scala 44:32]
  wire  keep_val_176 = in_reg_tkeep[22]; // @[RxConverter.scala 44:32]
  wire  keep_val_184 = in_reg_tkeep[23]; // @[RxConverter.scala 44:32]
  wire  keep_val_192 = in_reg_tkeep[24]; // @[RxConverter.scala 44:32]
  wire  keep_val_200 = in_reg_tkeep[25]; // @[RxConverter.scala 44:32]
  wire  keep_val_208 = in_reg_tkeep[26]; // @[RxConverter.scala 44:32]
  wire  keep_val_216 = in_reg_tkeep[27]; // @[RxConverter.scala 44:32]
  wire  keep_val_224 = in_reg_tkeep[28]; // @[RxConverter.scala 44:32]
  wire  keep_val_232 = in_reg_tkeep[29]; // @[RxConverter.scala 44:32]
  wire  keep_val_240 = in_reg_tkeep[30]; // @[RxConverter.scala 44:32]
  wire  keep_val_248 = in_reg_tkeep[31]; // @[RxConverter.scala 44:32]
  wire  keep_val_256 = in_reg_tkeep[32]; // @[RxConverter.scala 44:32]
  wire  keep_val_264 = in_reg_tkeep[33]; // @[RxConverter.scala 44:32]
  wire  keep_val_272 = in_reg_tkeep[34]; // @[RxConverter.scala 44:32]
  wire  keep_val_280 = in_reg_tkeep[35]; // @[RxConverter.scala 44:32]
  wire  keep_val_288 = in_reg_tkeep[36]; // @[RxConverter.scala 44:32]
  wire  keep_val_296 = in_reg_tkeep[37]; // @[RxConverter.scala 44:32]
  wire  keep_val_304 = in_reg_tkeep[38]; // @[RxConverter.scala 44:32]
  wire  keep_val_312 = in_reg_tkeep[39]; // @[RxConverter.scala 44:32]
  wire  keep_val_320 = in_reg_tkeep[40]; // @[RxConverter.scala 44:32]
  wire  keep_val_328 = in_reg_tkeep[41]; // @[RxConverter.scala 44:32]
  wire  keep_val_336 = in_reg_tkeep[42]; // @[RxConverter.scala 44:32]
  wire  keep_val_344 = in_reg_tkeep[43]; // @[RxConverter.scala 44:32]
  wire  keep_val_352 = in_reg_tkeep[44]; // @[RxConverter.scala 44:32]
  wire  keep_val_360 = in_reg_tkeep[45]; // @[RxConverter.scala 44:32]
  wire  keep_val_368 = in_reg_tkeep[46]; // @[RxConverter.scala 44:32]
  wire  keep_val_376 = in_reg_tkeep[47]; // @[RxConverter.scala 44:32]
  wire  keep_val_384 = in_reg_tkeep[48]; // @[RxConverter.scala 44:32]
  wire  keep_val_392 = in_reg_tkeep[49]; // @[RxConverter.scala 44:32]
  wire  keep_val_400 = in_reg_tkeep[50]; // @[RxConverter.scala 44:32]
  wire  keep_val_408 = in_reg_tkeep[51]; // @[RxConverter.scala 44:32]
  wire  keep_val_416 = in_reg_tkeep[52]; // @[RxConverter.scala 44:32]
  wire  keep_val_424 = in_reg_tkeep[53]; // @[RxConverter.scala 44:32]
  wire  keep_val_432 = in_reg_tkeep[54]; // @[RxConverter.scala 44:32]
  wire  keep_val_440 = in_reg_tkeep[55]; // @[RxConverter.scala 44:32]
  wire  keep_val_448 = in_reg_tkeep[56]; // @[RxConverter.scala 44:32]
  wire  keep_val_456 = in_reg_tkeep[57]; // @[RxConverter.scala 44:32]
  wire  keep_val_464 = in_reg_tkeep[58]; // @[RxConverter.scala 44:32]
  wire  keep_val_472 = in_reg_tkeep[59]; // @[RxConverter.scala 44:32]
  wire  keep_val_480 = in_reg_tkeep[60]; // @[RxConverter.scala 44:32]
  wire  keep_val_488 = in_reg_tkeep[61]; // @[RxConverter.scala 44:32]
  wire  keep_val_496 = in_reg_tkeep[62]; // @[RxConverter.scala 44:32]
  wire  keep_val_504 = in_reg_tkeep[63]; // @[RxConverter.scala 44:32]
  wire [7:0] io_out_tdata_lo_lo_lo_lo_lo_lo = {keep_val_0,keep_val_0,keep_val_0,keep_val_0,keep_val_0,keep_val_0,
    keep_val_0,keep_val_0}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_lo_lo_lo_lo_lo = {keep_val_8,keep_val_8,keep_val_8,keep_val_8,keep_val_8,keep_val_8,
    keep_val_8,keep_val_8,io_out_tdata_lo_lo_lo_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_lo_lo_lo_hi_lo = {keep_val_16,keep_val_16,keep_val_16,keep_val_16,keep_val_16,keep_val_16,
    keep_val_16,keep_val_16}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_lo_lo_lo_lo = {keep_val_24,keep_val_24,keep_val_24,keep_val_24,keep_val_24,keep_val_24,
    keep_val_24,keep_val_24,io_out_tdata_lo_lo_lo_lo_hi_lo,io_out_tdata_lo_lo_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_lo_lo_hi_lo_lo = {keep_val_32,keep_val_32,keep_val_32,keep_val_32,keep_val_32,keep_val_32,
    keep_val_32,keep_val_32}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_lo_lo_lo_hi_lo = {keep_val_40,keep_val_40,keep_val_40,keep_val_40,keep_val_40,keep_val_40,
    keep_val_40,keep_val_40,io_out_tdata_lo_lo_lo_hi_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_lo_lo_hi_hi_lo = {keep_val_48,keep_val_48,keep_val_48,keep_val_48,keep_val_48,keep_val_48,
    keep_val_48,keep_val_48}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_lo_lo_lo_hi = {keep_val_56,keep_val_56,keep_val_56,keep_val_56,keep_val_56,keep_val_56,
    keep_val_56,keep_val_56,io_out_tdata_lo_lo_lo_hi_hi_lo,io_out_tdata_lo_lo_lo_hi_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_lo_hi_lo_lo_lo = {keep_val_64,keep_val_64,keep_val_64,keep_val_64,keep_val_64,keep_val_64,
    keep_val_64,keep_val_64}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_lo_lo_hi_lo_lo = {keep_val_72,keep_val_72,keep_val_72,keep_val_72,keep_val_72,keep_val_72,
    keep_val_72,keep_val_72,io_out_tdata_lo_lo_hi_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_lo_hi_lo_hi_lo = {keep_val_80,keep_val_80,keep_val_80,keep_val_80,keep_val_80,keep_val_80,
    keep_val_80,keep_val_80}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_lo_lo_hi_lo = {keep_val_88,keep_val_88,keep_val_88,keep_val_88,keep_val_88,keep_val_88,
    keep_val_88,keep_val_88,io_out_tdata_lo_lo_hi_lo_hi_lo,io_out_tdata_lo_lo_hi_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_lo_hi_hi_lo_lo = {keep_val_96,keep_val_96,keep_val_96,keep_val_96,keep_val_96,keep_val_96,
    keep_val_96,keep_val_96}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_lo_lo_hi_hi_lo = {keep_val_104,keep_val_104,keep_val_104,keep_val_104,keep_val_104,
    keep_val_104,keep_val_104,keep_val_104,io_out_tdata_lo_lo_hi_hi_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_lo_hi_hi_hi_lo = {keep_val_112,keep_val_112,keep_val_112,keep_val_112,keep_val_112,
    keep_val_112,keep_val_112,keep_val_112}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_lo_lo_hi_hi = {keep_val_120,keep_val_120,keep_val_120,keep_val_120,keep_val_120,keep_val_120,
    keep_val_120,keep_val_120,io_out_tdata_lo_lo_hi_hi_hi_lo,io_out_tdata_lo_lo_hi_hi_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_hi_lo_lo_lo_lo = {keep_val_128,keep_val_128,keep_val_128,keep_val_128,keep_val_128,
    keep_val_128,keep_val_128,keep_val_128}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_lo_hi_lo_lo_lo = {keep_val_136,keep_val_136,keep_val_136,keep_val_136,keep_val_136,
    keep_val_136,keep_val_136,keep_val_136,io_out_tdata_lo_hi_lo_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_hi_lo_lo_hi_lo = {keep_val_144,keep_val_144,keep_val_144,keep_val_144,keep_val_144,
    keep_val_144,keep_val_144,keep_val_144}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_lo_hi_lo_lo = {keep_val_152,keep_val_152,keep_val_152,keep_val_152,keep_val_152,keep_val_152,
    keep_val_152,keep_val_152,io_out_tdata_lo_hi_lo_lo_hi_lo,io_out_tdata_lo_hi_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_hi_lo_hi_lo_lo = {keep_val_160,keep_val_160,keep_val_160,keep_val_160,keep_val_160,
    keep_val_160,keep_val_160,keep_val_160}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_lo_hi_lo_hi_lo = {keep_val_168,keep_val_168,keep_val_168,keep_val_168,keep_val_168,
    keep_val_168,keep_val_168,keep_val_168,io_out_tdata_lo_hi_lo_hi_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_hi_lo_hi_hi_lo = {keep_val_176,keep_val_176,keep_val_176,keep_val_176,keep_val_176,
    keep_val_176,keep_val_176,keep_val_176}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_lo_hi_lo_hi = {keep_val_184,keep_val_184,keep_val_184,keep_val_184,keep_val_184,keep_val_184,
    keep_val_184,keep_val_184,io_out_tdata_lo_hi_lo_hi_hi_lo,io_out_tdata_lo_hi_lo_hi_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_hi_hi_lo_lo_lo = {keep_val_192,keep_val_192,keep_val_192,keep_val_192,keep_val_192,
    keep_val_192,keep_val_192,keep_val_192}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_lo_hi_hi_lo_lo = {keep_val_200,keep_val_200,keep_val_200,keep_val_200,keep_val_200,
    keep_val_200,keep_val_200,keep_val_200,io_out_tdata_lo_hi_hi_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_hi_hi_lo_hi_lo = {keep_val_208,keep_val_208,keep_val_208,keep_val_208,keep_val_208,
    keep_val_208,keep_val_208,keep_val_208}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_lo_hi_hi_lo = {keep_val_216,keep_val_216,keep_val_216,keep_val_216,keep_val_216,keep_val_216,
    keep_val_216,keep_val_216,io_out_tdata_lo_hi_hi_lo_hi_lo,io_out_tdata_lo_hi_hi_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_hi_hi_hi_lo_lo = {keep_val_224,keep_val_224,keep_val_224,keep_val_224,keep_val_224,
    keep_val_224,keep_val_224,keep_val_224}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_lo_hi_hi_hi_lo = {keep_val_232,keep_val_232,keep_val_232,keep_val_232,keep_val_232,
    keep_val_232,keep_val_232,keep_val_232,io_out_tdata_lo_hi_hi_hi_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_lo_hi_hi_hi_hi_lo = {keep_val_240,keep_val_240,keep_val_240,keep_val_240,keep_val_240,
    keep_val_240,keep_val_240,keep_val_240}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_lo_hi_hi_hi = {keep_val_248,keep_val_248,keep_val_248,keep_val_248,keep_val_248,keep_val_248,
    keep_val_248,keep_val_248,io_out_tdata_lo_hi_hi_hi_hi_lo,io_out_tdata_lo_hi_hi_hi_lo}; // @[RxConverter.scala 52:52]
  wire [255:0] io_out_tdata_lo = {io_out_tdata_lo_hi_hi_hi,io_out_tdata_lo_hi_hi_lo,io_out_tdata_lo_hi_lo_hi,
    io_out_tdata_lo_hi_lo_lo,io_out_tdata_lo_lo_hi_hi,io_out_tdata_lo_lo_hi_lo,io_out_tdata_lo_lo_lo_hi,
    io_out_tdata_lo_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_lo_lo_lo_lo_lo = {keep_val_256,keep_val_256,keep_val_256,keep_val_256,keep_val_256,
    keep_val_256,keep_val_256,keep_val_256}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_hi_lo_lo_lo_lo = {keep_val_264,keep_val_264,keep_val_264,keep_val_264,keep_val_264,
    keep_val_264,keep_val_264,keep_val_264,io_out_tdata_hi_lo_lo_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_lo_lo_lo_hi_lo = {keep_val_272,keep_val_272,keep_val_272,keep_val_272,keep_val_272,
    keep_val_272,keep_val_272,keep_val_272}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_hi_lo_lo_lo = {keep_val_280,keep_val_280,keep_val_280,keep_val_280,keep_val_280,keep_val_280,
    keep_val_280,keep_val_280,io_out_tdata_hi_lo_lo_lo_hi_lo,io_out_tdata_hi_lo_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_lo_lo_hi_lo_lo = {keep_val_288,keep_val_288,keep_val_288,keep_val_288,keep_val_288,
    keep_val_288,keep_val_288,keep_val_288}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_hi_lo_lo_hi_lo = {keep_val_296,keep_val_296,keep_val_296,keep_val_296,keep_val_296,
    keep_val_296,keep_val_296,keep_val_296,io_out_tdata_hi_lo_lo_hi_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_lo_lo_hi_hi_lo = {keep_val_304,keep_val_304,keep_val_304,keep_val_304,keep_val_304,
    keep_val_304,keep_val_304,keep_val_304}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_hi_lo_lo_hi = {keep_val_312,keep_val_312,keep_val_312,keep_val_312,keep_val_312,keep_val_312,
    keep_val_312,keep_val_312,io_out_tdata_hi_lo_lo_hi_hi_lo,io_out_tdata_hi_lo_lo_hi_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_lo_hi_lo_lo_lo = {keep_val_320,keep_val_320,keep_val_320,keep_val_320,keep_val_320,
    keep_val_320,keep_val_320,keep_val_320}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_hi_lo_hi_lo_lo = {keep_val_328,keep_val_328,keep_val_328,keep_val_328,keep_val_328,
    keep_val_328,keep_val_328,keep_val_328,io_out_tdata_hi_lo_hi_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_lo_hi_lo_hi_lo = {keep_val_336,keep_val_336,keep_val_336,keep_val_336,keep_val_336,
    keep_val_336,keep_val_336,keep_val_336}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_hi_lo_hi_lo = {keep_val_344,keep_val_344,keep_val_344,keep_val_344,keep_val_344,keep_val_344,
    keep_val_344,keep_val_344,io_out_tdata_hi_lo_hi_lo_hi_lo,io_out_tdata_hi_lo_hi_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_lo_hi_hi_lo_lo = {keep_val_352,keep_val_352,keep_val_352,keep_val_352,keep_val_352,
    keep_val_352,keep_val_352,keep_val_352}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_hi_lo_hi_hi_lo = {keep_val_360,keep_val_360,keep_val_360,keep_val_360,keep_val_360,
    keep_val_360,keep_val_360,keep_val_360,io_out_tdata_hi_lo_hi_hi_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_lo_hi_hi_hi_lo = {keep_val_368,keep_val_368,keep_val_368,keep_val_368,keep_val_368,
    keep_val_368,keep_val_368,keep_val_368}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_hi_lo_hi_hi = {keep_val_376,keep_val_376,keep_val_376,keep_val_376,keep_val_376,keep_val_376,
    keep_val_376,keep_val_376,io_out_tdata_hi_lo_hi_hi_hi_lo,io_out_tdata_hi_lo_hi_hi_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_hi_lo_lo_lo_lo = {keep_val_384,keep_val_384,keep_val_384,keep_val_384,keep_val_384,
    keep_val_384,keep_val_384,keep_val_384}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_hi_hi_lo_lo_lo = {keep_val_392,keep_val_392,keep_val_392,keep_val_392,keep_val_392,
    keep_val_392,keep_val_392,keep_val_392,io_out_tdata_hi_hi_lo_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_hi_lo_lo_hi_lo = {keep_val_400,keep_val_400,keep_val_400,keep_val_400,keep_val_400,
    keep_val_400,keep_val_400,keep_val_400}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_hi_hi_lo_lo = {keep_val_408,keep_val_408,keep_val_408,keep_val_408,keep_val_408,keep_val_408,
    keep_val_408,keep_val_408,io_out_tdata_hi_hi_lo_lo_hi_lo,io_out_tdata_hi_hi_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_hi_lo_hi_lo_lo = {keep_val_416,keep_val_416,keep_val_416,keep_val_416,keep_val_416,
    keep_val_416,keep_val_416,keep_val_416}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_hi_hi_lo_hi_lo = {keep_val_424,keep_val_424,keep_val_424,keep_val_424,keep_val_424,
    keep_val_424,keep_val_424,keep_val_424,io_out_tdata_hi_hi_lo_hi_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_hi_lo_hi_hi_lo = {keep_val_432,keep_val_432,keep_val_432,keep_val_432,keep_val_432,
    keep_val_432,keep_val_432,keep_val_432}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_hi_hi_lo_hi = {keep_val_440,keep_val_440,keep_val_440,keep_val_440,keep_val_440,keep_val_440,
    keep_val_440,keep_val_440,io_out_tdata_hi_hi_lo_hi_hi_lo,io_out_tdata_hi_hi_lo_hi_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_hi_hi_lo_lo_lo = {keep_val_448,keep_val_448,keep_val_448,keep_val_448,keep_val_448,
    keep_val_448,keep_val_448,keep_val_448}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_hi_hi_hi_lo_lo = {keep_val_456,keep_val_456,keep_val_456,keep_val_456,keep_val_456,
    keep_val_456,keep_val_456,keep_val_456,io_out_tdata_hi_hi_hi_lo_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_hi_hi_lo_hi_lo = {keep_val_464,keep_val_464,keep_val_464,keep_val_464,keep_val_464,
    keep_val_464,keep_val_464,keep_val_464}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_hi_hi_hi_lo = {keep_val_472,keep_val_472,keep_val_472,keep_val_472,keep_val_472,keep_val_472,
    keep_val_472,keep_val_472,io_out_tdata_hi_hi_hi_lo_hi_lo,io_out_tdata_hi_hi_hi_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_hi_hi_hi_lo_lo = {keep_val_480,keep_val_480,keep_val_480,keep_val_480,keep_val_480,
    keep_val_480,keep_val_480,keep_val_480}; // @[RxConverter.scala 52:52]
  wire [15:0] io_out_tdata_hi_hi_hi_hi_lo = {keep_val_488,keep_val_488,keep_val_488,keep_val_488,keep_val_488,
    keep_val_488,keep_val_488,keep_val_488,io_out_tdata_hi_hi_hi_hi_lo_lo}; // @[RxConverter.scala 52:52]
  wire [7:0] io_out_tdata_hi_hi_hi_hi_hi_lo = {keep_val_496,keep_val_496,keep_val_496,keep_val_496,keep_val_496,
    keep_val_496,keep_val_496,keep_val_496}; // @[RxConverter.scala 52:52]
  wire [31:0] io_out_tdata_hi_hi_hi_hi = {keep_val_504,keep_val_504,keep_val_504,keep_val_504,keep_val_504,keep_val_504,
    keep_val_504,keep_val_504,io_out_tdata_hi_hi_hi_hi_hi_lo,io_out_tdata_hi_hi_hi_hi_lo}; // @[RxConverter.scala 52:52]
  wire [511:0] _io_out_tdata_T = {io_out_tdata_hi_hi_hi_hi,io_out_tdata_hi_hi_hi_lo,io_out_tdata_hi_hi_lo_hi,
    io_out_tdata_hi_hi_lo_lo,io_out_tdata_hi_lo_hi_hi,io_out_tdata_hi_lo_hi_lo,io_out_tdata_hi_lo_lo_hi,
    io_out_tdata_hi_lo_lo_lo,io_out_tdata_lo}; // @[RxConverter.scala 52:52]
  ReduceAddSync_3 burst_size_cal ( // @[RxConverter.scala 28:30]
    .clock(burst_size_cal_clock),
    .io_in_vec_0(burst_size_cal_io_in_vec_0),
    .io_in_vec_1(burst_size_cal_io_in_vec_1),
    .io_in_vec_2(burst_size_cal_io_in_vec_2),
    .io_in_vec_3(burst_size_cal_io_in_vec_3),
    .io_in_vec_4(burst_size_cal_io_in_vec_4),
    .io_in_vec_5(burst_size_cal_io_in_vec_5),
    .io_in_vec_6(burst_size_cal_io_in_vec_6),
    .io_in_vec_7(burst_size_cal_io_in_vec_7),
    .io_in_vec_8(burst_size_cal_io_in_vec_8),
    .io_in_vec_9(burst_size_cal_io_in_vec_9),
    .io_in_vec_10(burst_size_cal_io_in_vec_10),
    .io_in_vec_11(burst_size_cal_io_in_vec_11),
    .io_in_vec_12(burst_size_cal_io_in_vec_12),
    .io_in_vec_13(burst_size_cal_io_in_vec_13),
    .io_in_vec_14(burst_size_cal_io_in_vec_14),
    .io_in_vec_15(burst_size_cal_io_in_vec_15),
    .io_in_vec_16(burst_size_cal_io_in_vec_16),
    .io_in_vec_17(burst_size_cal_io_in_vec_17),
    .io_in_vec_18(burst_size_cal_io_in_vec_18),
    .io_in_vec_19(burst_size_cal_io_in_vec_19),
    .io_in_vec_20(burst_size_cal_io_in_vec_20),
    .io_in_vec_21(burst_size_cal_io_in_vec_21),
    .io_in_vec_22(burst_size_cal_io_in_vec_22),
    .io_in_vec_23(burst_size_cal_io_in_vec_23),
    .io_in_vec_24(burst_size_cal_io_in_vec_24),
    .io_in_vec_25(burst_size_cal_io_in_vec_25),
    .io_in_vec_26(burst_size_cal_io_in_vec_26),
    .io_in_vec_27(burst_size_cal_io_in_vec_27),
    .io_in_vec_28(burst_size_cal_io_in_vec_28),
    .io_in_vec_29(burst_size_cal_io_in_vec_29),
    .io_in_vec_30(burst_size_cal_io_in_vec_30),
    .io_in_vec_31(burst_size_cal_io_in_vec_31),
    .io_in_vec_32(burst_size_cal_io_in_vec_32),
    .io_in_vec_33(burst_size_cal_io_in_vec_33),
    .io_in_vec_34(burst_size_cal_io_in_vec_34),
    .io_in_vec_35(burst_size_cal_io_in_vec_35),
    .io_in_vec_36(burst_size_cal_io_in_vec_36),
    .io_in_vec_37(burst_size_cal_io_in_vec_37),
    .io_in_vec_38(burst_size_cal_io_in_vec_38),
    .io_in_vec_39(burst_size_cal_io_in_vec_39),
    .io_in_vec_40(burst_size_cal_io_in_vec_40),
    .io_in_vec_41(burst_size_cal_io_in_vec_41),
    .io_in_vec_42(burst_size_cal_io_in_vec_42),
    .io_in_vec_43(burst_size_cal_io_in_vec_43),
    .io_in_vec_44(burst_size_cal_io_in_vec_44),
    .io_in_vec_45(burst_size_cal_io_in_vec_45),
    .io_in_vec_46(burst_size_cal_io_in_vec_46),
    .io_in_vec_47(burst_size_cal_io_in_vec_47),
    .io_in_vec_48(burst_size_cal_io_in_vec_48),
    .io_in_vec_49(burst_size_cal_io_in_vec_49),
    .io_in_vec_50(burst_size_cal_io_in_vec_50),
    .io_in_vec_51(burst_size_cal_io_in_vec_51),
    .io_in_vec_52(burst_size_cal_io_in_vec_52),
    .io_in_vec_53(burst_size_cal_io_in_vec_53),
    .io_in_vec_54(burst_size_cal_io_in_vec_54),
    .io_in_vec_55(burst_size_cal_io_in_vec_55),
    .io_in_vec_56(burst_size_cal_io_in_vec_56),
    .io_in_vec_57(burst_size_cal_io_in_vec_57),
    .io_in_vec_58(burst_size_cal_io_in_vec_58),
    .io_in_vec_59(burst_size_cal_io_in_vec_59),
    .io_in_vec_60(burst_size_cal_io_in_vec_60),
    .io_in_vec_61(burst_size_cal_io_in_vec_61),
    .io_in_vec_62(burst_size_cal_io_in_vec_62),
    .io_in_vec_63(burst_size_cal_io_in_vec_63),
    .io_out_sum(burst_size_cal_io_out_sum)
  );
  assign io_in_tready = io_out_tready | ~in_reg_used_reg; // @[RxConverter.scala 55:34]
  assign io_out_tdata = in_reg_tdata & _io_out_tdata_T; // @[RxConverter.scala 52:33]
  assign io_out_tvalid = in_reg_tvalid & in_reg_used_reg; // @[RxConverter.scala 53:34]
  assign io_out_tlast = in_reg_r[0]; // @[RxConverter.scala 17:119]
  assign io_out_tuser = in_reg_r[578]; // @[RxConverter.scala 17:119]
  assign io_out_rx_info_tlen = first_beat_reg ? {{8'd0}, burst_size_cal_io_out_sum} : _tlen_reg_T_1; // @[RxConverter.scala 57:29]
  assign io_out_extern_config_c2h_match_op = extern_config_reg_r[519:512]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_0 = extern_config_reg_r[31:0]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_1 = extern_config_reg_r[63:32]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_2 = extern_config_reg_r[95:64]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_3 = extern_config_reg_r[127:96]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_4 = extern_config_reg_r[159:128]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_5 = extern_config_reg_r[191:160]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_6 = extern_config_reg_r[223:192]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_7 = extern_config_reg_r[255:224]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_8 = extern_config_reg_r[287:256]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_9 = extern_config_reg_r[319:288]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_10 = extern_config_reg_r[351:320]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_11 = extern_config_reg_r[383:352]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_12 = extern_config_reg_r[415:384]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_13 = extern_config_reg_r[447:416]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_14 = extern_config_reg_r[479:448]; // @[RxConverter.scala 25:104]
  assign io_out_extern_config_c2h_match_arg_15 = extern_config_reg_r[511:480]; // @[RxConverter.scala 25:104]
  assign burst_size_cal_clock = clock;
  assign burst_size_cal_io_in_vec_0 = {{7'd0}, cal_tkeep[0]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_1 = {{7'd0}, cal_tkeep[1]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_2 = {{7'd0}, cal_tkeep[2]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_3 = {{7'd0}, cal_tkeep[3]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_4 = {{7'd0}, cal_tkeep[4]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_5 = {{7'd0}, cal_tkeep[5]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_6 = {{7'd0}, cal_tkeep[6]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_7 = {{7'd0}, cal_tkeep[7]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_8 = {{7'd0}, cal_tkeep[8]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_9 = {{7'd0}, cal_tkeep[9]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_10 = {{7'd0}, cal_tkeep[10]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_11 = {{7'd0}, cal_tkeep[11]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_12 = {{7'd0}, cal_tkeep[12]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_13 = {{7'd0}, cal_tkeep[13]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_14 = {{7'd0}, cal_tkeep[14]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_15 = {{7'd0}, cal_tkeep[15]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_16 = {{7'd0}, cal_tkeep[16]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_17 = {{7'd0}, cal_tkeep[17]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_18 = {{7'd0}, cal_tkeep[18]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_19 = {{7'd0}, cal_tkeep[19]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_20 = {{7'd0}, cal_tkeep[20]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_21 = {{7'd0}, cal_tkeep[21]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_22 = {{7'd0}, cal_tkeep[22]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_23 = {{7'd0}, cal_tkeep[23]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_24 = {{7'd0}, cal_tkeep[24]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_25 = {{7'd0}, cal_tkeep[25]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_26 = {{7'd0}, cal_tkeep[26]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_27 = {{7'd0}, cal_tkeep[27]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_28 = {{7'd0}, cal_tkeep[28]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_29 = {{7'd0}, cal_tkeep[29]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_30 = {{7'd0}, cal_tkeep[30]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_31 = {{7'd0}, cal_tkeep[31]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_32 = {{7'd0}, cal_tkeep[32]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_33 = {{7'd0}, cal_tkeep[33]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_34 = {{7'd0}, cal_tkeep[34]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_35 = {{7'd0}, cal_tkeep[35]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_36 = {{7'd0}, cal_tkeep[36]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_37 = {{7'd0}, cal_tkeep[37]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_38 = {{7'd0}, cal_tkeep[38]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_39 = {{7'd0}, cal_tkeep[39]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_40 = {{7'd0}, cal_tkeep[40]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_41 = {{7'd0}, cal_tkeep[41]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_42 = {{7'd0}, cal_tkeep[42]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_43 = {{7'd0}, cal_tkeep[43]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_44 = {{7'd0}, cal_tkeep[44]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_45 = {{7'd0}, cal_tkeep[45]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_46 = {{7'd0}, cal_tkeep[46]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_47 = {{7'd0}, cal_tkeep[47]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_48 = {{7'd0}, cal_tkeep[48]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_49 = {{7'd0}, cal_tkeep[49]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_50 = {{7'd0}, cal_tkeep[50]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_51 = {{7'd0}, cal_tkeep[51]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_52 = {{7'd0}, cal_tkeep[52]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_53 = {{7'd0}, cal_tkeep[53]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_54 = {{7'd0}, cal_tkeep[54]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_55 = {{7'd0}, cal_tkeep[55]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_56 = {{7'd0}, cal_tkeep[56]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_57 = {{7'd0}, cal_tkeep[57]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_58 = {{7'd0}, cal_tkeep[58]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_59 = {{7'd0}, cal_tkeep[59]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_60 = {{7'd0}, cal_tkeep[60]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_61 = {{7'd0}, cal_tkeep[61]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_62 = {{7'd0}, cal_tkeep[62]}; // @[RxConverter.scala 29:53]
  assign burst_size_cal_io_in_vec_63 = {{7'd0}, cal_tkeep[63]}; // @[RxConverter.scala 29:53]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 28:20]
      in_reg_r <= 579'h1; // @[Reg.scala 28:20]
    end else if (in_shake_hand) begin // @[Reg.scala 29:18]
      in_reg_r <= _in_reg_T; // @[Reg.scala 29:22]
    end
    first_beat_reg <= reset | _GEN_1; // @[Reg.scala 28:{20,20}]
    if (reset) begin // @[RxConverter.scala 19:32]
      in_reg_used_reg <= 1'h0; // @[RxConverter.scala 19:32]
    end else begin
      in_reg_used_reg <= _GEN_3;
    end
    if (reset) begin // @[Reg.scala 28:20]
      extern_config_reg_r <= 520'h0; // @[Reg.scala 28:20]
    end else if (out_shake_hand) begin // @[Reg.scala 29:18]
      extern_config_reg_r <= _extern_config_reg_T; // @[Reg.scala 29:22]
    end
    if (reset) begin // @[RxConverter.scala 33:25]
      tlen_reg <= 16'h0; // @[RxConverter.scala 33:25]
    end else if (in_shake_hand) begin // @[RxConverter.scala 34:24]
      if (first_beat_reg) begin // @[RxConverter.scala 35:27]
        tlen_reg <= {{8'd0}, burst_size_cal_io_out_sum}; // @[RxConverter.scala 36:16]
      end else begin
        tlen_reg <= _tlen_reg_T_1; // @[RxConverter.scala 38:16]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {19{`RANDOM}};
  in_reg_r = _RAND_0[578:0];
  _RAND_1 = {1{`RANDOM}};
  first_beat_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  in_reg_used_reg = _RAND_2[0:0];
  _RAND_3 = {17{`RANDOM}};
  extern_config_reg_r = _RAND_3[519:0];
  _RAND_4 = {1{`RANDOM}};
  tlen_reg = _RAND_4[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module REHandlerUnit(
  input  [7:0]  io_in_char,
  input  [3:0]  io_in_state,
  input  [31:0] io_in_rule_0,
  input  [31:0] io_in_rule_1,
  input  [31:0] io_in_rule_2,
  input  [31:0] io_in_rule_3,
  input  [31:0] io_in_rule_4,
  input  [31:0] io_in_rule_5,
  input  [31:0] io_in_rule_6,
  input  [31:0] io_in_rule_7,
  input  [31:0] io_in_rule_8,
  input  [31:0] io_in_rule_9,
  input  [31:0] io_in_rule_10,
  input  [31:0] io_in_rule_11,
  input  [31:0] io_in_rule_12,
  input  [31:0] io_in_rule_13,
  input  [31:0] io_in_rule_14,
  input  [31:0] io_in_rule_15,
  output [3:0]  io_out_state
);
  wire  char_1_or_2_cmp = io_in_char == io_in_rule_0[7:0] | io_in_char == io_in_rule_0[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp = io_in_char >= io_in_rule_0[7:0] & io_in_char <= io_in_rule_0[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result = io_in_rule_0[17] ? char_1_to_2_cmp : char_1_or_2_cmp; // @[RxRESearcher.scala 24:25]
  wire  match_ok = io_in_rule_0[16] ? ~cmp_result : cmp_result; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_0 = io_in_state == io_in_rule_0[27:24] & match_ok ? io_in_rule_0[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_1 = io_in_char == io_in_rule_1[7:0] | io_in_char == io_in_rule_1[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_1 = io_in_char >= io_in_rule_1[7:0] & io_in_char <= io_in_rule_1[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_1 = io_in_rule_1[17] ? char_1_to_2_cmp_1 : char_1_or_2_cmp_1; // @[RxRESearcher.scala 24:25]
  wire  match_ok_1 = io_in_rule_1[16] ? ~cmp_result_1 : cmp_result_1; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_1 = io_in_state == io_in_rule_1[27:24] & match_ok_1 ? io_in_rule_1[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_2 = io_in_char == io_in_rule_2[7:0] | io_in_char == io_in_rule_2[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_2 = io_in_char >= io_in_rule_2[7:0] & io_in_char <= io_in_rule_2[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_2 = io_in_rule_2[17] ? char_1_to_2_cmp_2 : char_1_or_2_cmp_2; // @[RxRESearcher.scala 24:25]
  wire  match_ok_2 = io_in_rule_2[16] ? ~cmp_result_2 : cmp_result_2; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_2 = io_in_state == io_in_rule_2[27:24] & match_ok_2 ? io_in_rule_2[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_3 = io_in_char == io_in_rule_3[7:0] | io_in_char == io_in_rule_3[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_3 = io_in_char >= io_in_rule_3[7:0] & io_in_char <= io_in_rule_3[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_3 = io_in_rule_3[17] ? char_1_to_2_cmp_3 : char_1_or_2_cmp_3; // @[RxRESearcher.scala 24:25]
  wire  match_ok_3 = io_in_rule_3[16] ? ~cmp_result_3 : cmp_result_3; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_3 = io_in_state == io_in_rule_3[27:24] & match_ok_3 ? io_in_rule_3[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_4 = io_in_char == io_in_rule_4[7:0] | io_in_char == io_in_rule_4[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_4 = io_in_char >= io_in_rule_4[7:0] & io_in_char <= io_in_rule_4[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_4 = io_in_rule_4[17] ? char_1_to_2_cmp_4 : char_1_or_2_cmp_4; // @[RxRESearcher.scala 24:25]
  wire  match_ok_4 = io_in_rule_4[16] ? ~cmp_result_4 : cmp_result_4; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_4 = io_in_state == io_in_rule_4[27:24] & match_ok_4 ? io_in_rule_4[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_5 = io_in_char == io_in_rule_5[7:0] | io_in_char == io_in_rule_5[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_5 = io_in_char >= io_in_rule_5[7:0] & io_in_char <= io_in_rule_5[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_5 = io_in_rule_5[17] ? char_1_to_2_cmp_5 : char_1_or_2_cmp_5; // @[RxRESearcher.scala 24:25]
  wire  match_ok_5 = io_in_rule_5[16] ? ~cmp_result_5 : cmp_result_5; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_5 = io_in_state == io_in_rule_5[27:24] & match_ok_5 ? io_in_rule_5[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_6 = io_in_char == io_in_rule_6[7:0] | io_in_char == io_in_rule_6[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_6 = io_in_char >= io_in_rule_6[7:0] & io_in_char <= io_in_rule_6[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_6 = io_in_rule_6[17] ? char_1_to_2_cmp_6 : char_1_or_2_cmp_6; // @[RxRESearcher.scala 24:25]
  wire  match_ok_6 = io_in_rule_6[16] ? ~cmp_result_6 : cmp_result_6; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_6 = io_in_state == io_in_rule_6[27:24] & match_ok_6 ? io_in_rule_6[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_7 = io_in_char == io_in_rule_7[7:0] | io_in_char == io_in_rule_7[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_7 = io_in_char >= io_in_rule_7[7:0] & io_in_char <= io_in_rule_7[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_7 = io_in_rule_7[17] ? char_1_to_2_cmp_7 : char_1_or_2_cmp_7; // @[RxRESearcher.scala 24:25]
  wire  match_ok_7 = io_in_rule_7[16] ? ~cmp_result_7 : cmp_result_7; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_7 = io_in_state == io_in_rule_7[27:24] & match_ok_7 ? io_in_rule_7[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_8 = io_in_char == io_in_rule_8[7:0] | io_in_char == io_in_rule_8[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_8 = io_in_char >= io_in_rule_8[7:0] & io_in_char <= io_in_rule_8[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_8 = io_in_rule_8[17] ? char_1_to_2_cmp_8 : char_1_or_2_cmp_8; // @[RxRESearcher.scala 24:25]
  wire  match_ok_8 = io_in_rule_8[16] ? ~cmp_result_8 : cmp_result_8; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_8 = io_in_state == io_in_rule_8[27:24] & match_ok_8 ? io_in_rule_8[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_9 = io_in_char == io_in_rule_9[7:0] | io_in_char == io_in_rule_9[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_9 = io_in_char >= io_in_rule_9[7:0] & io_in_char <= io_in_rule_9[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_9 = io_in_rule_9[17] ? char_1_to_2_cmp_9 : char_1_or_2_cmp_9; // @[RxRESearcher.scala 24:25]
  wire  match_ok_9 = io_in_rule_9[16] ? ~cmp_result_9 : cmp_result_9; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_9 = io_in_state == io_in_rule_9[27:24] & match_ok_9 ? io_in_rule_9[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_10 = io_in_char == io_in_rule_10[7:0] | io_in_char == io_in_rule_10[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_10 = io_in_char >= io_in_rule_10[7:0] & io_in_char <= io_in_rule_10[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_10 = io_in_rule_10[17] ? char_1_to_2_cmp_10 : char_1_or_2_cmp_10; // @[RxRESearcher.scala 24:25]
  wire  match_ok_10 = io_in_rule_10[16] ? ~cmp_result_10 : cmp_result_10; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_10 = io_in_state == io_in_rule_10[27:24] & match_ok_10 ? io_in_rule_10[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_11 = io_in_char == io_in_rule_11[7:0] | io_in_char == io_in_rule_11[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_11 = io_in_char >= io_in_rule_11[7:0] & io_in_char <= io_in_rule_11[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_11 = io_in_rule_11[17] ? char_1_to_2_cmp_11 : char_1_or_2_cmp_11; // @[RxRESearcher.scala 24:25]
  wire  match_ok_11 = io_in_rule_11[16] ? ~cmp_result_11 : cmp_result_11; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_11 = io_in_state == io_in_rule_11[27:24] & match_ok_11 ? io_in_rule_11[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_12 = io_in_char == io_in_rule_12[7:0] | io_in_char == io_in_rule_12[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_12 = io_in_char >= io_in_rule_12[7:0] & io_in_char <= io_in_rule_12[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_12 = io_in_rule_12[17] ? char_1_to_2_cmp_12 : char_1_or_2_cmp_12; // @[RxRESearcher.scala 24:25]
  wire  match_ok_12 = io_in_rule_12[16] ? ~cmp_result_12 : cmp_result_12; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_12 = io_in_state == io_in_rule_12[27:24] & match_ok_12 ? io_in_rule_12[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_13 = io_in_char == io_in_rule_13[7:0] | io_in_char == io_in_rule_13[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_13 = io_in_char >= io_in_rule_13[7:0] & io_in_char <= io_in_rule_13[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_13 = io_in_rule_13[17] ? char_1_to_2_cmp_13 : char_1_or_2_cmp_13; // @[RxRESearcher.scala 24:25]
  wire  match_ok_13 = io_in_rule_13[16] ? ~cmp_result_13 : cmp_result_13; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_13 = io_in_state == io_in_rule_13[27:24] & match_ok_13 ? io_in_rule_13[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_14 = io_in_char == io_in_rule_14[7:0] | io_in_char == io_in_rule_14[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_14 = io_in_char >= io_in_rule_14[7:0] & io_in_char <= io_in_rule_14[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_14 = io_in_rule_14[17] ? char_1_to_2_cmp_14 : char_1_or_2_cmp_14; // @[RxRESearcher.scala 24:25]
  wire  match_ok_14 = io_in_rule_14[16] ? ~cmp_result_14 : cmp_result_14; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_14 = io_in_state == io_in_rule_14[27:24] & match_ok_14 ? io_in_rule_14[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire  char_1_or_2_cmp_15 = io_in_char == io_in_rule_15[7:0] | io_in_char == io_in_rule_15[15:8]; // @[RxRESearcher.scala 22:63]
  wire  char_1_to_2_cmp_15 = io_in_char >= io_in_rule_15[7:0] & io_in_char <= io_in_rule_15[15:8]; // @[RxRESearcher.scala 23:62]
  wire  cmp_result_15 = io_in_rule_15[17] ? char_1_to_2_cmp_15 : char_1_or_2_cmp_15; // @[RxRESearcher.scala 24:25]
  wire  match_ok_15 = io_in_rule_15[16] ? ~cmp_result_15 : cmp_result_15; // @[RxRESearcher.scala 25:25]
  wire [3:0] result_15 = io_in_state == io_in_rule_15[27:24] & match_ok_15 ? io_in_rule_15[31:28] : 4'h0; // @[RxRESearcher.scala 27:61 28:19]
  wire [3:0] _io_out_state_T_1 = result_0 | result_1; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_2 = result_2 | result_3; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_3 = result_4 | result_5; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_4 = result_6 | result_7; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_5 = result_8 | result_9; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_6 = result_10 | result_11; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_7 = result_12 | result_13; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_8 = result_14 | result_15; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_9 = _io_out_state_T_1 | _io_out_state_T_2; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_10 = _io_out_state_T_3 | _io_out_state_T_4; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_11 = _io_out_state_T_5 | _io_out_state_T_6; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_12 = _io_out_state_T_7 | _io_out_state_T_8; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_13 = _io_out_state_T_9 | _io_out_state_T_10; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_14 = _io_out_state_T_11 | _io_out_state_T_12; // @[RxRESearcher.scala 32:68]
  wire [3:0] _io_out_state_T_15 = _io_out_state_T_13 | _io_out_state_T_14; // @[RxRESearcher.scala 32:68]
  assign io_out_state = io_in_state == 4'hf ? 4'hf : _io_out_state_T_15; // @[RxRESearcher.scala 32:22]
endmodule
module REHandler(
  input         clock,
  input         reset,
  input  [7:0]  io_in_char,
  input  [3:0]  io_in_state,
  input  [31:0] io_in_rule_0,
  input  [31:0] io_in_rule_1,
  input  [31:0] io_in_rule_2,
  input  [31:0] io_in_rule_3,
  input  [31:0] io_in_rule_4,
  input  [31:0] io_in_rule_5,
  input  [31:0] io_in_rule_6,
  input  [31:0] io_in_rule_7,
  input  [31:0] io_in_rule_8,
  input  [31:0] io_in_rule_9,
  input  [31:0] io_in_rule_10,
  input  [31:0] io_in_rule_11,
  input  [31:0] io_in_rule_12,
  input  [31:0] io_in_rule_13,
  input  [31:0] io_in_rule_14,
  input  [31:0] io_in_rule_15,
  input         io_in_en,
  output [3:0]  io_out_state
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] re_handler_unit_queue_0_io_in_char; // @[RxRESearcher.scala 45:52]
  wire [3:0] re_handler_unit_queue_0_io_in_state; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_0; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_1; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_2; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_3; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_4; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_5; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_6; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_7; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_8; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_9; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_10; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_11; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_12; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_13; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_14; // @[RxRESearcher.scala 45:52]
  wire [31:0] re_handler_unit_queue_0_io_in_rule_15; // @[RxRESearcher.scala 45:52]
  wire [3:0] re_handler_unit_queue_0_io_out_state; // @[RxRESearcher.scala 45:52]
  reg [3:0] part_result_reg; // @[RxRESearcher.scala 46:32]
  REHandlerUnit re_handler_unit_queue_0 ( // @[RxRESearcher.scala 45:52]
    .io_in_char(re_handler_unit_queue_0_io_in_char),
    .io_in_state(re_handler_unit_queue_0_io_in_state),
    .io_in_rule_0(re_handler_unit_queue_0_io_in_rule_0),
    .io_in_rule_1(re_handler_unit_queue_0_io_in_rule_1),
    .io_in_rule_2(re_handler_unit_queue_0_io_in_rule_2),
    .io_in_rule_3(re_handler_unit_queue_0_io_in_rule_3),
    .io_in_rule_4(re_handler_unit_queue_0_io_in_rule_4),
    .io_in_rule_5(re_handler_unit_queue_0_io_in_rule_5),
    .io_in_rule_6(re_handler_unit_queue_0_io_in_rule_6),
    .io_in_rule_7(re_handler_unit_queue_0_io_in_rule_7),
    .io_in_rule_8(re_handler_unit_queue_0_io_in_rule_8),
    .io_in_rule_9(re_handler_unit_queue_0_io_in_rule_9),
    .io_in_rule_10(re_handler_unit_queue_0_io_in_rule_10),
    .io_in_rule_11(re_handler_unit_queue_0_io_in_rule_11),
    .io_in_rule_12(re_handler_unit_queue_0_io_in_rule_12),
    .io_in_rule_13(re_handler_unit_queue_0_io_in_rule_13),
    .io_in_rule_14(re_handler_unit_queue_0_io_in_rule_14),
    .io_in_rule_15(re_handler_unit_queue_0_io_in_rule_15),
    .io_out_state(re_handler_unit_queue_0_io_out_state)
  );
  assign io_out_state = part_result_reg; // @[RxRESearcher.scala 58:16]
  assign re_handler_unit_queue_0_io_in_char = io_in_char; // @[RxRESearcher.scala 49:54]
  assign re_handler_unit_queue_0_io_in_state = io_in_state; // @[RxRESearcher.scala 51:54]
  assign re_handler_unit_queue_0_io_in_rule_0 = io_in_rule_0; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_1 = io_in_rule_1; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_2 = io_in_rule_2; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_3 = io_in_rule_3; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_4 = io_in_rule_4; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_5 = io_in_rule_5; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_6 = io_in_rule_6; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_7 = io_in_rule_7; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_8 = io_in_rule_8; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_9 = io_in_rule_9; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_10 = io_in_rule_10; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_11 = io_in_rule_11; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_12 = io_in_rule_12; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_13 = io_in_rule_13; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_14 = io_in_rule_14; // @[RxRESearcher.scala 50:41]
  assign re_handler_unit_queue_0_io_in_rule_15 = io_in_rule_15; // @[RxRESearcher.scala 50:41]
  always @(posedge clock) begin
    if (reset) begin // @[RxRESearcher.scala 46:32]
      part_result_reg <= 4'h0; // @[RxRESearcher.scala 46:32]
    end else if (io_in_en) begin // @[RxRESearcher.scala 55:19]
      part_result_reg <= re_handler_unit_queue_0_io_out_state; // @[RxRESearcher.scala 56:21]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  part_result_reg = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RxRESearcher(
  input          clock,
  input          reset,
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input          io_in_tuser,
  input  [15:0]  io_in_rx_info_tlen,
  input  [5:0]   io_in_rx_info_qid,
  input  [31:0]  io_in_rx_info_ip_chksum,
  input  [31:0]  io_in_rx_info_tcp_chksum,
  input  [7:0]   io_in_extern_config_c2h_match_op,
  input  [31:0]  io_in_extern_config_c2h_match_arg_0,
  input  [31:0]  io_in_extern_config_c2h_match_arg_1,
  input  [31:0]  io_in_extern_config_c2h_match_arg_2,
  input  [31:0]  io_in_extern_config_c2h_match_arg_3,
  input  [31:0]  io_in_extern_config_c2h_match_arg_4,
  input  [31:0]  io_in_extern_config_c2h_match_arg_5,
  input  [31:0]  io_in_extern_config_c2h_match_arg_6,
  input  [31:0]  io_in_extern_config_c2h_match_arg_7,
  input  [31:0]  io_in_extern_config_c2h_match_arg_8,
  input  [31:0]  io_in_extern_config_c2h_match_arg_9,
  input  [31:0]  io_in_extern_config_c2h_match_arg_10,
  input  [31:0]  io_in_extern_config_c2h_match_arg_11,
  input  [31:0]  io_in_extern_config_c2h_match_arg_12,
  input  [31:0]  io_in_extern_config_c2h_match_arg_13,
  input  [31:0]  io_in_extern_config_c2h_match_arg_14,
  input  [31:0]  io_in_extern_config_c2h_match_arg_15,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  output         io_out_tuser,
  output [15:0]  io_out_rx_info_tlen,
  output [5:0]   io_out_rx_info_qid,
  output [31:0]  io_out_rx_info_ip_chksum,
  output [31:0]  io_out_rx_info_tcp_chksum,
  output [7:0]   io_out_extern_config_c2h_match_op
);
`ifdef RANDOMIZE_REG_INIT
  reg [607:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  re_handler_clock; // @[RxRESearcher.scala 79:26]
  wire  re_handler_reset; // @[RxRESearcher.scala 79:26]
  wire [7:0] re_handler_io_in_char; // @[RxRESearcher.scala 79:26]
  wire [3:0] re_handler_io_in_state; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_0; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_1; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_2; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_3; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_4; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_5; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_6; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_7; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_8; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_9; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_10; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_11; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_12; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_13; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_14; // @[RxRESearcher.scala 79:26]
  wire [31:0] re_handler_io_in_rule_15; // @[RxRESearcher.scala 79:26]
  wire  re_handler_io_in_en; // @[RxRESearcher.scala 79:26]
  wire [3:0] re_handler_io_out_state; // @[RxRESearcher.scala 79:26]
  wire  in_shake_hand = io_in_tready & io_in_tvalid; // @[RxPipelineHandler.scala 12:38]
  wire  out_shake_hand = io_out_tready & io_out_tvalid; // @[RxPipelineHandler.scala 13:38]
  wire [600:0] _in_reg_T_1 = {io_in_rx_info_tlen,io_in_rx_info_qid,io_in_rx_info_ip_chksum,io_in_rx_info_tcp_chksum,
    io_in_tuser,io_in_tdata,io_in_tvalid,io_in_tlast}; // @[Cat.scala 31:58]
  reg [600:0] in_reg_r; // @[Reg.scala 28:20]
  wire  in_reg_tlast = in_reg_r[0]; // @[RxPipelineHandler.scala 14:128]
  wire  in_reg_tvalid = in_reg_r[1]; // @[RxPipelineHandler.scala 14:128]
  wire [511:0] in_reg_tdata = in_reg_r[513:2]; // @[RxPipelineHandler.scala 14:128]
  wire [5:0] in_reg_rx_info_qid = in_reg_r[584:579]; // @[RxPipelineHandler.scala 14:128]
  reg  first_beat_reg; // @[Reg.scala 28:20]
  wire  _GEN_1 = in_shake_hand ? in_reg_tlast : first_beat_reg; // @[Reg.scala 29:18 28:20 29:22]
  reg  in_reg_used_reg; // @[RxPipelineHandler.scala 18:32]
  wire  _GEN_2 = out_shake_hand ? 1'h0 : in_reg_used_reg; // @[RxPipelineHandler.scala 21:29 22:21 18:32]
  wire  _GEN_3 = in_shake_hand | _GEN_2; // @[RxPipelineHandler.scala 19:23 20:21]
  wire  _io_out_tvalid_T = in_reg_tvalid & in_reg_used_reg; // @[RxPipelineHandler.scala 27:47]
  wire  _io_in_tready_T = ~in_reg_used_reg; // @[RxPipelineHandler.scala 30:49]
  reg [7:0] beat_counter_reg; // @[RxRESearcher.scala 67:33]
  reg  match_wait_reg; // @[RxRESearcher.scala 68:31]
  wire  cur_beat_done = beat_counter_reg == 8'h3f; // @[RxRESearcher.scala 70:41]
  wire [7:0] data_vec_0 = in_reg_tdata[7:0]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_1 = in_reg_tdata[15:8]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_2 = in_reg_tdata[23:16]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_3 = in_reg_tdata[31:24]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_4 = in_reg_tdata[39:32]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_5 = in_reg_tdata[47:40]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_6 = in_reg_tdata[55:48]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_7 = in_reg_tdata[63:56]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_8 = in_reg_tdata[71:64]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_9 = in_reg_tdata[79:72]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_10 = in_reg_tdata[87:80]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_11 = in_reg_tdata[95:88]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_12 = in_reg_tdata[103:96]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_13 = in_reg_tdata[111:104]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_14 = in_reg_tdata[119:112]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_15 = in_reg_tdata[127:120]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_16 = in_reg_tdata[135:128]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_17 = in_reg_tdata[143:136]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_18 = in_reg_tdata[151:144]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_19 = in_reg_tdata[159:152]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_20 = in_reg_tdata[167:160]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_21 = in_reg_tdata[175:168]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_22 = in_reg_tdata[183:176]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_23 = in_reg_tdata[191:184]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_24 = in_reg_tdata[199:192]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_25 = in_reg_tdata[207:200]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_26 = in_reg_tdata[215:208]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_27 = in_reg_tdata[223:216]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_28 = in_reg_tdata[231:224]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_29 = in_reg_tdata[239:232]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_30 = in_reg_tdata[247:240]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_31 = in_reg_tdata[255:248]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_32 = in_reg_tdata[263:256]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_33 = in_reg_tdata[271:264]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_34 = in_reg_tdata[279:272]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_35 = in_reg_tdata[287:280]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_36 = in_reg_tdata[295:288]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_37 = in_reg_tdata[303:296]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_38 = in_reg_tdata[311:304]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_39 = in_reg_tdata[319:312]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_40 = in_reg_tdata[327:320]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_41 = in_reg_tdata[335:328]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_42 = in_reg_tdata[343:336]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_43 = in_reg_tdata[351:344]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_44 = in_reg_tdata[359:352]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_45 = in_reg_tdata[367:360]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_46 = in_reg_tdata[375:368]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_47 = in_reg_tdata[383:376]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_48 = in_reg_tdata[391:384]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_49 = in_reg_tdata[399:392]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_50 = in_reg_tdata[407:400]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_51 = in_reg_tdata[415:408]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_52 = in_reg_tdata[423:416]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_53 = in_reg_tdata[431:424]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_54 = in_reg_tdata[439:432]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_55 = in_reg_tdata[447:440]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_56 = in_reg_tdata[455:448]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_57 = in_reg_tdata[463:456]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_58 = in_reg_tdata[471:464]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_59 = in_reg_tdata[479:472]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_60 = in_reg_tdata[487:480]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_61 = in_reg_tdata[495:488]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_62 = in_reg_tdata[503:496]; // @[RxRESearcher.scala 75:32]
  wire [7:0] data_vec_63 = in_reg_tdata[511:504]; // @[RxRESearcher.scala 75:32]
  wire  _input_data_T = ~match_wait_reg; // @[RxRESearcher.scala 77:40]
  wire [7:0] _input_data_T_4 = beat_counter_reg + 8'h1; // @[RxRESearcher.scala 77:109]
  wire [7:0] _GEN_5 = 6'h1 == beat_counter_reg[5:0] ? data_vec_1 : data_vec_0; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_6 = 6'h2 == beat_counter_reg[5:0] ? data_vec_2 : _GEN_5; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_7 = 6'h3 == beat_counter_reg[5:0] ? data_vec_3 : _GEN_6; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_8 = 6'h4 == beat_counter_reg[5:0] ? data_vec_4 : _GEN_7; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_9 = 6'h5 == beat_counter_reg[5:0] ? data_vec_5 : _GEN_8; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_10 = 6'h6 == beat_counter_reg[5:0] ? data_vec_6 : _GEN_9; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_11 = 6'h7 == beat_counter_reg[5:0] ? data_vec_7 : _GEN_10; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_12 = 6'h8 == beat_counter_reg[5:0] ? data_vec_8 : _GEN_11; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_13 = 6'h9 == beat_counter_reg[5:0] ? data_vec_9 : _GEN_12; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_14 = 6'ha == beat_counter_reg[5:0] ? data_vec_10 : _GEN_13; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_15 = 6'hb == beat_counter_reg[5:0] ? data_vec_11 : _GEN_14; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_16 = 6'hc == beat_counter_reg[5:0] ? data_vec_12 : _GEN_15; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_17 = 6'hd == beat_counter_reg[5:0] ? data_vec_13 : _GEN_16; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_18 = 6'he == beat_counter_reg[5:0] ? data_vec_14 : _GEN_17; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_19 = 6'hf == beat_counter_reg[5:0] ? data_vec_15 : _GEN_18; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_20 = 6'h10 == beat_counter_reg[5:0] ? data_vec_16 : _GEN_19; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_21 = 6'h11 == beat_counter_reg[5:0] ? data_vec_17 : _GEN_20; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_22 = 6'h12 == beat_counter_reg[5:0] ? data_vec_18 : _GEN_21; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_23 = 6'h13 == beat_counter_reg[5:0] ? data_vec_19 : _GEN_22; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_24 = 6'h14 == beat_counter_reg[5:0] ? data_vec_20 : _GEN_23; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_25 = 6'h15 == beat_counter_reg[5:0] ? data_vec_21 : _GEN_24; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_26 = 6'h16 == beat_counter_reg[5:0] ? data_vec_22 : _GEN_25; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_27 = 6'h17 == beat_counter_reg[5:0] ? data_vec_23 : _GEN_26; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_28 = 6'h18 == beat_counter_reg[5:0] ? data_vec_24 : _GEN_27; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_29 = 6'h19 == beat_counter_reg[5:0] ? data_vec_25 : _GEN_28; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_30 = 6'h1a == beat_counter_reg[5:0] ? data_vec_26 : _GEN_29; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_31 = 6'h1b == beat_counter_reg[5:0] ? data_vec_27 : _GEN_30; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_32 = 6'h1c == beat_counter_reg[5:0] ? data_vec_28 : _GEN_31; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_33 = 6'h1d == beat_counter_reg[5:0] ? data_vec_29 : _GEN_32; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_34 = 6'h1e == beat_counter_reg[5:0] ? data_vec_30 : _GEN_33; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_35 = 6'h1f == beat_counter_reg[5:0] ? data_vec_31 : _GEN_34; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_36 = 6'h20 == beat_counter_reg[5:0] ? data_vec_32 : _GEN_35; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_37 = 6'h21 == beat_counter_reg[5:0] ? data_vec_33 : _GEN_36; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_38 = 6'h22 == beat_counter_reg[5:0] ? data_vec_34 : _GEN_37; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_39 = 6'h23 == beat_counter_reg[5:0] ? data_vec_35 : _GEN_38; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_40 = 6'h24 == beat_counter_reg[5:0] ? data_vec_36 : _GEN_39; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_41 = 6'h25 == beat_counter_reg[5:0] ? data_vec_37 : _GEN_40; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_42 = 6'h26 == beat_counter_reg[5:0] ? data_vec_38 : _GEN_41; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_43 = 6'h27 == beat_counter_reg[5:0] ? data_vec_39 : _GEN_42; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_44 = 6'h28 == beat_counter_reg[5:0] ? data_vec_40 : _GEN_43; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_45 = 6'h29 == beat_counter_reg[5:0] ? data_vec_41 : _GEN_44; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_46 = 6'h2a == beat_counter_reg[5:0] ? data_vec_42 : _GEN_45; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_47 = 6'h2b == beat_counter_reg[5:0] ? data_vec_43 : _GEN_46; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_48 = 6'h2c == beat_counter_reg[5:0] ? data_vec_44 : _GEN_47; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_49 = 6'h2d == beat_counter_reg[5:0] ? data_vec_45 : _GEN_48; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_50 = 6'h2e == beat_counter_reg[5:0] ? data_vec_46 : _GEN_49; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_51 = 6'h2f == beat_counter_reg[5:0] ? data_vec_47 : _GEN_50; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_52 = 6'h30 == beat_counter_reg[5:0] ? data_vec_48 : _GEN_51; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_53 = 6'h31 == beat_counter_reg[5:0] ? data_vec_49 : _GEN_52; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_54 = 6'h32 == beat_counter_reg[5:0] ? data_vec_50 : _GEN_53; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_55 = 6'h33 == beat_counter_reg[5:0] ? data_vec_51 : _GEN_54; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_56 = 6'h34 == beat_counter_reg[5:0] ? data_vec_52 : _GEN_55; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_57 = 6'h35 == beat_counter_reg[5:0] ? data_vec_53 : _GEN_56; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_58 = 6'h36 == beat_counter_reg[5:0] ? data_vec_54 : _GEN_57; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_59 = 6'h37 == beat_counter_reg[5:0] ? data_vec_55 : _GEN_58; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_60 = 6'h38 == beat_counter_reg[5:0] ? data_vec_56 : _GEN_59; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_61 = 6'h39 == beat_counter_reg[5:0] ? data_vec_57 : _GEN_60; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_62 = 6'h3a == beat_counter_reg[5:0] ? data_vec_58 : _GEN_61; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_63 = 6'h3b == beat_counter_reg[5:0] ? data_vec_59 : _GEN_62; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_64 = 6'h3c == beat_counter_reg[5:0] ? data_vec_60 : _GEN_63; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_65 = 6'h3d == beat_counter_reg[5:0] ? data_vec_61 : _GEN_64; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_66 = 6'h3e == beat_counter_reg[5:0] ? data_vec_62 : _GEN_65; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_67 = 6'h3f == beat_counter_reg[5:0] ? data_vec_63 : _GEN_66; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_69 = 6'h1 == _input_data_T_4[5:0] ? data_vec_1 : data_vec_0; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_70 = 6'h2 == _input_data_T_4[5:0] ? data_vec_2 : _GEN_69; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_71 = 6'h3 == _input_data_T_4[5:0] ? data_vec_3 : _GEN_70; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_72 = 6'h4 == _input_data_T_4[5:0] ? data_vec_4 : _GEN_71; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_73 = 6'h5 == _input_data_T_4[5:0] ? data_vec_5 : _GEN_72; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_74 = 6'h6 == _input_data_T_4[5:0] ? data_vec_6 : _GEN_73; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_75 = 6'h7 == _input_data_T_4[5:0] ? data_vec_7 : _GEN_74; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_76 = 6'h8 == _input_data_T_4[5:0] ? data_vec_8 : _GEN_75; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_77 = 6'h9 == _input_data_T_4[5:0] ? data_vec_9 : _GEN_76; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_78 = 6'ha == _input_data_T_4[5:0] ? data_vec_10 : _GEN_77; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_79 = 6'hb == _input_data_T_4[5:0] ? data_vec_11 : _GEN_78; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_80 = 6'hc == _input_data_T_4[5:0] ? data_vec_12 : _GEN_79; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_81 = 6'hd == _input_data_T_4[5:0] ? data_vec_13 : _GEN_80; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_82 = 6'he == _input_data_T_4[5:0] ? data_vec_14 : _GEN_81; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_83 = 6'hf == _input_data_T_4[5:0] ? data_vec_15 : _GEN_82; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_84 = 6'h10 == _input_data_T_4[5:0] ? data_vec_16 : _GEN_83; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_85 = 6'h11 == _input_data_T_4[5:0] ? data_vec_17 : _GEN_84; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_86 = 6'h12 == _input_data_T_4[5:0] ? data_vec_18 : _GEN_85; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_87 = 6'h13 == _input_data_T_4[5:0] ? data_vec_19 : _GEN_86; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_88 = 6'h14 == _input_data_T_4[5:0] ? data_vec_20 : _GEN_87; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_89 = 6'h15 == _input_data_T_4[5:0] ? data_vec_21 : _GEN_88; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_90 = 6'h16 == _input_data_T_4[5:0] ? data_vec_22 : _GEN_89; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_91 = 6'h17 == _input_data_T_4[5:0] ? data_vec_23 : _GEN_90; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_92 = 6'h18 == _input_data_T_4[5:0] ? data_vec_24 : _GEN_91; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_93 = 6'h19 == _input_data_T_4[5:0] ? data_vec_25 : _GEN_92; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_94 = 6'h1a == _input_data_T_4[5:0] ? data_vec_26 : _GEN_93; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_95 = 6'h1b == _input_data_T_4[5:0] ? data_vec_27 : _GEN_94; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_96 = 6'h1c == _input_data_T_4[5:0] ? data_vec_28 : _GEN_95; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_97 = 6'h1d == _input_data_T_4[5:0] ? data_vec_29 : _GEN_96; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_98 = 6'h1e == _input_data_T_4[5:0] ? data_vec_30 : _GEN_97; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_99 = 6'h1f == _input_data_T_4[5:0] ? data_vec_31 : _GEN_98; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_100 = 6'h20 == _input_data_T_4[5:0] ? data_vec_32 : _GEN_99; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_101 = 6'h21 == _input_data_T_4[5:0] ? data_vec_33 : _GEN_100; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_102 = 6'h22 == _input_data_T_4[5:0] ? data_vec_34 : _GEN_101; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_103 = 6'h23 == _input_data_T_4[5:0] ? data_vec_35 : _GEN_102; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_104 = 6'h24 == _input_data_T_4[5:0] ? data_vec_36 : _GEN_103; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_105 = 6'h25 == _input_data_T_4[5:0] ? data_vec_37 : _GEN_104; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_106 = 6'h26 == _input_data_T_4[5:0] ? data_vec_38 : _GEN_105; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_107 = 6'h27 == _input_data_T_4[5:0] ? data_vec_39 : _GEN_106; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_108 = 6'h28 == _input_data_T_4[5:0] ? data_vec_40 : _GEN_107; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_109 = 6'h29 == _input_data_T_4[5:0] ? data_vec_41 : _GEN_108; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_110 = 6'h2a == _input_data_T_4[5:0] ? data_vec_42 : _GEN_109; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_111 = 6'h2b == _input_data_T_4[5:0] ? data_vec_43 : _GEN_110; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_112 = 6'h2c == _input_data_T_4[5:0] ? data_vec_44 : _GEN_111; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_113 = 6'h2d == _input_data_T_4[5:0] ? data_vec_45 : _GEN_112; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_114 = 6'h2e == _input_data_T_4[5:0] ? data_vec_46 : _GEN_113; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_115 = 6'h2f == _input_data_T_4[5:0] ? data_vec_47 : _GEN_114; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_116 = 6'h30 == _input_data_T_4[5:0] ? data_vec_48 : _GEN_115; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_117 = 6'h31 == _input_data_T_4[5:0] ? data_vec_49 : _GEN_116; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_118 = 6'h32 == _input_data_T_4[5:0] ? data_vec_50 : _GEN_117; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_119 = 6'h33 == _input_data_T_4[5:0] ? data_vec_51 : _GEN_118; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_120 = 6'h34 == _input_data_T_4[5:0] ? data_vec_52 : _GEN_119; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_121 = 6'h35 == _input_data_T_4[5:0] ? data_vec_53 : _GEN_120; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_122 = 6'h36 == _input_data_T_4[5:0] ? data_vec_54 : _GEN_121; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_123 = 6'h37 == _input_data_T_4[5:0] ? data_vec_55 : _GEN_122; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_124 = 6'h38 == _input_data_T_4[5:0] ? data_vec_56 : _GEN_123; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_125 = 6'h39 == _input_data_T_4[5:0] ? data_vec_57 : _GEN_124; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_126 = 6'h3a == _input_data_T_4[5:0] ? data_vec_58 : _GEN_125; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_127 = 6'h3b == _input_data_T_4[5:0] ? data_vec_59 : _GEN_126; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_128 = 6'h3c == _input_data_T_4[5:0] ? data_vec_60 : _GEN_127; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_129 = 6'h3d == _input_data_T_4[5:0] ? data_vec_61 : _GEN_128; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_130 = 6'h3e == _input_data_T_4[5:0] ? data_vec_62 : _GEN_129; // @[RxRESearcher.scala 77:{23,23}]
  wire [7:0] _GEN_131 = 6'h3f == _input_data_T_4[5:0] ? data_vec_63 : _GEN_130; // @[RxRESearcher.scala 77:{23,23}]
  wire  match_found = re_handler_io_out_state == 4'hf; // @[RxRESearcher.scala 81:46]
  wire  _cur_state_T_2 = in_shake_hand & in_reg_tlast; // @[RxRESearcher.scala 83:75]
  wire  _GEN_134 = _input_data_T | match_wait_reg; // @[RxRESearcher.scala 100:20 68:31 99:31]
  wire [5:0] _io_out_rx_info_qid_T = match_found ? 6'h1 : in_reg_rx_info_qid; // @[RxRESearcher.scala 106:30]
  REHandler re_handler ( // @[RxRESearcher.scala 79:26]
    .clock(re_handler_clock),
    .reset(re_handler_reset),
    .io_in_char(re_handler_io_in_char),
    .io_in_state(re_handler_io_in_state),
    .io_in_rule_0(re_handler_io_in_rule_0),
    .io_in_rule_1(re_handler_io_in_rule_1),
    .io_in_rule_2(re_handler_io_in_rule_2),
    .io_in_rule_3(re_handler_io_in_rule_3),
    .io_in_rule_4(re_handler_io_in_rule_4),
    .io_in_rule_5(re_handler_io_in_rule_5),
    .io_in_rule_6(re_handler_io_in_rule_6),
    .io_in_rule_7(re_handler_io_in_rule_7),
    .io_in_rule_8(re_handler_io_in_rule_8),
    .io_in_rule_9(re_handler_io_in_rule_9),
    .io_in_rule_10(re_handler_io_in_rule_10),
    .io_in_rule_11(re_handler_io_in_rule_11),
    .io_in_rule_12(re_handler_io_in_rule_12),
    .io_in_rule_13(re_handler_io_in_rule_13),
    .io_in_rule_14(re_handler_io_in_rule_14),
    .io_in_rule_15(re_handler_io_in_rule_15),
    .io_in_en(re_handler_io_in_en),
    .io_out_state(re_handler_io_out_state)
  );
  assign io_in_tready = io_in_extern_config_c2h_match_op[7] ? out_shake_hand | _io_in_tready_T : io_out_tready | ~
    in_reg_used_reg; // @[RxRESearcher.scala 105:45 107:18 RxPipelineHandler.scala 30:18]
  assign io_out_tdata = in_reg_r[513:2]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_tvalid = io_in_extern_config_c2h_match_op[7] ? _io_out_tvalid_T & (cur_beat_done | match_found) :
    in_reg_tvalid & in_reg_used_reg; // @[RxRESearcher.scala 105:45 108:19 RxPipelineHandler.scala 27:18]
  assign io_out_tlast = in_reg_r[0]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_tuser = in_reg_r[514]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_tlen = in_reg_r[600:585]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_qid = io_in_extern_config_c2h_match_op[7] ? _io_out_rx_info_qid_T : in_reg_rx_info_qid; // @[RxRESearcher.scala 105:45 106:24 RxPipelineHandler.scala 29:18]
  assign io_out_rx_info_ip_chksum = in_reg_r[578:547]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_tcp_chksum = in_reg_r[546:515]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_extern_config_c2h_match_op = io_in_extern_config_c2h_match_op; // @[RxPipelineHandler.scala 31:24]
  assign re_handler_clock = clock;
  assign re_handler_reset = reset;
  assign re_handler_io_in_char = cur_beat_done | ~match_wait_reg ? _GEN_67 : _GEN_131; // @[RxRESearcher.scala 77:23]
  assign re_handler_io_in_state = first_beat_reg & _input_data_T | in_shake_hand & in_reg_tlast ? 4'h0 :
    re_handler_io_out_state; // @[RxRESearcher.scala 83:22]
  assign re_handler_io_in_rule_0 = io_in_extern_config_c2h_match_arg_0; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_1 = io_in_extern_config_c2h_match_arg_1; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_2 = io_in_extern_config_c2h_match_arg_2; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_3 = io_in_extern_config_c2h_match_arg_3; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_4 = io_in_extern_config_c2h_match_arg_4; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_5 = io_in_extern_config_c2h_match_arg_5; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_6 = io_in_extern_config_c2h_match_arg_6; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_7 = io_in_extern_config_c2h_match_arg_7; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_8 = io_in_extern_config_c2h_match_arg_8; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_9 = io_in_extern_config_c2h_match_arg_9; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_10 = io_in_extern_config_c2h_match_arg_10; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_11 = io_in_extern_config_c2h_match_arg_11; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_12 = io_in_extern_config_c2h_match_arg_12; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_13 = io_in_extern_config_c2h_match_arg_13; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_14 = io_in_extern_config_c2h_match_arg_14; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_rule_15 = io_in_extern_config_c2h_match_arg_15; // @[RxRESearcher.scala 87:25]
  assign re_handler_io_in_en = ~cur_beat_done | _cur_state_T_2; // @[RxRESearcher.scala 90:41]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 28:20]
      in_reg_r <= 601'h1; // @[Reg.scala 28:20]
    end else if (in_shake_hand) begin // @[Reg.scala 29:18]
      in_reg_r <= _in_reg_T_1; // @[Reg.scala 29:22]
    end
    first_beat_reg <= reset | _GEN_1; // @[Reg.scala 28:{20,20}]
    if (reset) begin // @[RxPipelineHandler.scala 18:32]
      in_reg_used_reg <= 1'h0; // @[RxPipelineHandler.scala 18:32]
    end else begin
      in_reg_used_reg <= _GEN_3;
    end
    if (reset) begin // @[RxRESearcher.scala 67:33]
      beat_counter_reg <= 8'h0; // @[RxRESearcher.scala 67:33]
    end else if (in_shake_hand) begin // @[RxRESearcher.scala 92:23]
      beat_counter_reg <= 8'h0; // @[RxRESearcher.scala 93:22]
    end else if (!(_input_data_T)) begin // @[RxRESearcher.scala 99:31]
      if (beat_counter_reg < 8'h3f) begin // @[RxRESearcher.scala 101:54]
        beat_counter_reg <= _input_data_T_4; // @[RxRESearcher.scala 102:22]
      end
    end
    if (reset) begin // @[RxRESearcher.scala 68:31]
      match_wait_reg <= 1'h0; // @[RxRESearcher.scala 68:31]
    end else if (in_shake_hand) begin // @[RxRESearcher.scala 92:23]
      if (in_reg_tlast) begin // @[RxRESearcher.scala 94:24]
        match_wait_reg <= 1'h0; // @[RxRESearcher.scala 95:22]
      end else begin
        match_wait_reg <= match_found; // @[RxRESearcher.scala 97:22]
      end
    end else begin
      match_wait_reg <= _GEN_134;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {19{`RANDOM}};
  in_reg_r = _RAND_0[600:0];
  _RAND_1 = {1{`RANDOM}};
  first_beat_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  in_reg_used_reg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  beat_counter_reg = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  match_wait_reg = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RxChksumVerifier(
  input          clock,
  input          reset,
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input          io_in_tuser,
  input  [15:0]  io_in_rx_info_tlen,
  input  [7:0]   io_in_extern_config_c2h_match_op,
  input  [31:0]  io_in_extern_config_c2h_match_arg_0,
  input  [31:0]  io_in_extern_config_c2h_match_arg_1,
  input  [31:0]  io_in_extern_config_c2h_match_arg_2,
  input  [31:0]  io_in_extern_config_c2h_match_arg_3,
  input  [31:0]  io_in_extern_config_c2h_match_arg_4,
  input  [31:0]  io_in_extern_config_c2h_match_arg_5,
  input  [31:0]  io_in_extern_config_c2h_match_arg_6,
  input  [31:0]  io_in_extern_config_c2h_match_arg_7,
  input  [31:0]  io_in_extern_config_c2h_match_arg_8,
  input  [31:0]  io_in_extern_config_c2h_match_arg_9,
  input  [31:0]  io_in_extern_config_c2h_match_arg_10,
  input  [31:0]  io_in_extern_config_c2h_match_arg_11,
  input  [31:0]  io_in_extern_config_c2h_match_arg_12,
  input  [31:0]  io_in_extern_config_c2h_match_arg_13,
  input  [31:0]  io_in_extern_config_c2h_match_arg_14,
  input  [31:0]  io_in_extern_config_c2h_match_arg_15,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  output         io_out_tuser,
  output [15:0]  io_out_rx_info_tlen,
  output [5:0]   io_out_rx_info_qid,
  output [31:0]  io_out_rx_info_ip_chksum,
  output [31:0]  io_out_rx_info_tcp_chksum,
  output [7:0]   io_out_extern_config_c2h_match_op,
  output [31:0]  io_out_extern_config_c2h_match_arg_0,
  output [31:0]  io_out_extern_config_c2h_match_arg_1,
  output [31:0]  io_out_extern_config_c2h_match_arg_2,
  output [31:0]  io_out_extern_config_c2h_match_arg_3,
  output [31:0]  io_out_extern_config_c2h_match_arg_4,
  output [31:0]  io_out_extern_config_c2h_match_arg_5,
  output [31:0]  io_out_extern_config_c2h_match_arg_6,
  output [31:0]  io_out_extern_config_c2h_match_arg_7,
  output [31:0]  io_out_extern_config_c2h_match_arg_8,
  output [31:0]  io_out_extern_config_c2h_match_arg_9,
  output [31:0]  io_out_extern_config_c2h_match_arg_10,
  output [31:0]  io_out_extern_config_c2h_match_arg_11,
  output [31:0]  io_out_extern_config_c2h_match_arg_12,
  output [31:0]  io_out_extern_config_c2h_match_arg_13,
  output [31:0]  io_out_extern_config_c2h_match_arg_14,
  output [31:0]  io_out_extern_config_c2h_match_arg_15
);
`ifdef RANDOMIZE_REG_INIT
  reg [607:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  ip_chksum_cal_clock; // @[RxPipelineHandler.scala 41:29]
  wire [31:0] ip_chksum_cal_io_in_vec_0; // @[RxPipelineHandler.scala 41:29]
  wire [31:0] ip_chksum_cal_io_in_vec_1; // @[RxPipelineHandler.scala 41:29]
  wire [31:0] ip_chksum_cal_io_in_vec_2; // @[RxPipelineHandler.scala 41:29]
  wire [31:0] ip_chksum_cal_io_in_vec_3; // @[RxPipelineHandler.scala 41:29]
  wire [31:0] ip_chksum_cal_io_in_vec_4; // @[RxPipelineHandler.scala 41:29]
  wire [31:0] ip_chksum_cal_io_in_vec_5; // @[RxPipelineHandler.scala 41:29]
  wire [31:0] ip_chksum_cal_io_in_vec_6; // @[RxPipelineHandler.scala 41:29]
  wire [31:0] ip_chksum_cal_io_in_vec_7; // @[RxPipelineHandler.scala 41:29]
  wire [31:0] ip_chksum_cal_io_in_vec_8; // @[RxPipelineHandler.scala 41:29]
  wire [31:0] ip_chksum_cal_io_in_vec_9; // @[RxPipelineHandler.scala 41:29]
  wire [31:0] ip_chksum_cal_io_out_sum; // @[RxPipelineHandler.scala 41:29]
  wire  tcp_pld_chksum_cal_clock; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_0; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_1; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_2; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_3; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_4; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_5; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_6; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_7; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_8; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_9; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_10; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_11; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_12; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_13; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_14; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_15; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_16; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_17; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_18; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_19; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_20; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_21; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_22; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_23; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_24; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_25; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_26; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_27; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_28; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_29; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_30; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_in_vec_31; // @[RxPipelineHandler.scala 48:34]
  wire [31:0] tcp_pld_chksum_cal_io_out_sum; // @[RxPipelineHandler.scala 48:34]
  wire  tcp_hdr_chksum_cal_clock; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_0; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_1; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_2; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_3; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_4; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_5; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_6; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_7; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_8; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_9; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_10; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_11; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_12; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_13; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_14; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_15; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_16; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_17; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_18; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_19; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_20; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_21; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_22; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_23; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_24; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_25; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_26; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_27; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_28; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_29; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_30; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_in_vec_31; // @[RxPipelineHandler.scala 55:34]
  wire [31:0] tcp_hdr_chksum_cal_io_out_sum; // @[RxPipelineHandler.scala 55:34]
  wire  in_shake_hand = io_in_tready & io_in_tvalid; // @[RxPipelineHandler.scala 12:38]
  wire  out_shake_hand = io_out_tready & io_out_tvalid; // @[RxPipelineHandler.scala 13:38]
  wire [600:0] _in_reg_T_1 = {io_in_rx_info_tlen,6'h0,64'h0,io_in_tuser,io_in_tdata,io_in_tvalid,io_in_tlast}; // @[Cat.scala 31:58]
  reg [600:0] in_reg_r; // @[Reg.scala 28:20]
  wire  in_reg_tlast = in_reg_r[0]; // @[RxPipelineHandler.scala 14:128]
  wire  in_reg_tvalid = in_reg_r[1]; // @[RxPipelineHandler.scala 14:128]
  wire [511:0] in_reg_tdata = in_reg_r[513:2]; // @[RxPipelineHandler.scala 14:128]
  reg  first_beat_reg; // @[Reg.scala 28:20]
  wire  _GEN_1 = in_shake_hand ? in_reg_tlast : first_beat_reg; // @[Reg.scala 29:18 28:20 29:22]
  reg  in_reg_used_reg; // @[RxPipelineHandler.scala 18:32]
  wire  _GEN_2 = out_shake_hand ? 1'h0 : in_reg_used_reg; // @[RxPipelineHandler.scala 21:29 22:21 18:32]
  wire  _GEN_3 = in_shake_hand | _GEN_2; // @[RxPipelineHandler.scala 19:23 20:21]
  wire [511:0] cal_tdata = in_shake_hand ? io_in_tdata : in_reg_tdata; // @[RxPipelineHandler.scala 39:20]
  wire [15:0] _ip_chksum_cal_io_in_vec_0_T_3 = {cal_tdata[119:112],cal_tdata[127:120]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_1_T_3 = {cal_tdata[135:128],cal_tdata[143:136]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_2_T_3 = {cal_tdata[151:144],cal_tdata[159:152]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_3_T_3 = {cal_tdata[167:160],cal_tdata[175:168]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_4_T_3 = {cal_tdata[183:176],cal_tdata[191:184]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_5_T_3 = {cal_tdata[199:192],cal_tdata[207:200]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_6_T_3 = {cal_tdata[215:208],cal_tdata[223:216]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_7_T_3 = {cal_tdata[231:224],cal_tdata[239:232]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_8_T_3 = {cal_tdata[247:240],cal_tdata[255:248]}; // @[Cat.scala 31:58]
  wire [15:0] _ip_chksum_cal_io_in_vec_9_T_3 = {cal_tdata[263:256],cal_tdata[271:264]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_0_T_3 = {cal_tdata[7:0],cal_tdata[15:8]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_1_T_3 = {cal_tdata[23:16],cal_tdata[31:24]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_2_T_3 = {cal_tdata[39:32],cal_tdata[47:40]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_3_T_3 = {cal_tdata[55:48],cal_tdata[63:56]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_4_T_3 = {cal_tdata[71:64],cal_tdata[79:72]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_5_T_3 = {cal_tdata[87:80],cal_tdata[95:88]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_6_T_3 = {cal_tdata[103:96],cal_tdata[111:104]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_17_T_3 = {cal_tdata[279:272],cal_tdata[287:280]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_18_T_3 = {cal_tdata[295:288],cal_tdata[303:296]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_19_T_3 = {cal_tdata[311:304],cal_tdata[319:312]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_20_T_3 = {cal_tdata[327:320],cal_tdata[335:328]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_21_T_3 = {cal_tdata[343:336],cal_tdata[351:344]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_22_T_3 = {cal_tdata[359:352],cal_tdata[367:360]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_23_T_3 = {cal_tdata[375:368],cal_tdata[383:376]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_24_T_3 = {cal_tdata[391:384],cal_tdata[399:392]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_25_T_3 = {cal_tdata[407:400],cal_tdata[415:408]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_26_T_3 = {cal_tdata[423:416],cal_tdata[431:424]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_27_T_3 = {cal_tdata[439:432],cal_tdata[447:440]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_28_T_3 = {cal_tdata[455:448],cal_tdata[463:456]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_29_T_3 = {cal_tdata[471:464],cal_tdata[479:472]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_30_T_3 = {cal_tdata[487:480],cal_tdata[495:488]}; // @[Cat.scala 31:58]
  wire [15:0] _tcp_pld_chksum_cal_io_in_vec_31_T_3 = {cal_tdata[503:496],cal_tdata[511:504]}; // @[Cat.scala 31:58]
  wire [31:0] tcp_hdr_chksum_result = tcp_hdr_chksum_cal_io_out_sum - 32'h14; // @[RxPipelineHandler.scala 61:61]
  reg [31:0] cal_ip_chksum_reg; // @[RxPipelineHandler.scala 63:34]
  reg [31:0] cal_tcp_chksum_reg; // @[RxPipelineHandler.scala 64:35]
  wire [31:0] _cal_tcp_chksum_reg_T_1 = cal_tcp_chksum_reg + tcp_pld_chksum_cal_io_out_sum; // @[RxPipelineHandler.scala 71:48]
  ReduceAddSync ip_chksum_cal ( // @[RxPipelineHandler.scala 41:29]
    .clock(ip_chksum_cal_clock),
    .io_in_vec_0(ip_chksum_cal_io_in_vec_0),
    .io_in_vec_1(ip_chksum_cal_io_in_vec_1),
    .io_in_vec_2(ip_chksum_cal_io_in_vec_2),
    .io_in_vec_3(ip_chksum_cal_io_in_vec_3),
    .io_in_vec_4(ip_chksum_cal_io_in_vec_4),
    .io_in_vec_5(ip_chksum_cal_io_in_vec_5),
    .io_in_vec_6(ip_chksum_cal_io_in_vec_6),
    .io_in_vec_7(ip_chksum_cal_io_in_vec_7),
    .io_in_vec_8(ip_chksum_cal_io_in_vec_8),
    .io_in_vec_9(ip_chksum_cal_io_in_vec_9),
    .io_out_sum(ip_chksum_cal_io_out_sum)
  );
  ReduceAddSync_1 tcp_pld_chksum_cal ( // @[RxPipelineHandler.scala 48:34]
    .clock(tcp_pld_chksum_cal_clock),
    .io_in_vec_0(tcp_pld_chksum_cal_io_in_vec_0),
    .io_in_vec_1(tcp_pld_chksum_cal_io_in_vec_1),
    .io_in_vec_2(tcp_pld_chksum_cal_io_in_vec_2),
    .io_in_vec_3(tcp_pld_chksum_cal_io_in_vec_3),
    .io_in_vec_4(tcp_pld_chksum_cal_io_in_vec_4),
    .io_in_vec_5(tcp_pld_chksum_cal_io_in_vec_5),
    .io_in_vec_6(tcp_pld_chksum_cal_io_in_vec_6),
    .io_in_vec_7(tcp_pld_chksum_cal_io_in_vec_7),
    .io_in_vec_8(tcp_pld_chksum_cal_io_in_vec_8),
    .io_in_vec_9(tcp_pld_chksum_cal_io_in_vec_9),
    .io_in_vec_10(tcp_pld_chksum_cal_io_in_vec_10),
    .io_in_vec_11(tcp_pld_chksum_cal_io_in_vec_11),
    .io_in_vec_12(tcp_pld_chksum_cal_io_in_vec_12),
    .io_in_vec_13(tcp_pld_chksum_cal_io_in_vec_13),
    .io_in_vec_14(tcp_pld_chksum_cal_io_in_vec_14),
    .io_in_vec_15(tcp_pld_chksum_cal_io_in_vec_15),
    .io_in_vec_16(tcp_pld_chksum_cal_io_in_vec_16),
    .io_in_vec_17(tcp_pld_chksum_cal_io_in_vec_17),
    .io_in_vec_18(tcp_pld_chksum_cal_io_in_vec_18),
    .io_in_vec_19(tcp_pld_chksum_cal_io_in_vec_19),
    .io_in_vec_20(tcp_pld_chksum_cal_io_in_vec_20),
    .io_in_vec_21(tcp_pld_chksum_cal_io_in_vec_21),
    .io_in_vec_22(tcp_pld_chksum_cal_io_in_vec_22),
    .io_in_vec_23(tcp_pld_chksum_cal_io_in_vec_23),
    .io_in_vec_24(tcp_pld_chksum_cal_io_in_vec_24),
    .io_in_vec_25(tcp_pld_chksum_cal_io_in_vec_25),
    .io_in_vec_26(tcp_pld_chksum_cal_io_in_vec_26),
    .io_in_vec_27(tcp_pld_chksum_cal_io_in_vec_27),
    .io_in_vec_28(tcp_pld_chksum_cal_io_in_vec_28),
    .io_in_vec_29(tcp_pld_chksum_cal_io_in_vec_29),
    .io_in_vec_30(tcp_pld_chksum_cal_io_in_vec_30),
    .io_in_vec_31(tcp_pld_chksum_cal_io_in_vec_31),
    .io_out_sum(tcp_pld_chksum_cal_io_out_sum)
  );
  ReduceAddSync_1 tcp_hdr_chksum_cal ( // @[RxPipelineHandler.scala 55:34]
    .clock(tcp_hdr_chksum_cal_clock),
    .io_in_vec_0(tcp_hdr_chksum_cal_io_in_vec_0),
    .io_in_vec_1(tcp_hdr_chksum_cal_io_in_vec_1),
    .io_in_vec_2(tcp_hdr_chksum_cal_io_in_vec_2),
    .io_in_vec_3(tcp_hdr_chksum_cal_io_in_vec_3),
    .io_in_vec_4(tcp_hdr_chksum_cal_io_in_vec_4),
    .io_in_vec_5(tcp_hdr_chksum_cal_io_in_vec_5),
    .io_in_vec_6(tcp_hdr_chksum_cal_io_in_vec_6),
    .io_in_vec_7(tcp_hdr_chksum_cal_io_in_vec_7),
    .io_in_vec_8(tcp_hdr_chksum_cal_io_in_vec_8),
    .io_in_vec_9(tcp_hdr_chksum_cal_io_in_vec_9),
    .io_in_vec_10(tcp_hdr_chksum_cal_io_in_vec_10),
    .io_in_vec_11(tcp_hdr_chksum_cal_io_in_vec_11),
    .io_in_vec_12(tcp_hdr_chksum_cal_io_in_vec_12),
    .io_in_vec_13(tcp_hdr_chksum_cal_io_in_vec_13),
    .io_in_vec_14(tcp_hdr_chksum_cal_io_in_vec_14),
    .io_in_vec_15(tcp_hdr_chksum_cal_io_in_vec_15),
    .io_in_vec_16(tcp_hdr_chksum_cal_io_in_vec_16),
    .io_in_vec_17(tcp_hdr_chksum_cal_io_in_vec_17),
    .io_in_vec_18(tcp_hdr_chksum_cal_io_in_vec_18),
    .io_in_vec_19(tcp_hdr_chksum_cal_io_in_vec_19),
    .io_in_vec_20(tcp_hdr_chksum_cal_io_in_vec_20),
    .io_in_vec_21(tcp_hdr_chksum_cal_io_in_vec_21),
    .io_in_vec_22(tcp_hdr_chksum_cal_io_in_vec_22),
    .io_in_vec_23(tcp_hdr_chksum_cal_io_in_vec_23),
    .io_in_vec_24(tcp_hdr_chksum_cal_io_in_vec_24),
    .io_in_vec_25(tcp_hdr_chksum_cal_io_in_vec_25),
    .io_in_vec_26(tcp_hdr_chksum_cal_io_in_vec_26),
    .io_in_vec_27(tcp_hdr_chksum_cal_io_in_vec_27),
    .io_in_vec_28(tcp_hdr_chksum_cal_io_in_vec_28),
    .io_in_vec_29(tcp_hdr_chksum_cal_io_in_vec_29),
    .io_in_vec_30(tcp_hdr_chksum_cal_io_in_vec_30),
    .io_in_vec_31(tcp_hdr_chksum_cal_io_in_vec_31),
    .io_out_sum(tcp_hdr_chksum_cal_io_out_sum)
  );
  assign io_in_tready = io_out_tready | ~in_reg_used_reg; // @[RxPipelineHandler.scala 30:47]
  assign io_out_tdata = in_reg_r[513:2]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_tvalid = in_reg_tvalid & in_reg_used_reg; // @[RxPipelineHandler.scala 27:47]
  assign io_out_tlast = in_reg_r[0]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_tuser = in_reg_r[514]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_tlen = in_reg_r[600:585]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_qid = in_reg_r[584:579]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_ip_chksum = first_beat_reg ? ip_chksum_cal_io_out_sum : cal_ip_chksum_reg; // @[RxPipelineHandler.scala 74:34]
  assign io_out_rx_info_tcp_chksum = first_beat_reg ? tcp_hdr_chksum_result : _cal_tcp_chksum_reg_T_1; // @[RxPipelineHandler.scala 75:35]
  assign io_out_extern_config_c2h_match_op = io_in_extern_config_c2h_match_op; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_0 = io_in_extern_config_c2h_match_arg_0; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_1 = io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_2 = io_in_extern_config_c2h_match_arg_2; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_3 = io_in_extern_config_c2h_match_arg_3; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_4 = io_in_extern_config_c2h_match_arg_4; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_5 = io_in_extern_config_c2h_match_arg_5; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_6 = io_in_extern_config_c2h_match_arg_6; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_7 = io_in_extern_config_c2h_match_arg_7; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_8 = io_in_extern_config_c2h_match_arg_8; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_9 = io_in_extern_config_c2h_match_arg_9; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_10 = io_in_extern_config_c2h_match_arg_10; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_11 = io_in_extern_config_c2h_match_arg_11; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_12 = io_in_extern_config_c2h_match_arg_12; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_13 = io_in_extern_config_c2h_match_arg_13; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_14 = io_in_extern_config_c2h_match_arg_14; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_15 = io_in_extern_config_c2h_match_arg_15; // @[RxPipelineHandler.scala 31:24]
  assign ip_chksum_cal_clock = clock;
  assign ip_chksum_cal_io_in_vec_0 = {{16'd0}, _ip_chksum_cal_io_in_vec_0_T_3}; // @[RxPipelineHandler.scala 43:32]
  assign ip_chksum_cal_io_in_vec_1 = {{16'd0}, _ip_chksum_cal_io_in_vec_1_T_3}; // @[RxPipelineHandler.scala 43:32]
  assign ip_chksum_cal_io_in_vec_2 = {{16'd0}, _ip_chksum_cal_io_in_vec_2_T_3}; // @[RxPipelineHandler.scala 43:32]
  assign ip_chksum_cal_io_in_vec_3 = {{16'd0}, _ip_chksum_cal_io_in_vec_3_T_3}; // @[RxPipelineHandler.scala 43:32]
  assign ip_chksum_cal_io_in_vec_4 = {{16'd0}, _ip_chksum_cal_io_in_vec_4_T_3}; // @[RxPipelineHandler.scala 43:32]
  assign ip_chksum_cal_io_in_vec_5 = {{16'd0}, _ip_chksum_cal_io_in_vec_5_T_3}; // @[RxPipelineHandler.scala 43:32]
  assign ip_chksum_cal_io_in_vec_6 = {{16'd0}, _ip_chksum_cal_io_in_vec_6_T_3}; // @[RxPipelineHandler.scala 43:32]
  assign ip_chksum_cal_io_in_vec_7 = {{16'd0}, _ip_chksum_cal_io_in_vec_7_T_3}; // @[RxPipelineHandler.scala 43:32]
  assign ip_chksum_cal_io_in_vec_8 = {{16'd0}, _ip_chksum_cal_io_in_vec_8_T_3}; // @[RxPipelineHandler.scala 43:32]
  assign ip_chksum_cal_io_in_vec_9 = {{16'd0}, _ip_chksum_cal_io_in_vec_9_T_3}; // @[RxPipelineHandler.scala 43:32]
  assign tcp_pld_chksum_cal_clock = clock;
  assign tcp_pld_chksum_cal_io_in_vec_0 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_0_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_1 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_1_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_2 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_2_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_3 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_3_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_4 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_4_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_5 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_5_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_6 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_6_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_7 = {{16'd0}, _ip_chksum_cal_io_in_vec_0_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_8 = {{16'd0}, _ip_chksum_cal_io_in_vec_1_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_9 = {{16'd0}, _ip_chksum_cal_io_in_vec_2_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_10 = {{16'd0}, _ip_chksum_cal_io_in_vec_3_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_11 = {{16'd0}, _ip_chksum_cal_io_in_vec_4_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_12 = {{16'd0}, _ip_chksum_cal_io_in_vec_5_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_13 = {{16'd0}, _ip_chksum_cal_io_in_vec_6_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_14 = {{16'd0}, _ip_chksum_cal_io_in_vec_7_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_15 = {{16'd0}, _ip_chksum_cal_io_in_vec_8_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_16 = {{16'd0}, _ip_chksum_cal_io_in_vec_9_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_17 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_17_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_18 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_18_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_19 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_19_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_20 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_20_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_21 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_21_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_22 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_22_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_23 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_23_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_24 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_24_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_25 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_25_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_26 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_26_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_27 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_27_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_28 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_28_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_29 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_29_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_30 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_30_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_pld_chksum_cal_io_in_vec_31 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_31_T_3}; // @[RxPipelineHandler.scala 50:37]
  assign tcp_hdr_chksum_cal_clock = clock;
  assign tcp_hdr_chksum_cal_io_in_vec_0 = 32'h0; // @[RxPipelineHandler.scala 59:42]
  assign tcp_hdr_chksum_cal_io_in_vec_1 = 32'h0; // @[RxPipelineHandler.scala 59:42]
  assign tcp_hdr_chksum_cal_io_in_vec_2 = 32'h0; // @[RxPipelineHandler.scala 59:42]
  assign tcp_hdr_chksum_cal_io_in_vec_3 = 32'h0; // @[RxPipelineHandler.scala 59:42]
  assign tcp_hdr_chksum_cal_io_in_vec_4 = 32'h0; // @[RxPipelineHandler.scala 59:42]
  assign tcp_hdr_chksum_cal_io_in_vec_5 = 32'h0; // @[RxPipelineHandler.scala 59:42]
  assign tcp_hdr_chksum_cal_io_in_vec_6 = 32'h0; // @[RxPipelineHandler.scala 59:42]
  assign tcp_hdr_chksum_cal_io_in_vec_7 = 32'h0; // @[RxPipelineHandler.scala 59:42]
  assign tcp_hdr_chksum_cal_io_in_vec_8 = {{16'd0}, _ip_chksum_cal_io_in_vec_1_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_9 = 32'h0; // @[RxPipelineHandler.scala 59:42]
  assign tcp_hdr_chksum_cal_io_in_vec_10 = 32'h0; // @[RxPipelineHandler.scala 59:42]
  assign tcp_hdr_chksum_cal_io_in_vec_11 = {{24'd0}, cal_tdata[191:184]}; // @[RxPipelineHandler.scala 58:53]
  assign tcp_hdr_chksum_cal_io_in_vec_12 = 32'h0; // @[RxPipelineHandler.scala 59:42]
  assign tcp_hdr_chksum_cal_io_in_vec_13 = {{16'd0}, _ip_chksum_cal_io_in_vec_6_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_14 = {{16'd0}, _ip_chksum_cal_io_in_vec_7_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_15 = {{16'd0}, _ip_chksum_cal_io_in_vec_8_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_16 = {{16'd0}, _ip_chksum_cal_io_in_vec_9_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_17 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_17_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_18 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_18_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_19 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_19_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_20 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_20_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_21 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_21_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_22 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_22_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_23 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_23_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_24 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_24_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_25 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_25_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_26 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_26_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_27 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_27_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_28 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_28_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_29 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_29_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_30 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_30_T_3}; // @[RxPipelineHandler.scala 57:56]
  assign tcp_hdr_chksum_cal_io_in_vec_31 = {{16'd0}, _tcp_pld_chksum_cal_io_in_vec_31_T_3}; // @[RxPipelineHandler.scala 57:56]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 28:20]
      in_reg_r <= 601'h1; // @[Reg.scala 28:20]
    end else if (in_shake_hand) begin // @[Reg.scala 29:18]
      in_reg_r <= _in_reg_T_1; // @[Reg.scala 29:22]
    end
    first_beat_reg <= reset | _GEN_1; // @[Reg.scala 28:{20,20}]
    if (reset) begin // @[RxPipelineHandler.scala 18:32]
      in_reg_used_reg <= 1'h0; // @[RxPipelineHandler.scala 18:32]
    end else begin
      in_reg_used_reg <= _GEN_3;
    end
    if (reset) begin // @[RxPipelineHandler.scala 63:34]
      cal_ip_chksum_reg <= 32'h0; // @[RxPipelineHandler.scala 63:34]
    end else if (in_shake_hand) begin // @[RxPipelineHandler.scala 66:24]
      if (first_beat_reg) begin // @[RxPipelineHandler.scala 67:27]
        cal_ip_chksum_reg <= ip_chksum_cal_io_out_sum; // @[RxPipelineHandler.scala 68:25]
      end
    end
    if (reset) begin // @[RxPipelineHandler.scala 64:35]
      cal_tcp_chksum_reg <= 32'h0; // @[RxPipelineHandler.scala 64:35]
    end else if (in_shake_hand) begin // @[RxPipelineHandler.scala 66:24]
      if (first_beat_reg) begin // @[RxPipelineHandler.scala 67:27]
        cal_tcp_chksum_reg <= tcp_hdr_chksum_result; // @[RxPipelineHandler.scala 69:26]
      end else begin
        cal_tcp_chksum_reg <= _cal_tcp_chksum_reg_T_1; // @[RxPipelineHandler.scala 71:26]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {19{`RANDOM}};
  in_reg_r = _RAND_0[600:0];
  _RAND_1 = {1{`RANDOM}};
  first_beat_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  in_reg_used_reg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cal_ip_chksum_reg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  cal_tcp_chksum_reg = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ReduceXorSync(
  input         clock,
  input  [31:0] io_in_vec_0,
  input  [31:0] io_in_vec_1,
  input  [31:0] io_in_vec_2,
  input  [31:0] io_in_vec_3,
  input  [31:0] io_in_vec_4,
  input  [31:0] io_in_vec_5,
  input  [31:0] io_in_vec_6,
  input  [31:0] io_in_vec_7,
  input  [31:0] io_in_vec_8,
  input  [31:0] io_in_vec_9,
  input  [31:0] io_in_vec_10,
  input  [31:0] io_in_vec_11,
  input  [31:0] io_in_vec_12,
  input  [31:0] io_in_vec_13,
  input  [31:0] io_in_vec_14,
  input  [31:0] io_in_vec_15,
  input  [31:0] io_in_vec_16,
  input  [31:0] io_in_vec_17,
  input  [31:0] io_in_vec_18,
  input  [31:0] io_in_vec_19,
  input  [31:0] io_in_vec_20,
  input  [31:0] io_in_vec_21,
  input  [31:0] io_in_vec_22,
  input  [31:0] io_in_vec_23,
  input  [31:0] io_in_vec_24,
  input  [31:0] io_in_vec_25,
  input  [31:0] io_in_vec_26,
  input  [31:0] io_in_vec_27,
  input  [31:0] io_in_vec_28,
  input  [31:0] io_in_vec_29,
  input  [31:0] io_in_vec_30,
  input  [31:0] io_in_vec_31,
  input  [31:0] io_in_vec_32,
  input  [31:0] io_in_vec_33,
  input  [31:0] io_in_vec_34,
  input  [31:0] io_in_vec_35,
  input  [31:0] io_in_vec_36,
  input  [31:0] io_in_vec_37,
  input  [31:0] io_in_vec_38,
  input  [31:0] io_in_vec_39,
  input  [31:0] io_in_vec_40,
  input  [31:0] io_in_vec_41,
  input  [31:0] io_in_vec_42,
  input  [31:0] io_in_vec_43,
  input  [31:0] io_in_vec_44,
  input  [31:0] io_in_vec_45,
  input  [31:0] io_in_vec_46,
  input  [31:0] io_in_vec_47,
  input  [31:0] io_in_vec_48,
  input  [31:0] io_in_vec_49,
  input  [31:0] io_in_vec_50,
  input  [31:0] io_in_vec_51,
  input  [31:0] io_in_vec_52,
  input  [31:0] io_in_vec_53,
  input  [31:0] io_in_vec_54,
  input  [31:0] io_in_vec_55,
  input  [31:0] io_in_vec_56,
  input  [31:0] io_in_vec_57,
  input  [31:0] io_in_vec_58,
  input  [31:0] io_in_vec_59,
  input  [31:0] io_in_vec_60,
  input  [31:0] io_in_vec_61,
  input  [31:0] io_in_vec_62,
  input  [31:0] io_in_vec_63,
  input  [31:0] io_in_vec_64,
  input  [31:0] io_in_vec_65,
  input  [31:0] io_in_vec_66,
  input  [31:0] io_in_vec_67,
  input  [31:0] io_in_vec_68,
  input  [31:0] io_in_vec_69,
  input  [31:0] io_in_vec_70,
  input  [31:0] io_in_vec_71,
  input  [31:0] io_in_vec_72,
  input  [31:0] io_in_vec_73,
  input  [31:0] io_in_vec_74,
  input  [31:0] io_in_vec_75,
  input  [31:0] io_in_vec_76,
  input  [31:0] io_in_vec_77,
  input  [31:0] io_in_vec_78,
  input  [31:0] io_in_vec_79,
  input  [31:0] io_in_vec_80,
  input  [31:0] io_in_vec_81,
  input  [31:0] io_in_vec_82,
  input  [31:0] io_in_vec_83,
  input  [31:0] io_in_vec_84,
  input  [31:0] io_in_vec_85,
  input  [31:0] io_in_vec_86,
  input  [31:0] io_in_vec_87,
  input  [31:0] io_in_vec_88,
  input  [31:0] io_in_vec_89,
  input  [31:0] io_in_vec_90,
  input  [31:0] io_in_vec_91,
  input  [31:0] io_in_vec_92,
  input  [31:0] io_in_vec_93,
  input  [31:0] io_in_vec_94,
  input  [31:0] io_in_vec_95,
  output [31:0] io_out_sum
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] cal_reg_0; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_1; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_2; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_3; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_4; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_5; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_6; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_7; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_8; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_9; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_10; // @[Misc.scala 174:20]
  reg [31:0] cal_reg_11; // @[Misc.scala 174:20]
  wire [31:0] _cal_reg_0_T = io_in_vec_0 ^ io_in_vec_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_0_T_1 = io_in_vec_2 ^ io_in_vec_3; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_0_T_2 = io_in_vec_4 ^ io_in_vec_5; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_0_T_3 = io_in_vec_6 ^ io_in_vec_7; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_0_T_4 = _cal_reg_0_T ^ _cal_reg_0_T_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_0_T_5 = _cal_reg_0_T_2 ^ _cal_reg_0_T_3; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_1_T = io_in_vec_8 ^ io_in_vec_9; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_1_T_1 = io_in_vec_10 ^ io_in_vec_11; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_1_T_2 = io_in_vec_12 ^ io_in_vec_13; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_1_T_3 = io_in_vec_14 ^ io_in_vec_15; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_1_T_4 = _cal_reg_1_T ^ _cal_reg_1_T_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_1_T_5 = _cal_reg_1_T_2 ^ _cal_reg_1_T_3; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_2_T = io_in_vec_16 ^ io_in_vec_17; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_2_T_1 = io_in_vec_18 ^ io_in_vec_19; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_2_T_2 = io_in_vec_20 ^ io_in_vec_21; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_2_T_3 = io_in_vec_22 ^ io_in_vec_23; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_2_T_4 = _cal_reg_2_T ^ _cal_reg_2_T_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_2_T_5 = _cal_reg_2_T_2 ^ _cal_reg_2_T_3; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_3_T = io_in_vec_24 ^ io_in_vec_25; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_3_T_1 = io_in_vec_26 ^ io_in_vec_27; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_3_T_2 = io_in_vec_28 ^ io_in_vec_29; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_3_T_3 = io_in_vec_30 ^ io_in_vec_31; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_3_T_4 = _cal_reg_3_T ^ _cal_reg_3_T_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_3_T_5 = _cal_reg_3_T_2 ^ _cal_reg_3_T_3; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_4_T = io_in_vec_32 ^ io_in_vec_33; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_4_T_1 = io_in_vec_34 ^ io_in_vec_35; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_4_T_2 = io_in_vec_36 ^ io_in_vec_37; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_4_T_3 = io_in_vec_38 ^ io_in_vec_39; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_4_T_4 = _cal_reg_4_T ^ _cal_reg_4_T_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_4_T_5 = _cal_reg_4_T_2 ^ _cal_reg_4_T_3; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_5_T = io_in_vec_40 ^ io_in_vec_41; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_5_T_1 = io_in_vec_42 ^ io_in_vec_43; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_5_T_2 = io_in_vec_44 ^ io_in_vec_45; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_5_T_3 = io_in_vec_46 ^ io_in_vec_47; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_5_T_4 = _cal_reg_5_T ^ _cal_reg_5_T_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_5_T_5 = _cal_reg_5_T_2 ^ _cal_reg_5_T_3; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_6_T = io_in_vec_48 ^ io_in_vec_49; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_6_T_1 = io_in_vec_50 ^ io_in_vec_51; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_6_T_2 = io_in_vec_52 ^ io_in_vec_53; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_6_T_3 = io_in_vec_54 ^ io_in_vec_55; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_6_T_4 = _cal_reg_6_T ^ _cal_reg_6_T_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_6_T_5 = _cal_reg_6_T_2 ^ _cal_reg_6_T_3; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_7_T = io_in_vec_56 ^ io_in_vec_57; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_7_T_1 = io_in_vec_58 ^ io_in_vec_59; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_7_T_2 = io_in_vec_60 ^ io_in_vec_61; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_7_T_3 = io_in_vec_62 ^ io_in_vec_63; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_7_T_4 = _cal_reg_7_T ^ _cal_reg_7_T_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_7_T_5 = _cal_reg_7_T_2 ^ _cal_reg_7_T_3; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_8_T = io_in_vec_64 ^ io_in_vec_65; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_8_T_1 = io_in_vec_66 ^ io_in_vec_67; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_8_T_2 = io_in_vec_68 ^ io_in_vec_69; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_8_T_3 = io_in_vec_70 ^ io_in_vec_71; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_8_T_4 = _cal_reg_8_T ^ _cal_reg_8_T_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_8_T_5 = _cal_reg_8_T_2 ^ _cal_reg_8_T_3; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_9_T = io_in_vec_72 ^ io_in_vec_73; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_9_T_1 = io_in_vec_74 ^ io_in_vec_75; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_9_T_2 = io_in_vec_76 ^ io_in_vec_77; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_9_T_3 = io_in_vec_78 ^ io_in_vec_79; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_9_T_4 = _cal_reg_9_T ^ _cal_reg_9_T_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_9_T_5 = _cal_reg_9_T_2 ^ _cal_reg_9_T_3; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_10_T = io_in_vec_80 ^ io_in_vec_81; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_10_T_1 = io_in_vec_82 ^ io_in_vec_83; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_10_T_2 = io_in_vec_84 ^ io_in_vec_85; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_10_T_3 = io_in_vec_86 ^ io_in_vec_87; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_10_T_4 = _cal_reg_10_T ^ _cal_reg_10_T_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_10_T_5 = _cal_reg_10_T_2 ^ _cal_reg_10_T_3; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_11_T = io_in_vec_88 ^ io_in_vec_89; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_11_T_1 = io_in_vec_90 ^ io_in_vec_91; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_11_T_2 = io_in_vec_92 ^ io_in_vec_93; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_11_T_3 = io_in_vec_94 ^ io_in_vec_95; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_11_T_4 = _cal_reg_11_T ^ _cal_reg_11_T_1; // @[Misc.scala 203:42]
  wire [31:0] _cal_reg_11_T_5 = _cal_reg_11_T_2 ^ _cal_reg_11_T_3; // @[Misc.scala 203:42]
  wire [31:0] _io_out_sum_T = cal_reg_0 ^ cal_reg_1; // @[Misc.scala 205:37]
  wire [31:0] _io_out_sum_T_1 = cal_reg_2 ^ cal_reg_3; // @[Misc.scala 205:37]
  wire [31:0] _io_out_sum_T_2 = cal_reg_4 ^ cal_reg_5; // @[Misc.scala 205:37]
  wire [31:0] _io_out_sum_T_3 = cal_reg_6 ^ cal_reg_7; // @[Misc.scala 205:37]
  wire [31:0] _io_out_sum_T_4 = cal_reg_8 ^ cal_reg_9; // @[Misc.scala 205:37]
  wire [31:0] _io_out_sum_T_5 = cal_reg_10 ^ cal_reg_11; // @[Misc.scala 205:37]
  wire [31:0] _io_out_sum_T_8 = _io_out_sum_T ^ _io_out_sum_T_1; // @[Misc.scala 205:37]
  wire [31:0] _io_out_sum_T_9 = _io_out_sum_T_2 ^ _io_out_sum_T_3; // @[Misc.scala 205:37]
  wire [31:0] _io_out_sum_T_10 = _io_out_sum_T_4 ^ _io_out_sum_T_5; // @[Misc.scala 205:37]
  wire [31:0] _io_out_sum_T_12 = _io_out_sum_T_8 ^ _io_out_sum_T_9; // @[Misc.scala 205:37]
  assign io_out_sum = _io_out_sum_T_12 ^ _io_out_sum_T_10; // @[Misc.scala 205:37]
  always @(posedge clock) begin
    cal_reg_0 <= _cal_reg_0_T_4 ^ _cal_reg_0_T_5; // @[Misc.scala 203:42]
    cal_reg_1 <= _cal_reg_1_T_4 ^ _cal_reg_1_T_5; // @[Misc.scala 203:42]
    cal_reg_2 <= _cal_reg_2_T_4 ^ _cal_reg_2_T_5; // @[Misc.scala 203:42]
    cal_reg_3 <= _cal_reg_3_T_4 ^ _cal_reg_3_T_5; // @[Misc.scala 203:42]
    cal_reg_4 <= _cal_reg_4_T_4 ^ _cal_reg_4_T_5; // @[Misc.scala 203:42]
    cal_reg_5 <= _cal_reg_5_T_4 ^ _cal_reg_5_T_5; // @[Misc.scala 203:42]
    cal_reg_6 <= _cal_reg_6_T_4 ^ _cal_reg_6_T_5; // @[Misc.scala 203:42]
    cal_reg_7 <= _cal_reg_7_T_4 ^ _cal_reg_7_T_5; // @[Misc.scala 203:42]
    cal_reg_8 <= _cal_reg_8_T_4 ^ _cal_reg_8_T_5; // @[Misc.scala 203:42]
    cal_reg_9 <= _cal_reg_9_T_4 ^ _cal_reg_9_T_5; // @[Misc.scala 203:42]
    cal_reg_10 <= _cal_reg_10_T_4 ^ _cal_reg_10_T_5; // @[Misc.scala 203:42]
    cal_reg_11 <= _cal_reg_11_T_4 ^ _cal_reg_11_T_5; // @[Misc.scala 203:42]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cal_reg_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  cal_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  cal_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  cal_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  cal_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  cal_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  cal_reg_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  cal_reg_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  cal_reg_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  cal_reg_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  cal_reg_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  cal_reg_11 = _RAND_11[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RxRSSHasher(
  input          clock,
  input          reset,
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input          io_in_tuser,
  input  [15:0]  io_in_rx_info_tlen,
  input  [5:0]   io_in_rx_info_qid,
  input  [31:0]  io_in_rx_info_ip_chksum,
  input  [31:0]  io_in_rx_info_tcp_chksum,
  input  [7:0]   io_in_extern_config_c2h_match_op,
  input  [31:0]  io_in_extern_config_c2h_match_arg_0,
  input  [31:0]  io_in_extern_config_c2h_match_arg_1,
  input  [31:0]  io_in_extern_config_c2h_match_arg_2,
  input  [31:0]  io_in_extern_config_c2h_match_arg_3,
  input  [31:0]  io_in_extern_config_c2h_match_arg_4,
  input  [31:0]  io_in_extern_config_c2h_match_arg_5,
  input  [31:0]  io_in_extern_config_c2h_match_arg_6,
  input  [31:0]  io_in_extern_config_c2h_match_arg_7,
  input  [31:0]  io_in_extern_config_c2h_match_arg_8,
  input  [31:0]  io_in_extern_config_c2h_match_arg_9,
  input  [31:0]  io_in_extern_config_c2h_match_arg_10,
  input  [31:0]  io_in_extern_config_c2h_match_arg_11,
  input  [31:0]  io_in_extern_config_c2h_match_arg_12,
  input  [31:0]  io_in_extern_config_c2h_match_arg_13,
  input  [31:0]  io_in_extern_config_c2h_match_arg_14,
  input  [31:0]  io_in_extern_config_c2h_match_arg_15,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  output         io_out_tuser,
  output [15:0]  io_out_rx_info_tlen,
  output [5:0]   io_out_rx_info_qid,
  output [31:0]  io_out_rx_info_ip_chksum,
  output [31:0]  io_out_rx_info_tcp_chksum,
  output [7:0]   io_out_extern_config_c2h_match_op,
  output [31:0]  io_out_extern_config_c2h_match_arg_0,
  output [31:0]  io_out_extern_config_c2h_match_arg_1,
  output [31:0]  io_out_extern_config_c2h_match_arg_2,
  output [31:0]  io_out_extern_config_c2h_match_arg_3,
  output [31:0]  io_out_extern_config_c2h_match_arg_4,
  output [31:0]  io_out_extern_config_c2h_match_arg_5,
  output [31:0]  io_out_extern_config_c2h_match_arg_6,
  output [31:0]  io_out_extern_config_c2h_match_arg_7,
  output [31:0]  io_out_extern_config_c2h_match_arg_8,
  output [31:0]  io_out_extern_config_c2h_match_arg_9,
  output [31:0]  io_out_extern_config_c2h_match_arg_10,
  output [31:0]  io_out_extern_config_c2h_match_arg_11,
  output [31:0]  io_out_extern_config_c2h_match_arg_12,
  output [31:0]  io_out_extern_config_c2h_match_arg_13,
  output [31:0]  io_out_extern_config_c2h_match_arg_14,
  output [31:0]  io_out_extern_config_c2h_match_arg_15
);
`ifdef RANDOMIZE_REG_INIT
  reg [607:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  hash_xor_sync_clock; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_0; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_1; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_2; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_3; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_4; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_5; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_6; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_7; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_8; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_9; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_10; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_11; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_12; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_13; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_14; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_15; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_16; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_17; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_18; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_19; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_20; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_21; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_22; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_23; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_24; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_25; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_26; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_27; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_28; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_29; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_30; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_31; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_32; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_33; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_34; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_35; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_36; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_37; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_38; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_39; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_40; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_41; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_42; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_43; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_44; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_45; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_46; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_47; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_48; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_49; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_50; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_51; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_52; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_53; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_54; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_55; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_56; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_57; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_58; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_59; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_60; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_61; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_62; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_63; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_64; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_65; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_66; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_67; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_68; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_69; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_70; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_71; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_72; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_73; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_74; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_75; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_76; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_77; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_78; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_79; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_80; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_81; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_82; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_83; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_84; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_85; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_86; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_87; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_88; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_89; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_90; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_91; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_92; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_93; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_94; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_in_vec_95; // @[RxPipelineHandler.scala 104:29]
  wire [31:0] hash_xor_sync_io_out_sum; // @[RxPipelineHandler.scala 104:29]
  wire  in_shake_hand = io_in_tready & io_in_tvalid; // @[RxPipelineHandler.scala 12:38]
  wire  out_shake_hand = io_out_tready & io_out_tvalid; // @[RxPipelineHandler.scala 13:38]
  wire [600:0] _in_reg_T_1 = {io_in_rx_info_tlen,io_in_rx_info_qid,io_in_rx_info_ip_chksum,io_in_rx_info_tcp_chksum,
    io_in_tuser,io_in_tdata,io_in_tvalid,io_in_tlast}; // @[Cat.scala 31:58]
  reg [600:0] in_reg_r; // @[Reg.scala 28:20]
  wire  in_reg_tlast = in_reg_r[0]; // @[RxPipelineHandler.scala 14:128]
  wire  in_reg_tvalid = in_reg_r[1]; // @[RxPipelineHandler.scala 14:128]
  wire [511:0] in_reg_tdata = in_reg_r[513:2]; // @[RxPipelineHandler.scala 14:128]
  wire [5:0] in_reg_rx_info_qid = in_reg_r[584:579]; // @[RxPipelineHandler.scala 14:128]
  reg  first_beat_reg; // @[Reg.scala 28:20]
  wire  _GEN_1 = in_shake_hand ? in_reg_tlast : first_beat_reg; // @[Reg.scala 29:18 28:20 29:22]
  reg  in_reg_used_reg; // @[RxPipelineHandler.scala 18:32]
  wire  _GEN_2 = out_shake_hand ? 1'h0 : in_reg_used_reg; // @[RxPipelineHandler.scala 21:29 22:21 18:32]
  wire  _GEN_3 = in_shake_hand | _GEN_2; // @[RxPipelineHandler.scala 19:23 20:21]
  wire [511:0] cal_tdata = in_shake_hand ? io_in_tdata : in_reg_tdata; // @[RxPipelineHandler.scala 90:22]
  wire [31:0] info_lo = {cal_tdata[279:272],cal_tdata[287:280],cal_tdata[295:288],cal_tdata[303:296]}; // @[Cat.scala 31:58]
  wire [95:0] info = {cal_tdata[215:208],cal_tdata[223:216],cal_tdata[231:224],cal_tdata[239:232],cal_tdata[247:240],
    cal_tdata[255:248],cal_tdata[263:256],cal_tdata[271:264],info_lo}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_0_T_3 = {io_in_extern_config_c2h_match_arg_0[0],io_in_extern_config_c2h_match_arg_0[31:1
    ]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_1_T_3 = {io_in_extern_config_c2h_match_arg_0[1:0],io_in_extern_config_c2h_match_arg_0[31
    :2]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_2_T_3 = {io_in_extern_config_c2h_match_arg_0[2:0],io_in_extern_config_c2h_match_arg_0[31
    :3]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_3_T_3 = {io_in_extern_config_c2h_match_arg_0[3:0],io_in_extern_config_c2h_match_arg_0[31
    :4]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_4_T_3 = {io_in_extern_config_c2h_match_arg_0[4:0],io_in_extern_config_c2h_match_arg_0[31
    :5]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_5_T_3 = {io_in_extern_config_c2h_match_arg_0[5:0],io_in_extern_config_c2h_match_arg_0[31
    :6]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_6_T_3 = {io_in_extern_config_c2h_match_arg_0[6:0],io_in_extern_config_c2h_match_arg_0[31
    :7]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_7_T_3 = {io_in_extern_config_c2h_match_arg_0[7:0],io_in_extern_config_c2h_match_arg_0[31
    :8]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_8_T_3 = {io_in_extern_config_c2h_match_arg_0[8:0],io_in_extern_config_c2h_match_arg_0[31
    :9]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_9_T_3 = {io_in_extern_config_c2h_match_arg_0[9:0],io_in_extern_config_c2h_match_arg_0[31
    :10]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_10_T_3 = {io_in_extern_config_c2h_match_arg_0[10:0],io_in_extern_config_c2h_match_arg_0[
    31:11]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_11_T_3 = {io_in_extern_config_c2h_match_arg_0[11:0],io_in_extern_config_c2h_match_arg_0[
    31:12]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_12_T_3 = {io_in_extern_config_c2h_match_arg_0[12:0],io_in_extern_config_c2h_match_arg_0[
    31:13]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_13_T_3 = {io_in_extern_config_c2h_match_arg_0[13:0],io_in_extern_config_c2h_match_arg_0[
    31:14]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_14_T_3 = {io_in_extern_config_c2h_match_arg_0[14:0],io_in_extern_config_c2h_match_arg_0[
    31:15]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_15_T_3 = {io_in_extern_config_c2h_match_arg_0[15:0],io_in_extern_config_c2h_match_arg_0[
    31:16]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_16_T_3 = {io_in_extern_config_c2h_match_arg_0[16:0],io_in_extern_config_c2h_match_arg_0[
    31:17]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_17_T_3 = {io_in_extern_config_c2h_match_arg_0[17:0],io_in_extern_config_c2h_match_arg_0[
    31:18]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_18_T_3 = {io_in_extern_config_c2h_match_arg_0[18:0],io_in_extern_config_c2h_match_arg_0[
    31:19]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_19_T_3 = {io_in_extern_config_c2h_match_arg_0[19:0],io_in_extern_config_c2h_match_arg_0[
    31:20]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_20_T_3 = {io_in_extern_config_c2h_match_arg_0[20:0],io_in_extern_config_c2h_match_arg_0[
    31:21]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_21_T_3 = {io_in_extern_config_c2h_match_arg_0[21:0],io_in_extern_config_c2h_match_arg_0[
    31:22]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_22_T_3 = {io_in_extern_config_c2h_match_arg_0[22:0],io_in_extern_config_c2h_match_arg_0[
    31:23]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_23_T_3 = {io_in_extern_config_c2h_match_arg_0[23:0],io_in_extern_config_c2h_match_arg_0[
    31:24]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_24_T_3 = {io_in_extern_config_c2h_match_arg_0[24:0],io_in_extern_config_c2h_match_arg_0[
    31:25]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_25_T_3 = {io_in_extern_config_c2h_match_arg_0[25:0],io_in_extern_config_c2h_match_arg_0[
    31:26]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_26_T_3 = {io_in_extern_config_c2h_match_arg_0[26:0],io_in_extern_config_c2h_match_arg_0[
    31:27]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_27_T_3 = {io_in_extern_config_c2h_match_arg_0[27:0],io_in_extern_config_c2h_match_arg_0[
    31:28]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_28_T_3 = {io_in_extern_config_c2h_match_arg_0[28:0],io_in_extern_config_c2h_match_arg_0[
    31:29]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_29_T_3 = {io_in_extern_config_c2h_match_arg_0[29:0],io_in_extern_config_c2h_match_arg_0[
    31:30]}; // @[Cat.scala 31:58]
  wire [31:0] _cal_hash_key_vec_30_T_3 = {io_in_extern_config_c2h_match_arg_0[30:0],io_in_extern_config_c2h_match_arg_0[
    31]}; // @[Cat.scala 31:58]
  wire [31:0] hash_xor_result = hash_xor_sync_io_out_sum; // @[RxPipelineHandler.scala 105:29 109:19]
  wire [31:0] cal_qid = hash_xor_result & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 112:35]
  wire  _cur_packet_qid_reg_T = in_shake_hand & first_beat_reg; // @[RxPipelineHandler.scala 113:66]
  reg [31:0] cur_packet_qid_reg; // @[Reg.scala 28:20]
  wire [31:0] _io_out_rx_info_qid_T = first_beat_reg ? cal_qid : cur_packet_qid_reg; // @[RxPipelineHandler.scala 115:30]
  wire [31:0] _GEN_5 = io_in_extern_config_c2h_match_op[5] ? _io_out_rx_info_qid_T : {{26'd0}, in_reg_rx_info_qid}; // @[RxPipelineHandler.scala 114:45 115:24 29:18]
  ReduceXorSync hash_xor_sync ( // @[RxPipelineHandler.scala 104:29]
    .clock(hash_xor_sync_clock),
    .io_in_vec_0(hash_xor_sync_io_in_vec_0),
    .io_in_vec_1(hash_xor_sync_io_in_vec_1),
    .io_in_vec_2(hash_xor_sync_io_in_vec_2),
    .io_in_vec_3(hash_xor_sync_io_in_vec_3),
    .io_in_vec_4(hash_xor_sync_io_in_vec_4),
    .io_in_vec_5(hash_xor_sync_io_in_vec_5),
    .io_in_vec_6(hash_xor_sync_io_in_vec_6),
    .io_in_vec_7(hash_xor_sync_io_in_vec_7),
    .io_in_vec_8(hash_xor_sync_io_in_vec_8),
    .io_in_vec_9(hash_xor_sync_io_in_vec_9),
    .io_in_vec_10(hash_xor_sync_io_in_vec_10),
    .io_in_vec_11(hash_xor_sync_io_in_vec_11),
    .io_in_vec_12(hash_xor_sync_io_in_vec_12),
    .io_in_vec_13(hash_xor_sync_io_in_vec_13),
    .io_in_vec_14(hash_xor_sync_io_in_vec_14),
    .io_in_vec_15(hash_xor_sync_io_in_vec_15),
    .io_in_vec_16(hash_xor_sync_io_in_vec_16),
    .io_in_vec_17(hash_xor_sync_io_in_vec_17),
    .io_in_vec_18(hash_xor_sync_io_in_vec_18),
    .io_in_vec_19(hash_xor_sync_io_in_vec_19),
    .io_in_vec_20(hash_xor_sync_io_in_vec_20),
    .io_in_vec_21(hash_xor_sync_io_in_vec_21),
    .io_in_vec_22(hash_xor_sync_io_in_vec_22),
    .io_in_vec_23(hash_xor_sync_io_in_vec_23),
    .io_in_vec_24(hash_xor_sync_io_in_vec_24),
    .io_in_vec_25(hash_xor_sync_io_in_vec_25),
    .io_in_vec_26(hash_xor_sync_io_in_vec_26),
    .io_in_vec_27(hash_xor_sync_io_in_vec_27),
    .io_in_vec_28(hash_xor_sync_io_in_vec_28),
    .io_in_vec_29(hash_xor_sync_io_in_vec_29),
    .io_in_vec_30(hash_xor_sync_io_in_vec_30),
    .io_in_vec_31(hash_xor_sync_io_in_vec_31),
    .io_in_vec_32(hash_xor_sync_io_in_vec_32),
    .io_in_vec_33(hash_xor_sync_io_in_vec_33),
    .io_in_vec_34(hash_xor_sync_io_in_vec_34),
    .io_in_vec_35(hash_xor_sync_io_in_vec_35),
    .io_in_vec_36(hash_xor_sync_io_in_vec_36),
    .io_in_vec_37(hash_xor_sync_io_in_vec_37),
    .io_in_vec_38(hash_xor_sync_io_in_vec_38),
    .io_in_vec_39(hash_xor_sync_io_in_vec_39),
    .io_in_vec_40(hash_xor_sync_io_in_vec_40),
    .io_in_vec_41(hash_xor_sync_io_in_vec_41),
    .io_in_vec_42(hash_xor_sync_io_in_vec_42),
    .io_in_vec_43(hash_xor_sync_io_in_vec_43),
    .io_in_vec_44(hash_xor_sync_io_in_vec_44),
    .io_in_vec_45(hash_xor_sync_io_in_vec_45),
    .io_in_vec_46(hash_xor_sync_io_in_vec_46),
    .io_in_vec_47(hash_xor_sync_io_in_vec_47),
    .io_in_vec_48(hash_xor_sync_io_in_vec_48),
    .io_in_vec_49(hash_xor_sync_io_in_vec_49),
    .io_in_vec_50(hash_xor_sync_io_in_vec_50),
    .io_in_vec_51(hash_xor_sync_io_in_vec_51),
    .io_in_vec_52(hash_xor_sync_io_in_vec_52),
    .io_in_vec_53(hash_xor_sync_io_in_vec_53),
    .io_in_vec_54(hash_xor_sync_io_in_vec_54),
    .io_in_vec_55(hash_xor_sync_io_in_vec_55),
    .io_in_vec_56(hash_xor_sync_io_in_vec_56),
    .io_in_vec_57(hash_xor_sync_io_in_vec_57),
    .io_in_vec_58(hash_xor_sync_io_in_vec_58),
    .io_in_vec_59(hash_xor_sync_io_in_vec_59),
    .io_in_vec_60(hash_xor_sync_io_in_vec_60),
    .io_in_vec_61(hash_xor_sync_io_in_vec_61),
    .io_in_vec_62(hash_xor_sync_io_in_vec_62),
    .io_in_vec_63(hash_xor_sync_io_in_vec_63),
    .io_in_vec_64(hash_xor_sync_io_in_vec_64),
    .io_in_vec_65(hash_xor_sync_io_in_vec_65),
    .io_in_vec_66(hash_xor_sync_io_in_vec_66),
    .io_in_vec_67(hash_xor_sync_io_in_vec_67),
    .io_in_vec_68(hash_xor_sync_io_in_vec_68),
    .io_in_vec_69(hash_xor_sync_io_in_vec_69),
    .io_in_vec_70(hash_xor_sync_io_in_vec_70),
    .io_in_vec_71(hash_xor_sync_io_in_vec_71),
    .io_in_vec_72(hash_xor_sync_io_in_vec_72),
    .io_in_vec_73(hash_xor_sync_io_in_vec_73),
    .io_in_vec_74(hash_xor_sync_io_in_vec_74),
    .io_in_vec_75(hash_xor_sync_io_in_vec_75),
    .io_in_vec_76(hash_xor_sync_io_in_vec_76),
    .io_in_vec_77(hash_xor_sync_io_in_vec_77),
    .io_in_vec_78(hash_xor_sync_io_in_vec_78),
    .io_in_vec_79(hash_xor_sync_io_in_vec_79),
    .io_in_vec_80(hash_xor_sync_io_in_vec_80),
    .io_in_vec_81(hash_xor_sync_io_in_vec_81),
    .io_in_vec_82(hash_xor_sync_io_in_vec_82),
    .io_in_vec_83(hash_xor_sync_io_in_vec_83),
    .io_in_vec_84(hash_xor_sync_io_in_vec_84),
    .io_in_vec_85(hash_xor_sync_io_in_vec_85),
    .io_in_vec_86(hash_xor_sync_io_in_vec_86),
    .io_in_vec_87(hash_xor_sync_io_in_vec_87),
    .io_in_vec_88(hash_xor_sync_io_in_vec_88),
    .io_in_vec_89(hash_xor_sync_io_in_vec_89),
    .io_in_vec_90(hash_xor_sync_io_in_vec_90),
    .io_in_vec_91(hash_xor_sync_io_in_vec_91),
    .io_in_vec_92(hash_xor_sync_io_in_vec_92),
    .io_in_vec_93(hash_xor_sync_io_in_vec_93),
    .io_in_vec_94(hash_xor_sync_io_in_vec_94),
    .io_in_vec_95(hash_xor_sync_io_in_vec_95),
    .io_out_sum(hash_xor_sync_io_out_sum)
  );
  assign io_in_tready = io_out_tready | ~in_reg_used_reg; // @[RxPipelineHandler.scala 30:47]
  assign io_out_tdata = in_reg_r[513:2]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_tvalid = in_reg_tvalid & in_reg_used_reg; // @[RxPipelineHandler.scala 27:47]
  assign io_out_tlast = in_reg_r[0]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_tuser = in_reg_r[514]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_tlen = in_reg_r[600:585]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_qid = _GEN_5[5:0];
  assign io_out_rx_info_ip_chksum = in_reg_r[578:547]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_tcp_chksum = in_reg_r[546:515]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_extern_config_c2h_match_op = io_in_extern_config_c2h_match_op; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_0 = io_in_extern_config_c2h_match_arg_0; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_1 = io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_2 = io_in_extern_config_c2h_match_arg_2; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_3 = io_in_extern_config_c2h_match_arg_3; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_4 = io_in_extern_config_c2h_match_arg_4; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_5 = io_in_extern_config_c2h_match_arg_5; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_6 = io_in_extern_config_c2h_match_arg_6; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_7 = io_in_extern_config_c2h_match_arg_7; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_8 = io_in_extern_config_c2h_match_arg_8; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_9 = io_in_extern_config_c2h_match_arg_9; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_10 = io_in_extern_config_c2h_match_arg_10; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_11 = io_in_extern_config_c2h_match_arg_11; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_12 = io_in_extern_config_c2h_match_arg_12; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_13 = io_in_extern_config_c2h_match_arg_13; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_14 = io_in_extern_config_c2h_match_arg_14; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_15 = io_in_extern_config_c2h_match_arg_15; // @[RxPipelineHandler.scala 31:24]
  assign hash_xor_sync_clock = clock;
  assign hash_xor_sync_io_in_vec_0 = info[0] ? _cal_hash_key_vec_0_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_1 = info[1] ? _cal_hash_key_vec_1_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_2 = info[2] ? _cal_hash_key_vec_2_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_3 = info[3] ? _cal_hash_key_vec_3_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_4 = info[4] ? _cal_hash_key_vec_4_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_5 = info[5] ? _cal_hash_key_vec_5_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_6 = info[6] ? _cal_hash_key_vec_6_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_7 = info[7] ? _cal_hash_key_vec_7_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_8 = info[8] ? _cal_hash_key_vec_8_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_9 = info[9] ? _cal_hash_key_vec_9_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_10 = info[10] ? _cal_hash_key_vec_10_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_11 = info[11] ? _cal_hash_key_vec_11_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_12 = info[12] ? _cal_hash_key_vec_12_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_13 = info[13] ? _cal_hash_key_vec_13_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_14 = info[14] ? _cal_hash_key_vec_14_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_15 = info[15] ? _cal_hash_key_vec_15_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_16 = info[16] ? _cal_hash_key_vec_16_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_17 = info[17] ? _cal_hash_key_vec_17_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_18 = info[18] ? _cal_hash_key_vec_18_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_19 = info[19] ? _cal_hash_key_vec_19_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_20 = info[20] ? _cal_hash_key_vec_20_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_21 = info[21] ? _cal_hash_key_vec_21_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_22 = info[22] ? _cal_hash_key_vec_22_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_23 = info[23] ? _cal_hash_key_vec_23_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_24 = info[24] ? _cal_hash_key_vec_24_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_25 = info[25] ? _cal_hash_key_vec_25_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_26 = info[26] ? _cal_hash_key_vec_26_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_27 = info[27] ? _cal_hash_key_vec_27_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_28 = info[28] ? _cal_hash_key_vec_28_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_29 = info[29] ? _cal_hash_key_vec_29_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_30 = info[30] ? _cal_hash_key_vec_30_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_31 = info[31] ? io_in_extern_config_c2h_match_arg_0 : 32'h0; // @[RxPipelineHandler.scala 99:45]
  assign hash_xor_sync_io_in_vec_32 = info[32] ? _cal_hash_key_vec_0_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_33 = info[33] ? _cal_hash_key_vec_1_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_34 = info[34] ? _cal_hash_key_vec_2_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_35 = info[35] ? _cal_hash_key_vec_3_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_36 = info[36] ? _cal_hash_key_vec_4_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_37 = info[37] ? _cal_hash_key_vec_5_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_38 = info[38] ? _cal_hash_key_vec_6_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_39 = info[39] ? _cal_hash_key_vec_7_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_40 = info[40] ? _cal_hash_key_vec_8_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_41 = info[41] ? _cal_hash_key_vec_9_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_42 = info[42] ? _cal_hash_key_vec_10_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_43 = info[43] ? _cal_hash_key_vec_11_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_44 = info[44] ? _cal_hash_key_vec_12_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_45 = info[45] ? _cal_hash_key_vec_13_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_46 = info[46] ? _cal_hash_key_vec_14_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_47 = info[47] ? _cal_hash_key_vec_15_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_48 = info[48] ? _cal_hash_key_vec_16_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_49 = info[49] ? _cal_hash_key_vec_17_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_50 = info[50] ? _cal_hash_key_vec_18_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_51 = info[51] ? _cal_hash_key_vec_19_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_52 = info[52] ? _cal_hash_key_vec_20_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_53 = info[53] ? _cal_hash_key_vec_21_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_54 = info[54] ? _cal_hash_key_vec_22_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_55 = info[55] ? _cal_hash_key_vec_23_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_56 = info[56] ? _cal_hash_key_vec_24_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_57 = info[57] ? _cal_hash_key_vec_25_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_58 = info[58] ? _cal_hash_key_vec_26_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_59 = info[59] ? _cal_hash_key_vec_27_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_60 = info[60] ? _cal_hash_key_vec_28_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_61 = info[61] ? _cal_hash_key_vec_29_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_62 = info[62] ? _cal_hash_key_vec_30_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_63 = info[63] ? io_in_extern_config_c2h_match_arg_0 : 32'h0; // @[RxPipelineHandler.scala 99:45]
  assign hash_xor_sync_io_in_vec_64 = info[64] ? _cal_hash_key_vec_0_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_65 = info[65] ? _cal_hash_key_vec_1_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_66 = info[66] ? _cal_hash_key_vec_2_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_67 = info[67] ? _cal_hash_key_vec_3_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_68 = info[68] ? _cal_hash_key_vec_4_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_69 = info[69] ? _cal_hash_key_vec_5_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_70 = info[70] ? _cal_hash_key_vec_6_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_71 = info[71] ? _cal_hash_key_vec_7_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_72 = info[72] ? _cal_hash_key_vec_8_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_73 = info[73] ? _cal_hash_key_vec_9_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_74 = info[74] ? _cal_hash_key_vec_10_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_75 = info[75] ? _cal_hash_key_vec_11_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_76 = info[76] ? _cal_hash_key_vec_12_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_77 = info[77] ? _cal_hash_key_vec_13_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_78 = info[78] ? _cal_hash_key_vec_14_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_79 = info[79] ? _cal_hash_key_vec_15_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_80 = info[80] ? _cal_hash_key_vec_16_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_81 = info[81] ? _cal_hash_key_vec_17_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_82 = info[82] ? _cal_hash_key_vec_18_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_83 = info[83] ? _cal_hash_key_vec_19_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_84 = info[84] ? _cal_hash_key_vec_20_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_85 = info[85] ? _cal_hash_key_vec_21_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_86 = info[86] ? _cal_hash_key_vec_22_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_87 = info[87] ? _cal_hash_key_vec_23_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_88 = info[88] ? _cal_hash_key_vec_24_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_89 = info[89] ? _cal_hash_key_vec_25_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_90 = info[90] ? _cal_hash_key_vec_26_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_91 = info[91] ? _cal_hash_key_vec_27_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_92 = info[92] ? _cal_hash_key_vec_28_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_93 = info[93] ? _cal_hash_key_vec_29_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_94 = info[94] ? _cal_hash_key_vec_30_T_3 : 32'h0; // @[RxPipelineHandler.scala 100:36]
  assign hash_xor_sync_io_in_vec_95 = info[95] ? io_in_extern_config_c2h_match_arg_0 : 32'h0; // @[RxPipelineHandler.scala 99:45]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 28:20]
      in_reg_r <= 601'h1; // @[Reg.scala 28:20]
    end else if (in_shake_hand) begin // @[Reg.scala 29:18]
      in_reg_r <= _in_reg_T_1; // @[Reg.scala 29:22]
    end
    first_beat_reg <= reset | _GEN_1; // @[Reg.scala 28:{20,20}]
    if (reset) begin // @[RxPipelineHandler.scala 18:32]
      in_reg_used_reg <= 1'h0; // @[RxPipelineHandler.scala 18:32]
    end else begin
      in_reg_used_reg <= _GEN_3;
    end
    if (reset) begin // @[Reg.scala 28:20]
      cur_packet_qid_reg <= 32'h0; // @[Reg.scala 28:20]
    end else if (_cur_packet_qid_reg_T) begin // @[Reg.scala 29:18]
      cur_packet_qid_reg <= cal_qid; // @[Reg.scala 29:22]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {19{`RANDOM}};
  in_reg_r = _RAND_0[600:0];
  _RAND_1 = {1{`RANDOM}};
  first_beat_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  in_reg_used_reg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cur_packet_qid_reg = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RxStrMatcher(
  input          clock,
  input          reset,
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input          io_in_tuser,
  input  [15:0]  io_in_rx_info_tlen,
  input  [5:0]   io_in_rx_info_qid,
  input  [31:0]  io_in_rx_info_ip_chksum,
  input  [31:0]  io_in_rx_info_tcp_chksum,
  input  [7:0]   io_in_extern_config_c2h_match_op,
  input  [31:0]  io_in_extern_config_c2h_match_arg_0,
  input  [31:0]  io_in_extern_config_c2h_match_arg_1,
  input  [31:0]  io_in_extern_config_c2h_match_arg_2,
  input  [31:0]  io_in_extern_config_c2h_match_arg_3,
  input  [31:0]  io_in_extern_config_c2h_match_arg_4,
  input  [31:0]  io_in_extern_config_c2h_match_arg_5,
  input  [31:0]  io_in_extern_config_c2h_match_arg_6,
  input  [31:0]  io_in_extern_config_c2h_match_arg_7,
  input  [31:0]  io_in_extern_config_c2h_match_arg_8,
  input  [31:0]  io_in_extern_config_c2h_match_arg_9,
  input  [31:0]  io_in_extern_config_c2h_match_arg_10,
  input  [31:0]  io_in_extern_config_c2h_match_arg_11,
  input  [31:0]  io_in_extern_config_c2h_match_arg_12,
  input  [31:0]  io_in_extern_config_c2h_match_arg_13,
  input  [31:0]  io_in_extern_config_c2h_match_arg_14,
  input  [31:0]  io_in_extern_config_c2h_match_arg_15,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  output         io_out_tuser,
  output [15:0]  io_out_rx_info_tlen,
  output [5:0]   io_out_rx_info_qid,
  output [31:0]  io_out_rx_info_ip_chksum,
  output [31:0]  io_out_rx_info_tcp_chksum,
  output [7:0]   io_out_extern_config_c2h_match_op,
  output [31:0]  io_out_extern_config_c2h_match_arg_0,
  output [31:0]  io_out_extern_config_c2h_match_arg_1,
  output [31:0]  io_out_extern_config_c2h_match_arg_2,
  output [31:0]  io_out_extern_config_c2h_match_arg_3,
  output [31:0]  io_out_extern_config_c2h_match_arg_4,
  output [31:0]  io_out_extern_config_c2h_match_arg_5,
  output [31:0]  io_out_extern_config_c2h_match_arg_6,
  output [31:0]  io_out_extern_config_c2h_match_arg_7,
  output [31:0]  io_out_extern_config_c2h_match_arg_8,
  output [31:0]  io_out_extern_config_c2h_match_arg_9,
  output [31:0]  io_out_extern_config_c2h_match_arg_10,
  output [31:0]  io_out_extern_config_c2h_match_arg_11,
  output [31:0]  io_out_extern_config_c2h_match_arg_12,
  output [31:0]  io_out_extern_config_c2h_match_arg_13,
  output [31:0]  io_out_extern_config_c2h_match_arg_14,
  output [31:0]  io_out_extern_config_c2h_match_arg_15
);
`ifdef RANDOMIZE_REG_INIT
  reg [607:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire  in_shake_hand = io_in_tready & io_in_tvalid; // @[RxPipelineHandler.scala 12:38]
  wire  out_shake_hand = io_out_tready & io_out_tvalid; // @[RxPipelineHandler.scala 13:38]
  wire [600:0] _in_reg_T_1 = {io_in_rx_info_tlen,io_in_rx_info_qid,io_in_rx_info_ip_chksum,io_in_rx_info_tcp_chksum,
    io_in_tuser,io_in_tdata,io_in_tvalid,io_in_tlast}; // @[Cat.scala 31:58]
  reg [600:0] in_reg_r; // @[Reg.scala 28:20]
  wire  in_reg_tlast = in_reg_r[0]; // @[RxPipelineHandler.scala 14:128]
  wire  in_reg_tvalid = in_reg_r[1]; // @[RxPipelineHandler.scala 14:128]
  wire [511:0] in_reg_tdata = in_reg_r[513:2]; // @[RxPipelineHandler.scala 14:128]
  wire [5:0] in_reg_rx_info_qid = in_reg_r[584:579]; // @[RxPipelineHandler.scala 14:128]
  reg  in_reg_used_reg; // @[RxPipelineHandler.scala 18:32]
  wire  _GEN_2 = out_shake_hand ? 1'h0 : in_reg_used_reg; // @[RxPipelineHandler.scala 21:29 22:21 18:32]
  wire  _GEN_3 = in_shake_hand | _GEN_2; // @[RxPipelineHandler.scala 19:23 20:21]
  reg  match_found_reg; // @[RxPipelineHandler.scala 134:32]
  reg  match_continue_reg; // @[RxPipelineHandler.scala 135:35]
  reg [31:0] previous_tdata_reg; // @[RxPipelineHandler.scala 137:35]
  wire [9:0] _cur_place_T_4 = io_in_rx_info_tlen[15:6] + 10'h1; // @[RxPipelineHandler.scala 139:102]
  wire [15:0] _cur_place_T_5 = {_cur_place_T_4,6'h0}; // @[Cat.scala 31:58]
  reg [15:0] cur_place_reg; // @[Reg.scala 28:20]
  wire [15:0] _in_beat_place_T_1 = cur_place_reg - 16'h40; // @[RxPipelineHandler.scala 143:52]
  wire [31:0] _GEN_23 = {{16'd0}, _in_beat_place_T_1}; // @[RxPipelineHandler.scala 143:35]
  wire [31:0] in_beat_place = io_in_extern_config_c2h_match_arg_2 - _GEN_23; // @[RxPipelineHandler.scala 143:35]
  wire [34:0] _in_beat_content_T = {in_beat_place, 3'h0}; // @[RxPipelineHandler.scala 144:57]
  wire [511:0] _in_beat_content_T_1 = in_reg_tdata >> _in_beat_content_T; // @[RxPipelineHandler.scala 144:39]
  wire [31:0] in_beat_content = _in_beat_content_T_1[31:0]; // @[RxPipelineHandler.scala 144:65]
  wire [31:0] _match_found_T_5 = {previous_tdata_reg[7:0],previous_tdata_reg[15:8],previous_tdata_reg[23:16],
    previous_tdata_reg[31:24]}; // @[Cat.scala 31:58]
  wire [31:0] match_found_a = _match_found_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 123:18]
  wire [31:0] match_found_b = io_in_extern_config_c2h_match_arg_0 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 124:18]
  wire  _match_found_T_27 = io_in_extern_config_c2h_match_op[0] & match_found_a == match_found_b |
    io_in_extern_config_c2h_match_op[1] & match_found_a > match_found_b | io_in_extern_config_c2h_match_op[2] &
    match_found_a < match_found_b | ~io_in_extern_config_c2h_match_op[0] & ~io_in_extern_config_c2h_match_op[1] & ~
    io_in_extern_config_c2h_match_op[2] & match_found_a != match_found_b; // @[RxPipelineHandler.scala 125:65]
  wire [15:0] _T_4 = cur_place_reg - 16'h4; // @[RxPipelineHandler.scala 154:44]
  wire [31:0] _GEN_25 = {{16'd0}, _T_4}; // @[RxPipelineHandler.scala 154:27]
  wire [31:0] _match_found_T_33 = {in_beat_content[7:0],in_beat_content[15:8],in_beat_content[23:16],in_beat_content[31:
    24]}; // @[Cat.scala 31:58]
  wire [31:0] match_found_a_1 = _match_found_T_33 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 123:18]
  wire  _match_found_T_55 = io_in_extern_config_c2h_match_op[0] & match_found_a_1 == match_found_b |
    io_in_extern_config_c2h_match_op[1] & match_found_a_1 > match_found_b | io_in_extern_config_c2h_match_op[2] &
    match_found_a_1 < match_found_b | ~io_in_extern_config_c2h_match_op[0] & ~io_in_extern_config_c2h_match_op[1] & ~
    io_in_extern_config_c2h_match_op[2] & match_found_a_1 != match_found_b; // @[RxPipelineHandler.scala 125:65]
  wire [31:0] _GEN_26 = {{16'd0}, cur_place_reg}; // @[RxPipelineHandler.scala 158:33]
  wire  _previous_tdata_reg_T_3 = ~in_beat_place[1] & in_beat_place[0]; // @[RxPipelineHandler.scala 161:60]
  wire [31:0] _previous_tdata_reg_T_5 = _previous_tdata_reg_T_3 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [31:0] _previous_tdata_reg_T_8 = {io_in_tdata[7:0],in_reg_tdata[511:488]}; // @[Cat.scala 31:58]
  wire [31:0] _previous_tdata_reg_T_9 = _previous_tdata_reg_T_5 & _previous_tdata_reg_T_8; // @[RxPipelineHandler.scala 161:81]
  wire  _previous_tdata_reg_T_13 = in_beat_place[1] & ~in_beat_place[0]; // @[RxPipelineHandler.scala 162:60]
  wire [31:0] _previous_tdata_reg_T_15 = _previous_tdata_reg_T_13 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [31:0] _previous_tdata_reg_T_18 = {io_in_tdata[15:0],in_reg_tdata[511:496]}; // @[Cat.scala 31:58]
  wire [31:0] _previous_tdata_reg_T_19 = _previous_tdata_reg_T_15 & _previous_tdata_reg_T_18; // @[RxPipelineHandler.scala 162:81]
  wire [31:0] _previous_tdata_reg_T_20 = _previous_tdata_reg_T_9 | _previous_tdata_reg_T_19; // @[RxPipelineHandler.scala 161:130]
  wire  _previous_tdata_reg_T_23 = in_beat_place[1] & in_beat_place[0]; // @[RxPipelineHandler.scala 163:60]
  wire [31:0] _previous_tdata_reg_T_25 = _previous_tdata_reg_T_23 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [31:0] _previous_tdata_reg_T_28 = {io_in_tdata[23:0],in_reg_tdata[511:504]}; // @[Cat.scala 31:58]
  wire [31:0] _previous_tdata_reg_T_29 = _previous_tdata_reg_T_25 & _previous_tdata_reg_T_28; // @[RxPipelineHandler.scala 163:81]
  wire [31:0] _previous_tdata_reg_T_30 = _previous_tdata_reg_T_20 | _previous_tdata_reg_T_29; // @[RxPipelineHandler.scala 162:130]
  wire  _GEN_5 = io_in_extern_config_c2h_match_arg_2 < _GEN_26 & ~in_reg_tlast | match_continue_reg; // @[RxPipelineHandler.scala 158:67 160:30 135:35]
  wire [31:0] _GEN_6 = io_in_extern_config_c2h_match_arg_2 < _GEN_26 & ~in_reg_tlast ? _previous_tdata_reg_T_30 :
    previous_tdata_reg; // @[RxPipelineHandler.scala 158:67 161:30 137:35]
  wire  _GEN_7 = io_in_extern_config_c2h_match_arg_2 <= _GEN_25 & _match_found_T_55; // @[RxPipelineHandler.scala 154:51 156:23]
  wire  _GEN_8 = io_in_extern_config_c2h_match_arg_2 <= _GEN_25 ? match_continue_reg : _GEN_5; // @[RxPipelineHandler.scala 135:35 154:51]
  wire [31:0] _GEN_9 = io_in_extern_config_c2h_match_arg_2 <= _GEN_25 ? previous_tdata_reg : _GEN_6; // @[RxPipelineHandler.scala 137:35 154:51]
  wire  _GEN_10 = io_in_extern_config_c2h_match_arg_2 >= _GEN_23 & _GEN_7; // @[RxPipelineHandler.scala 152:54]
  wire  _GEN_14 = match_continue_reg ? _match_found_T_27 : _GEN_10; // @[RxPipelineHandler.scala 147:31 150:19]
  wire  match_found = in_shake_hand & _GEN_14; // @[RxPipelineHandler.scala 146:24]
  wire [5:0] _io_out_rx_info_qid_T_1 = match_found_reg | match_found ? 6'h1 : in_reg_rx_info_qid; // @[RxPipelineHandler.scala 178:30]
  assign io_in_tready = io_out_tready | ~in_reg_used_reg; // @[RxPipelineHandler.scala 30:47]
  assign io_out_tdata = in_reg_r[513:2]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_tvalid = in_reg_tvalid & in_reg_used_reg; // @[RxPipelineHandler.scala 27:47]
  assign io_out_tlast = in_reg_r[0]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_tuser = in_reg_r[514]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_tlen = in_reg_r[600:585]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_qid = io_in_extern_config_c2h_match_op[3] ? _io_out_rx_info_qid_T_1 : in_reg_rx_info_qid; // @[RxPipelineHandler.scala 177:22 178:24 29:18]
  assign io_out_rx_info_ip_chksum = in_reg_r[578:547]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_tcp_chksum = in_reg_r[546:515]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_extern_config_c2h_match_op = io_in_extern_config_c2h_match_op; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_0 = io_in_extern_config_c2h_match_arg_0; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_1 = io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_2 = io_in_extern_config_c2h_match_arg_2; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_3 = io_in_extern_config_c2h_match_arg_3; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_4 = io_in_extern_config_c2h_match_arg_4; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_5 = io_in_extern_config_c2h_match_arg_5; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_6 = io_in_extern_config_c2h_match_arg_6; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_7 = io_in_extern_config_c2h_match_arg_7; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_8 = io_in_extern_config_c2h_match_arg_8; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_9 = io_in_extern_config_c2h_match_arg_9; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_10 = io_in_extern_config_c2h_match_arg_10; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_11 = io_in_extern_config_c2h_match_arg_11; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_12 = io_in_extern_config_c2h_match_arg_12; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_13 = io_in_extern_config_c2h_match_arg_13; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_14 = io_in_extern_config_c2h_match_arg_14; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_15 = io_in_extern_config_c2h_match_arg_15; // @[RxPipelineHandler.scala 31:24]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 28:20]
      in_reg_r <= 601'h1; // @[Reg.scala 28:20]
    end else if (in_shake_hand) begin // @[Reg.scala 29:18]
      in_reg_r <= _in_reg_T_1; // @[Reg.scala 29:22]
    end
    if (reset) begin // @[RxPipelineHandler.scala 18:32]
      in_reg_used_reg <= 1'h0; // @[RxPipelineHandler.scala 18:32]
    end else begin
      in_reg_used_reg <= _GEN_3;
    end
    if (reset) begin // @[RxPipelineHandler.scala 134:32]
      match_found_reg <= 1'h0; // @[RxPipelineHandler.scala 134:32]
    end else if (in_shake_hand) begin // @[RxPipelineHandler.scala 146:24]
      if (in_reg_tlast) begin // @[RxPipelineHandler.scala 166:24]
        match_found_reg <= 1'h0; // @[RxPipelineHandler.scala 167:23]
      end else if (~match_found_reg) begin // @[RxPipelineHandler.scala 168:34]
        match_found_reg <= match_found; // @[RxPipelineHandler.scala 169:23]
      end
    end
    if (reset) begin // @[RxPipelineHandler.scala 135:35]
      match_continue_reg <= 1'h0; // @[RxPipelineHandler.scala 135:35]
    end else if (in_shake_hand) begin // @[RxPipelineHandler.scala 146:24]
      if (match_continue_reg) begin // @[RxPipelineHandler.scala 147:31]
        match_continue_reg <= 1'h0; // @[RxPipelineHandler.scala 149:26]
      end else if (io_in_extern_config_c2h_match_arg_2 >= _GEN_23) begin // @[RxPipelineHandler.scala 152:54]
        match_continue_reg <= _GEN_8;
      end
    end
    if (reset) begin // @[RxPipelineHandler.scala 137:35]
      previous_tdata_reg <= 32'h0; // @[RxPipelineHandler.scala 137:35]
    end else if (in_shake_hand) begin // @[RxPipelineHandler.scala 146:24]
      if (!(match_continue_reg)) begin // @[RxPipelineHandler.scala 147:31]
        if (io_in_extern_config_c2h_match_arg_2 >= _GEN_23) begin // @[RxPipelineHandler.scala 152:54]
          previous_tdata_reg <= _GEN_9;
        end
      end
    end
    if (reset) begin // @[Reg.scala 28:20]
      cur_place_reg <= 16'h0; // @[Reg.scala 28:20]
    end else if (in_shake_hand) begin // @[Reg.scala 29:18]
      if (io_in_rx_info_tlen[5:0] == 6'h0) begin // @[RxPipelineHandler.scala 139:22]
        cur_place_reg <= io_in_rx_info_tlen;
      end else begin
        cur_place_reg <= _cur_place_T_5;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {19{`RANDOM}};
  in_reg_r = _RAND_0[600:0];
  _RAND_1 = {1{`RANDOM}};
  in_reg_used_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  match_found_reg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  match_continue_reg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  previous_tdata_reg = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  cur_place_reg = _RAND_5[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ReduceOrSync(
  input   clock,
  input   io_in_vec_0,
  input   io_in_vec_1,
  input   io_in_vec_2,
  input   io_in_vec_3,
  input   io_in_vec_4,
  input   io_in_vec_5,
  input   io_in_vec_6,
  input   io_in_vec_7,
  input   io_in_vec_8,
  input   io_in_vec_9,
  input   io_in_vec_10,
  input   io_in_vec_11,
  input   io_in_vec_12,
  input   io_in_vec_13,
  input   io_in_vec_14,
  input   io_in_vec_15,
  input   io_in_vec_16,
  input   io_in_vec_17,
  input   io_in_vec_18,
  input   io_in_vec_19,
  input   io_in_vec_20,
  input   io_in_vec_21,
  input   io_in_vec_22,
  input   io_in_vec_23,
  input   io_in_vec_24,
  input   io_in_vec_25,
  input   io_in_vec_26,
  input   io_in_vec_27,
  input   io_in_vec_28,
  input   io_in_vec_29,
  input   io_in_vec_30,
  input   io_in_vec_31,
  input   io_in_vec_32,
  input   io_in_vec_33,
  input   io_in_vec_34,
  input   io_in_vec_35,
  input   io_in_vec_36,
  input   io_in_vec_37,
  input   io_in_vec_38,
  input   io_in_vec_39,
  input   io_in_vec_40,
  input   io_in_vec_41,
  input   io_in_vec_42,
  input   io_in_vec_43,
  input   io_in_vec_44,
  input   io_in_vec_45,
  input   io_in_vec_46,
  input   io_in_vec_47,
  input   io_in_vec_48,
  input   io_in_vec_49,
  input   io_in_vec_50,
  input   io_in_vec_51,
  input   io_in_vec_52,
  input   io_in_vec_53,
  input   io_in_vec_54,
  input   io_in_vec_55,
  input   io_in_vec_56,
  input   io_in_vec_57,
  input   io_in_vec_58,
  input   io_in_vec_59,
  input   io_in_vec_60,
  input   io_in_vec_61,
  input   io_in_vec_62,
  input   io_in_vec_63,
  output  io_out_sum
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg  cal_reg_0; // @[Misc.scala 174:20]
  reg  cal_reg_1; // @[Misc.scala 174:20]
  reg  cal_reg_2; // @[Misc.scala 174:20]
  reg  cal_reg_3; // @[Misc.scala 174:20]
  reg  cal_reg_4; // @[Misc.scala 174:20]
  reg  cal_reg_5; // @[Misc.scala 174:20]
  reg  cal_reg_6; // @[Misc.scala 174:20]
  reg  cal_reg_7; // @[Misc.scala 174:20]
  assign io_out_sum = cal_reg_0 | cal_reg_1 | (cal_reg_2 | cal_reg_3) | (cal_reg_4 | cal_reg_5 | (cal_reg_6 | cal_reg_7)
    ); // @[Misc.scala 198:37]
  always @(posedge clock) begin
    cal_reg_0 <= io_in_vec_0 | io_in_vec_1 | (io_in_vec_2 | io_in_vec_3) | (io_in_vec_4 | io_in_vec_5 | (io_in_vec_6 |
      io_in_vec_7)); // @[Misc.scala 196:42]
    cal_reg_1 <= io_in_vec_8 | io_in_vec_9 | (io_in_vec_10 | io_in_vec_11) | (io_in_vec_12 | io_in_vec_13 | (
      io_in_vec_14 | io_in_vec_15)); // @[Misc.scala 196:42]
    cal_reg_2 <= io_in_vec_16 | io_in_vec_17 | (io_in_vec_18 | io_in_vec_19) | (io_in_vec_20 | io_in_vec_21 | (
      io_in_vec_22 | io_in_vec_23)); // @[Misc.scala 196:42]
    cal_reg_3 <= io_in_vec_24 | io_in_vec_25 | (io_in_vec_26 | io_in_vec_27) | (io_in_vec_28 | io_in_vec_29 | (
      io_in_vec_30 | io_in_vec_31)); // @[Misc.scala 196:42]
    cal_reg_4 <= io_in_vec_32 | io_in_vec_33 | (io_in_vec_34 | io_in_vec_35) | (io_in_vec_36 | io_in_vec_37 | (
      io_in_vec_38 | io_in_vec_39)); // @[Misc.scala 196:42]
    cal_reg_5 <= io_in_vec_40 | io_in_vec_41 | (io_in_vec_42 | io_in_vec_43) | (io_in_vec_44 | io_in_vec_45 | (
      io_in_vec_46 | io_in_vec_47)); // @[Misc.scala 196:42]
    cal_reg_6 <= io_in_vec_48 | io_in_vec_49 | (io_in_vec_50 | io_in_vec_51) | (io_in_vec_52 | io_in_vec_53 | (
      io_in_vec_54 | io_in_vec_55)); // @[Misc.scala 196:42]
    cal_reg_7 <= io_in_vec_56 | io_in_vec_57 | (io_in_vec_58 | io_in_vec_59) | (io_in_vec_60 | io_in_vec_61 | (
      io_in_vec_62 | io_in_vec_63)); // @[Misc.scala 196:42]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cal_reg_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  cal_reg_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  cal_reg_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cal_reg_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  cal_reg_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  cal_reg_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  cal_reg_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  cal_reg_7 = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RxStrSearcher(
  input          clock,
  input          reset,
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input          io_in_tuser,
  input  [15:0]  io_in_rx_info_tlen,
  input  [5:0]   io_in_rx_info_qid,
  input  [31:0]  io_in_rx_info_ip_chksum,
  input  [31:0]  io_in_rx_info_tcp_chksum,
  input  [7:0]   io_in_extern_config_c2h_match_op,
  input  [31:0]  io_in_extern_config_c2h_match_arg_0,
  input  [31:0]  io_in_extern_config_c2h_match_arg_1,
  input  [31:0]  io_in_extern_config_c2h_match_arg_2,
  input  [31:0]  io_in_extern_config_c2h_match_arg_3,
  input  [31:0]  io_in_extern_config_c2h_match_arg_4,
  input  [31:0]  io_in_extern_config_c2h_match_arg_5,
  input  [31:0]  io_in_extern_config_c2h_match_arg_6,
  input  [31:0]  io_in_extern_config_c2h_match_arg_7,
  input  [31:0]  io_in_extern_config_c2h_match_arg_8,
  input  [31:0]  io_in_extern_config_c2h_match_arg_9,
  input  [31:0]  io_in_extern_config_c2h_match_arg_10,
  input  [31:0]  io_in_extern_config_c2h_match_arg_11,
  input  [31:0]  io_in_extern_config_c2h_match_arg_12,
  input  [31:0]  io_in_extern_config_c2h_match_arg_13,
  input  [31:0]  io_in_extern_config_c2h_match_arg_14,
  input  [31:0]  io_in_extern_config_c2h_match_arg_15,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  output         io_out_tuser,
  output [15:0]  io_out_rx_info_tlen,
  output [5:0]   io_out_rx_info_qid,
  output [31:0]  io_out_rx_info_ip_chksum,
  output [31:0]  io_out_rx_info_tcp_chksum,
  output [7:0]   io_out_extern_config_c2h_match_op,
  output [31:0]  io_out_extern_config_c2h_match_arg_0,
  output [31:0]  io_out_extern_config_c2h_match_arg_1,
  output [31:0]  io_out_extern_config_c2h_match_arg_2,
  output [31:0]  io_out_extern_config_c2h_match_arg_3,
  output [31:0]  io_out_extern_config_c2h_match_arg_4,
  output [31:0]  io_out_extern_config_c2h_match_arg_5,
  output [31:0]  io_out_extern_config_c2h_match_arg_6,
  output [31:0]  io_out_extern_config_c2h_match_arg_7,
  output [31:0]  io_out_extern_config_c2h_match_arg_8,
  output [31:0]  io_out_extern_config_c2h_match_arg_9,
  output [31:0]  io_out_extern_config_c2h_match_arg_10,
  output [31:0]  io_out_extern_config_c2h_match_arg_11,
  output [31:0]  io_out_extern_config_c2h_match_arg_12,
  output [31:0]  io_out_extern_config_c2h_match_arg_13,
  output [31:0]  io_out_extern_config_c2h_match_arg_14,
  output [31:0]  io_out_extern_config_c2h_match_arg_15
);
`ifdef RANDOMIZE_REG_INIT
  reg [607:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  search_or_sync_clock; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_0; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_1; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_2; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_3; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_4; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_5; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_6; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_7; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_8; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_9; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_10; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_11; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_12; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_13; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_14; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_15; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_16; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_17; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_18; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_19; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_20; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_21; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_22; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_23; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_24; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_25; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_26; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_27; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_28; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_29; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_30; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_31; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_32; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_33; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_34; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_35; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_36; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_37; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_38; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_39; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_40; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_41; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_42; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_43; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_44; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_45; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_46; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_47; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_48; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_49; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_50; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_51; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_52; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_53; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_54; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_55; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_56; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_57; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_58; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_59; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_60; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_61; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_62; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_in_vec_63; // @[RxPipelineHandler.scala 207:30]
  wire  search_or_sync_io_out_sum; // @[RxPipelineHandler.scala 207:30]
  wire  in_shake_hand = io_in_tready & io_in_tvalid; // @[RxPipelineHandler.scala 12:38]
  wire  out_shake_hand = io_out_tready & io_out_tvalid; // @[RxPipelineHandler.scala 13:38]
  wire [600:0] _in_reg_T_1 = {io_in_rx_info_tlen,io_in_rx_info_qid,io_in_rx_info_ip_chksum,io_in_rx_info_tcp_chksum,
    io_in_tuser,io_in_tdata,io_in_tvalid,io_in_tlast}; // @[Cat.scala 31:58]
  reg [600:0] in_reg_r; // @[Reg.scala 28:20]
  wire  in_reg_tlast = in_reg_r[0]; // @[RxPipelineHandler.scala 14:128]
  wire  in_reg_tvalid = in_reg_r[1]; // @[RxPipelineHandler.scala 14:128]
  wire [511:0] in_reg_tdata = in_reg_r[513:2]; // @[RxPipelineHandler.scala 14:128]
  wire [5:0] in_reg_rx_info_qid = in_reg_r[584:579]; // @[RxPipelineHandler.scala 14:128]
  reg  first_beat_reg; // @[Reg.scala 28:20]
  wire  _GEN_1 = in_shake_hand ? in_reg_tlast : first_beat_reg; // @[Reg.scala 29:18 28:20 29:22]
  reg  in_reg_used_reg; // @[RxPipelineHandler.scala 18:32]
  wire  _GEN_2 = out_shake_hand ? 1'h0 : in_reg_used_reg; // @[RxPipelineHandler.scala 21:29 22:21 18:32]
  wire  _GEN_3 = in_shake_hand | _GEN_2; // @[RxPipelineHandler.scala 19:23 20:21]
  wire [31:0] search_value = io_in_extern_config_c2h_match_arg_0 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 190:37]
  reg [23:0] previous_tdata_reg; // @[RxPipelineHandler.scala 196:35]
  wire [511:0] cal_tdata = in_shake_hand ? io_in_tdata : in_reg_tdata; // @[RxPipelineHandler.scala 197:22]
  wire [31:0] _search_vec_0_T_5 = {cal_tdata[7:0],cal_tdata[15:8],cal_tdata[23:16],cal_tdata[31:24]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_0_T_6 = _search_vec_0_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_1_T_5 = {cal_tdata[15:8],cal_tdata[23:16],cal_tdata[31:24],cal_tdata[39:32]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_1_T_6 = _search_vec_1_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_2_T_5 = {cal_tdata[23:16],cal_tdata[31:24],cal_tdata[39:32],cal_tdata[47:40]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_2_T_6 = _search_vec_2_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_3_T_5 = {cal_tdata[31:24],cal_tdata[39:32],cal_tdata[47:40],cal_tdata[55:48]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_3_T_6 = _search_vec_3_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_4_T_5 = {cal_tdata[39:32],cal_tdata[47:40],cal_tdata[55:48],cal_tdata[63:56]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_4_T_6 = _search_vec_4_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_5_T_5 = {cal_tdata[47:40],cal_tdata[55:48],cal_tdata[63:56],cal_tdata[71:64]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_5_T_6 = _search_vec_5_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_6_T_5 = {cal_tdata[55:48],cal_tdata[63:56],cal_tdata[71:64],cal_tdata[79:72]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_6_T_6 = _search_vec_6_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_7_T_5 = {cal_tdata[63:56],cal_tdata[71:64],cal_tdata[79:72],cal_tdata[87:80]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_7_T_6 = _search_vec_7_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_8_T_5 = {cal_tdata[71:64],cal_tdata[79:72],cal_tdata[87:80],cal_tdata[95:88]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_8_T_6 = _search_vec_8_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_9_T_5 = {cal_tdata[79:72],cal_tdata[87:80],cal_tdata[95:88],cal_tdata[103:96]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_9_T_6 = _search_vec_9_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_10_T_5 = {cal_tdata[87:80],cal_tdata[95:88],cal_tdata[103:96],cal_tdata[111:104]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_10_T_6 = _search_vec_10_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_11_T_5 = {cal_tdata[95:88],cal_tdata[103:96],cal_tdata[111:104],cal_tdata[119:112]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_11_T_6 = _search_vec_11_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_12_T_5 = {cal_tdata[103:96],cal_tdata[111:104],cal_tdata[119:112],cal_tdata[127:120]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_12_T_6 = _search_vec_12_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_13_T_5 = {cal_tdata[111:104],cal_tdata[119:112],cal_tdata[127:120],cal_tdata[135:128]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_13_T_6 = _search_vec_13_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_14_T_5 = {cal_tdata[119:112],cal_tdata[127:120],cal_tdata[135:128],cal_tdata[143:136]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_14_T_6 = _search_vec_14_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_15_T_5 = {cal_tdata[127:120],cal_tdata[135:128],cal_tdata[143:136],cal_tdata[151:144]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_15_T_6 = _search_vec_15_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_16_T_5 = {cal_tdata[135:128],cal_tdata[143:136],cal_tdata[151:144],cal_tdata[159:152]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_16_T_6 = _search_vec_16_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_17_T_5 = {cal_tdata[143:136],cal_tdata[151:144],cal_tdata[159:152],cal_tdata[167:160]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_17_T_6 = _search_vec_17_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_18_T_5 = {cal_tdata[151:144],cal_tdata[159:152],cal_tdata[167:160],cal_tdata[175:168]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_18_T_6 = _search_vec_18_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_19_T_5 = {cal_tdata[159:152],cal_tdata[167:160],cal_tdata[175:168],cal_tdata[183:176]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_19_T_6 = _search_vec_19_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_20_T_5 = {cal_tdata[167:160],cal_tdata[175:168],cal_tdata[183:176],cal_tdata[191:184]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_20_T_6 = _search_vec_20_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_21_T_5 = {cal_tdata[175:168],cal_tdata[183:176],cal_tdata[191:184],cal_tdata[199:192]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_21_T_6 = _search_vec_21_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_22_T_5 = {cal_tdata[183:176],cal_tdata[191:184],cal_tdata[199:192],cal_tdata[207:200]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_22_T_6 = _search_vec_22_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_23_T_5 = {cal_tdata[191:184],cal_tdata[199:192],cal_tdata[207:200],cal_tdata[215:208]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_23_T_6 = _search_vec_23_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_24_T_5 = {cal_tdata[199:192],cal_tdata[207:200],cal_tdata[215:208],cal_tdata[223:216]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_24_T_6 = _search_vec_24_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_25_T_5 = {cal_tdata[207:200],cal_tdata[215:208],cal_tdata[223:216],cal_tdata[231:224]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_25_T_6 = _search_vec_25_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_26_T_5 = {cal_tdata[215:208],cal_tdata[223:216],cal_tdata[231:224],cal_tdata[239:232]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_26_T_6 = _search_vec_26_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_27_T_5 = {cal_tdata[223:216],cal_tdata[231:224],cal_tdata[239:232],cal_tdata[247:240]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_27_T_6 = _search_vec_27_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_28_T_5 = {cal_tdata[231:224],cal_tdata[239:232],cal_tdata[247:240],cal_tdata[255:248]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_28_T_6 = _search_vec_28_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_29_T_5 = {cal_tdata[239:232],cal_tdata[247:240],cal_tdata[255:248],cal_tdata[263:256]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_29_T_6 = _search_vec_29_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_30_T_5 = {cal_tdata[247:240],cal_tdata[255:248],cal_tdata[263:256],cal_tdata[271:264]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_30_T_6 = _search_vec_30_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_31_T_5 = {cal_tdata[255:248],cal_tdata[263:256],cal_tdata[271:264],cal_tdata[279:272]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_31_T_6 = _search_vec_31_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_32_T_5 = {cal_tdata[263:256],cal_tdata[271:264],cal_tdata[279:272],cal_tdata[287:280]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_32_T_6 = _search_vec_32_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_33_T_5 = {cal_tdata[271:264],cal_tdata[279:272],cal_tdata[287:280],cal_tdata[295:288]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_33_T_6 = _search_vec_33_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_34_T_5 = {cal_tdata[279:272],cal_tdata[287:280],cal_tdata[295:288],cal_tdata[303:296]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_34_T_6 = _search_vec_34_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_35_T_5 = {cal_tdata[287:280],cal_tdata[295:288],cal_tdata[303:296],cal_tdata[311:304]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_35_T_6 = _search_vec_35_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_36_T_5 = {cal_tdata[295:288],cal_tdata[303:296],cal_tdata[311:304],cal_tdata[319:312]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_36_T_6 = _search_vec_36_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_37_T_5 = {cal_tdata[303:296],cal_tdata[311:304],cal_tdata[319:312],cal_tdata[327:320]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_37_T_6 = _search_vec_37_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_38_T_5 = {cal_tdata[311:304],cal_tdata[319:312],cal_tdata[327:320],cal_tdata[335:328]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_38_T_6 = _search_vec_38_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_39_T_5 = {cal_tdata[319:312],cal_tdata[327:320],cal_tdata[335:328],cal_tdata[343:336]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_39_T_6 = _search_vec_39_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_40_T_5 = {cal_tdata[327:320],cal_tdata[335:328],cal_tdata[343:336],cal_tdata[351:344]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_40_T_6 = _search_vec_40_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_41_T_5 = {cal_tdata[335:328],cal_tdata[343:336],cal_tdata[351:344],cal_tdata[359:352]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_41_T_6 = _search_vec_41_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_42_T_5 = {cal_tdata[343:336],cal_tdata[351:344],cal_tdata[359:352],cal_tdata[367:360]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_42_T_6 = _search_vec_42_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_43_T_5 = {cal_tdata[351:344],cal_tdata[359:352],cal_tdata[367:360],cal_tdata[375:368]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_43_T_6 = _search_vec_43_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_44_T_5 = {cal_tdata[359:352],cal_tdata[367:360],cal_tdata[375:368],cal_tdata[383:376]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_44_T_6 = _search_vec_44_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_45_T_5 = {cal_tdata[367:360],cal_tdata[375:368],cal_tdata[383:376],cal_tdata[391:384]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_45_T_6 = _search_vec_45_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_46_T_5 = {cal_tdata[375:368],cal_tdata[383:376],cal_tdata[391:384],cal_tdata[399:392]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_46_T_6 = _search_vec_46_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_47_T_5 = {cal_tdata[383:376],cal_tdata[391:384],cal_tdata[399:392],cal_tdata[407:400]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_47_T_6 = _search_vec_47_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_48_T_5 = {cal_tdata[391:384],cal_tdata[399:392],cal_tdata[407:400],cal_tdata[415:408]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_48_T_6 = _search_vec_48_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_49_T_5 = {cal_tdata[399:392],cal_tdata[407:400],cal_tdata[415:408],cal_tdata[423:416]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_49_T_6 = _search_vec_49_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_50_T_5 = {cal_tdata[407:400],cal_tdata[415:408],cal_tdata[423:416],cal_tdata[431:424]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_50_T_6 = _search_vec_50_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_51_T_5 = {cal_tdata[415:408],cal_tdata[423:416],cal_tdata[431:424],cal_tdata[439:432]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_51_T_6 = _search_vec_51_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_52_T_5 = {cal_tdata[423:416],cal_tdata[431:424],cal_tdata[439:432],cal_tdata[447:440]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_52_T_6 = _search_vec_52_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_53_T_5 = {cal_tdata[431:424],cal_tdata[439:432],cal_tdata[447:440],cal_tdata[455:448]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_53_T_6 = _search_vec_53_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_54_T_5 = {cal_tdata[439:432],cal_tdata[447:440],cal_tdata[455:448],cal_tdata[463:456]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_54_T_6 = _search_vec_54_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_55_T_5 = {cal_tdata[447:440],cal_tdata[455:448],cal_tdata[463:456],cal_tdata[471:464]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_55_T_6 = _search_vec_55_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_56_T_5 = {cal_tdata[455:448],cal_tdata[463:456],cal_tdata[471:464],cal_tdata[479:472]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_56_T_6 = _search_vec_56_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_57_T_5 = {cal_tdata[463:456],cal_tdata[471:464],cal_tdata[479:472],cal_tdata[487:480]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_57_T_6 = _search_vec_57_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_58_T_5 = {cal_tdata[471:464],cal_tdata[479:472],cal_tdata[487:480],cal_tdata[495:488]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_58_T_6 = _search_vec_58_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_59_T_5 = {cal_tdata[479:472],cal_tdata[487:480],cal_tdata[495:488],cal_tdata[503:496]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_59_T_6 = _search_vec_59_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_60_T_5 = {cal_tdata[487:480],cal_tdata[495:488],cal_tdata[503:496],cal_tdata[511:504]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_60_T_6 = _search_vec_60_T_5 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire [31:0] _search_vec_61_T_3 = {io_in_tdata[7:0],in_reg_tdata[511:488]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_61_T_6 = {in_reg_tdata[7:0],previous_tdata_reg}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_61_T_7 = in_shake_hand ? _search_vec_61_T_3 : _search_vec_61_T_6; // @[RxPipelineHandler.scala 203:86]
  wire [31:0] _search_vec_61_T_12 = {_search_vec_61_T_7[7:0],_search_vec_61_T_7[15:8],_search_vec_61_T_7[23:16],
    _search_vec_61_T_7[31:24]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_61_T_13 = _search_vec_61_T_12 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire  _search_vec_61_T_14 = _search_vec_61_T_13 == search_value; // @[RxPipelineHandler.scala 193:42]
  wire [31:0] _search_vec_62_T_3 = {io_in_tdata[15:0],in_reg_tdata[511:496]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_62_T_6 = {in_reg_tdata[15:0],previous_tdata_reg[23:8]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_62_T_7 = in_shake_hand ? _search_vec_62_T_3 : _search_vec_62_T_6; // @[RxPipelineHandler.scala 204:86]
  wire [31:0] _search_vec_62_T_12 = {_search_vec_62_T_7[7:0],_search_vec_62_T_7[15:8],_search_vec_62_T_7[23:16],
    _search_vec_62_T_7[31:24]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_62_T_13 = _search_vec_62_T_12 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire  _search_vec_62_T_14 = _search_vec_62_T_13 == search_value; // @[RxPipelineHandler.scala 193:42]
  wire [31:0] _search_vec_63_T_3 = {io_in_tdata[23:0],in_reg_tdata[511:504]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_63_T_6 = {in_reg_tdata[23:0],previous_tdata_reg[23:16]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_63_T_7 = in_shake_hand ? _search_vec_63_T_3 : _search_vec_63_T_6; // @[RxPipelineHandler.scala 205:86]
  wire [31:0] _search_vec_63_T_12 = {_search_vec_63_T_7[7:0],_search_vec_63_T_7[15:8],_search_vec_63_T_7[23:16],
    _search_vec_63_T_7[31:24]}; // @[Cat.scala 31:58]
  wire [31:0] _search_vec_63_T_13 = _search_vec_63_T_12 & io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 193:27]
  wire  _search_vec_63_T_14 = _search_vec_63_T_13 == search_value; // @[RxPipelineHandler.scala 193:42]
  reg  search_found_reg; // @[RxPipelineHandler.scala 214:33]
  wire  search_or_result = search_or_sync_io_out_sum; // @[RxPipelineHandler.scala 208:30 212:20]
  wire [5:0] _io_out_rx_info_qid_T_1 = search_found_reg | search_or_result ? 6'h1 : in_reg_rx_info_qid; // @[RxPipelineHandler.scala 230:30]
  ReduceOrSync search_or_sync ( // @[RxPipelineHandler.scala 207:30]
    .clock(search_or_sync_clock),
    .io_in_vec_0(search_or_sync_io_in_vec_0),
    .io_in_vec_1(search_or_sync_io_in_vec_1),
    .io_in_vec_2(search_or_sync_io_in_vec_2),
    .io_in_vec_3(search_or_sync_io_in_vec_3),
    .io_in_vec_4(search_or_sync_io_in_vec_4),
    .io_in_vec_5(search_or_sync_io_in_vec_5),
    .io_in_vec_6(search_or_sync_io_in_vec_6),
    .io_in_vec_7(search_or_sync_io_in_vec_7),
    .io_in_vec_8(search_or_sync_io_in_vec_8),
    .io_in_vec_9(search_or_sync_io_in_vec_9),
    .io_in_vec_10(search_or_sync_io_in_vec_10),
    .io_in_vec_11(search_or_sync_io_in_vec_11),
    .io_in_vec_12(search_or_sync_io_in_vec_12),
    .io_in_vec_13(search_or_sync_io_in_vec_13),
    .io_in_vec_14(search_or_sync_io_in_vec_14),
    .io_in_vec_15(search_or_sync_io_in_vec_15),
    .io_in_vec_16(search_or_sync_io_in_vec_16),
    .io_in_vec_17(search_or_sync_io_in_vec_17),
    .io_in_vec_18(search_or_sync_io_in_vec_18),
    .io_in_vec_19(search_or_sync_io_in_vec_19),
    .io_in_vec_20(search_or_sync_io_in_vec_20),
    .io_in_vec_21(search_or_sync_io_in_vec_21),
    .io_in_vec_22(search_or_sync_io_in_vec_22),
    .io_in_vec_23(search_or_sync_io_in_vec_23),
    .io_in_vec_24(search_or_sync_io_in_vec_24),
    .io_in_vec_25(search_or_sync_io_in_vec_25),
    .io_in_vec_26(search_or_sync_io_in_vec_26),
    .io_in_vec_27(search_or_sync_io_in_vec_27),
    .io_in_vec_28(search_or_sync_io_in_vec_28),
    .io_in_vec_29(search_or_sync_io_in_vec_29),
    .io_in_vec_30(search_or_sync_io_in_vec_30),
    .io_in_vec_31(search_or_sync_io_in_vec_31),
    .io_in_vec_32(search_or_sync_io_in_vec_32),
    .io_in_vec_33(search_or_sync_io_in_vec_33),
    .io_in_vec_34(search_or_sync_io_in_vec_34),
    .io_in_vec_35(search_or_sync_io_in_vec_35),
    .io_in_vec_36(search_or_sync_io_in_vec_36),
    .io_in_vec_37(search_or_sync_io_in_vec_37),
    .io_in_vec_38(search_or_sync_io_in_vec_38),
    .io_in_vec_39(search_or_sync_io_in_vec_39),
    .io_in_vec_40(search_or_sync_io_in_vec_40),
    .io_in_vec_41(search_or_sync_io_in_vec_41),
    .io_in_vec_42(search_or_sync_io_in_vec_42),
    .io_in_vec_43(search_or_sync_io_in_vec_43),
    .io_in_vec_44(search_or_sync_io_in_vec_44),
    .io_in_vec_45(search_or_sync_io_in_vec_45),
    .io_in_vec_46(search_or_sync_io_in_vec_46),
    .io_in_vec_47(search_or_sync_io_in_vec_47),
    .io_in_vec_48(search_or_sync_io_in_vec_48),
    .io_in_vec_49(search_or_sync_io_in_vec_49),
    .io_in_vec_50(search_or_sync_io_in_vec_50),
    .io_in_vec_51(search_or_sync_io_in_vec_51),
    .io_in_vec_52(search_or_sync_io_in_vec_52),
    .io_in_vec_53(search_or_sync_io_in_vec_53),
    .io_in_vec_54(search_or_sync_io_in_vec_54),
    .io_in_vec_55(search_or_sync_io_in_vec_55),
    .io_in_vec_56(search_or_sync_io_in_vec_56),
    .io_in_vec_57(search_or_sync_io_in_vec_57),
    .io_in_vec_58(search_or_sync_io_in_vec_58),
    .io_in_vec_59(search_or_sync_io_in_vec_59),
    .io_in_vec_60(search_or_sync_io_in_vec_60),
    .io_in_vec_61(search_or_sync_io_in_vec_61),
    .io_in_vec_62(search_or_sync_io_in_vec_62),
    .io_in_vec_63(search_or_sync_io_in_vec_63),
    .io_out_sum(search_or_sync_io_out_sum)
  );
  assign io_in_tready = io_out_tready | ~in_reg_used_reg; // @[RxPipelineHandler.scala 30:47]
  assign io_out_tdata = in_reg_r[513:2]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_tvalid = in_reg_tvalid & in_reg_used_reg; // @[RxPipelineHandler.scala 27:47]
  assign io_out_tlast = in_reg_r[0]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_tuser = in_reg_r[514]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_tlen = in_reg_r[600:585]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_qid = io_in_extern_config_c2h_match_op[4] ? _io_out_rx_info_qid_T_1 : in_reg_rx_info_qid; // @[RxPipelineHandler.scala 229:23 230:24 29:18]
  assign io_out_rx_info_ip_chksum = in_reg_r[578:547]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_tcp_chksum = in_reg_r[546:515]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_extern_config_c2h_match_op = io_in_extern_config_c2h_match_op; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_0 = io_in_extern_config_c2h_match_arg_0; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_1 = io_in_extern_config_c2h_match_arg_1; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_2 = io_in_extern_config_c2h_match_arg_2; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_3 = io_in_extern_config_c2h_match_arg_3; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_4 = io_in_extern_config_c2h_match_arg_4; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_5 = io_in_extern_config_c2h_match_arg_5; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_6 = io_in_extern_config_c2h_match_arg_6; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_7 = io_in_extern_config_c2h_match_arg_7; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_8 = io_in_extern_config_c2h_match_arg_8; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_9 = io_in_extern_config_c2h_match_arg_9; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_10 = io_in_extern_config_c2h_match_arg_10; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_11 = io_in_extern_config_c2h_match_arg_11; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_12 = io_in_extern_config_c2h_match_arg_12; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_13 = io_in_extern_config_c2h_match_arg_13; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_14 = io_in_extern_config_c2h_match_arg_14; // @[RxPipelineHandler.scala 31:24]
  assign io_out_extern_config_c2h_match_arg_15 = io_in_extern_config_c2h_match_arg_15; // @[RxPipelineHandler.scala 31:24]
  assign search_or_sync_clock = clock;
  assign search_or_sync_io_in_vec_0 = _search_vec_0_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_1 = _search_vec_1_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_2 = _search_vec_2_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_3 = _search_vec_3_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_4 = _search_vec_4_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_5 = _search_vec_5_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_6 = _search_vec_6_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_7 = _search_vec_7_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_8 = _search_vec_8_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_9 = _search_vec_9_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_10 = _search_vec_10_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_11 = _search_vec_11_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_12 = _search_vec_12_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_13 = _search_vec_13_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_14 = _search_vec_14_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_15 = _search_vec_15_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_16 = _search_vec_16_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_17 = _search_vec_17_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_18 = _search_vec_18_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_19 = _search_vec_19_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_20 = _search_vec_20_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_21 = _search_vec_21_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_22 = _search_vec_22_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_23 = _search_vec_23_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_24 = _search_vec_24_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_25 = _search_vec_25_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_26 = _search_vec_26_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_27 = _search_vec_27_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_28 = _search_vec_28_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_29 = _search_vec_29_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_30 = _search_vec_30_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_31 = _search_vec_31_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_32 = _search_vec_32_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_33 = _search_vec_33_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_34 = _search_vec_34_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_35 = _search_vec_35_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_36 = _search_vec_36_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_37 = _search_vec_37_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_38 = _search_vec_38_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_39 = _search_vec_39_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_40 = _search_vec_40_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_41 = _search_vec_41_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_42 = _search_vec_42_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_43 = _search_vec_43_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_44 = _search_vec_44_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_45 = _search_vec_45_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_46 = _search_vec_46_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_47 = _search_vec_47_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_48 = _search_vec_48_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_49 = _search_vec_49_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_50 = _search_vec_50_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_51 = _search_vec_51_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_52 = _search_vec_52_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_53 = _search_vec_53_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_54 = _search_vec_54_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_55 = _search_vec_55_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_56 = _search_vec_56_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_57 = _search_vec_57_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_58 = _search_vec_58_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_59 = _search_vec_59_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_60 = _search_vec_60_T_6 == search_value; // @[RxPipelineHandler.scala 193:42]
  assign search_or_sync_io_in_vec_61 = _GEN_1 ? 1'h0 : _search_vec_61_T_14; // @[RxPipelineHandler.scala 203:24]
  assign search_or_sync_io_in_vec_62 = _GEN_1 ? 1'h0 : _search_vec_62_T_14; // @[RxPipelineHandler.scala 204:24]
  assign search_or_sync_io_in_vec_63 = _GEN_1 ? 1'h0 : _search_vec_63_T_14; // @[RxPipelineHandler.scala 205:24]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 28:20]
      in_reg_r <= 601'h1; // @[Reg.scala 28:20]
    end else if (in_shake_hand) begin // @[Reg.scala 29:18]
      in_reg_r <= _in_reg_T_1; // @[Reg.scala 29:22]
    end
    first_beat_reg <= reset | _GEN_1; // @[Reg.scala 28:{20,20}]
    if (reset) begin // @[RxPipelineHandler.scala 18:32]
      in_reg_used_reg <= 1'h0; // @[RxPipelineHandler.scala 18:32]
    end else begin
      in_reg_used_reg <= _GEN_3;
    end
    if (reset) begin // @[RxPipelineHandler.scala 196:35]
      previous_tdata_reg <= 24'h0; // @[RxPipelineHandler.scala 196:35]
    end else if (in_shake_hand) begin // @[RxPipelineHandler.scala 215:24]
      previous_tdata_reg <= in_reg_tdata[511:488]; // @[RxPipelineHandler.scala 216:24]
    end
    if (reset) begin // @[RxPipelineHandler.scala 214:33]
      search_found_reg <= 1'h0; // @[RxPipelineHandler.scala 214:33]
    end else if (in_shake_hand) begin // @[RxPipelineHandler.scala 215:24]
      if (in_reg_tlast) begin // @[RxPipelineHandler.scala 217:25]
        search_found_reg <= 1'h0; // @[RxPipelineHandler.scala 218:24]
      end else if (~search_found_reg) begin // @[RxPipelineHandler.scala 219:36]
        search_found_reg <= search_or_result; // @[RxPipelineHandler.scala 220:24]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {19{`RANDOM}};
  in_reg_r = _RAND_0[600:0];
  _RAND_1 = {1{`RANDOM}};
  first_beat_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  in_reg_used_reg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  previous_tdata_reg = _RAND_3[23:0];
  _RAND_4 = {1{`RANDOM}};
  search_found_reg = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RxPipeline(
  input          clock,
  input          reset,
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input          io_in_tuser,
  input  [15:0]  io_in_rx_info_tlen,
  input  [7:0]   io_in_extern_config_c2h_match_op,
  input  [31:0]  io_in_extern_config_c2h_match_arg_0,
  input  [31:0]  io_in_extern_config_c2h_match_arg_1,
  input  [31:0]  io_in_extern_config_c2h_match_arg_2,
  input  [31:0]  io_in_extern_config_c2h_match_arg_3,
  input  [31:0]  io_in_extern_config_c2h_match_arg_4,
  input  [31:0]  io_in_extern_config_c2h_match_arg_5,
  input  [31:0]  io_in_extern_config_c2h_match_arg_6,
  input  [31:0]  io_in_extern_config_c2h_match_arg_7,
  input  [31:0]  io_in_extern_config_c2h_match_arg_8,
  input  [31:0]  io_in_extern_config_c2h_match_arg_9,
  input  [31:0]  io_in_extern_config_c2h_match_arg_10,
  input  [31:0]  io_in_extern_config_c2h_match_arg_11,
  input  [31:0]  io_in_extern_config_c2h_match_arg_12,
  input  [31:0]  io_in_extern_config_c2h_match_arg_13,
  input  [31:0]  io_in_extern_config_c2h_match_arg_14,
  input  [31:0]  io_in_extern_config_c2h_match_arg_15,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  output         io_out_tuser,
  output [15:0]  io_out_rx_info_tlen,
  output [5:0]   io_out_rx_info_qid,
  output [31:0]  io_out_rx_info_ip_chksum,
  output [31:0]  io_out_rx_info_tcp_chksum,
  output [7:0]   io_out_extern_config_c2h_match_op
);
  wire  rx_re_searcher_clock; // @[RxPipeline.scala 33:30]
  wire  rx_re_searcher_reset; // @[RxPipeline.scala 33:30]
  wire [511:0] rx_re_searcher_io_in_tdata; // @[RxPipeline.scala 33:30]
  wire  rx_re_searcher_io_in_tvalid; // @[RxPipeline.scala 33:30]
  wire  rx_re_searcher_io_in_tready; // @[RxPipeline.scala 33:30]
  wire  rx_re_searcher_io_in_tlast; // @[RxPipeline.scala 33:30]
  wire  rx_re_searcher_io_in_tuser; // @[RxPipeline.scala 33:30]
  wire [15:0] rx_re_searcher_io_in_rx_info_tlen; // @[RxPipeline.scala 33:30]
  wire [5:0] rx_re_searcher_io_in_rx_info_qid; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_rx_info_ip_chksum; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_rx_info_tcp_chksum; // @[RxPipeline.scala 33:30]
  wire [7:0] rx_re_searcher_io_in_extern_config_c2h_match_op; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 33:30]
  wire [511:0] rx_re_searcher_io_out_tdata; // @[RxPipeline.scala 33:30]
  wire  rx_re_searcher_io_out_tvalid; // @[RxPipeline.scala 33:30]
  wire  rx_re_searcher_io_out_tready; // @[RxPipeline.scala 33:30]
  wire  rx_re_searcher_io_out_tlast; // @[RxPipeline.scala 33:30]
  wire  rx_re_searcher_io_out_tuser; // @[RxPipeline.scala 33:30]
  wire [15:0] rx_re_searcher_io_out_rx_info_tlen; // @[RxPipeline.scala 33:30]
  wire [5:0] rx_re_searcher_io_out_rx_info_qid; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_out_rx_info_ip_chksum; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_out_rx_info_tcp_chksum; // @[RxPipeline.scala 33:30]
  wire [7:0] rx_re_searcher_io_out_extern_config_c2h_match_op; // @[RxPipeline.scala 33:30]
  wire  rx_chksum_verifier_clock; // @[RxPipeline.scala 38:34]
  wire  rx_chksum_verifier_reset; // @[RxPipeline.scala 38:34]
  wire [511:0] rx_chksum_verifier_io_in_tdata; // @[RxPipeline.scala 38:34]
  wire  rx_chksum_verifier_io_in_tvalid; // @[RxPipeline.scala 38:34]
  wire  rx_chksum_verifier_io_in_tready; // @[RxPipeline.scala 38:34]
  wire  rx_chksum_verifier_io_in_tlast; // @[RxPipeline.scala 38:34]
  wire  rx_chksum_verifier_io_in_tuser; // @[RxPipeline.scala 38:34]
  wire [15:0] rx_chksum_verifier_io_in_rx_info_tlen; // @[RxPipeline.scala 38:34]
  wire [7:0] rx_chksum_verifier_io_in_extern_config_c2h_match_op; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_in_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 38:34]
  wire [511:0] rx_chksum_verifier_io_out_tdata; // @[RxPipeline.scala 38:34]
  wire  rx_chksum_verifier_io_out_tvalid; // @[RxPipeline.scala 38:34]
  wire  rx_chksum_verifier_io_out_tready; // @[RxPipeline.scala 38:34]
  wire  rx_chksum_verifier_io_out_tlast; // @[RxPipeline.scala 38:34]
  wire  rx_chksum_verifier_io_out_tuser; // @[RxPipeline.scala 38:34]
  wire [15:0] rx_chksum_verifier_io_out_rx_info_tlen; // @[RxPipeline.scala 38:34]
  wire [5:0] rx_chksum_verifier_io_out_rx_info_qid; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_rx_info_ip_chksum; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_rx_info_tcp_chksum; // @[RxPipeline.scala 38:34]
  wire [7:0] rx_chksum_verifier_io_out_extern_config_c2h_match_op; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 38:34]
  wire [31:0] rx_chksum_verifier_io_out_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 38:34]
  wire  rx_rss_hasher_clock; // @[RxPipeline.scala 39:29]
  wire  rx_rss_hasher_reset; // @[RxPipeline.scala 39:29]
  wire [511:0] rx_rss_hasher_io_in_tdata; // @[RxPipeline.scala 39:29]
  wire  rx_rss_hasher_io_in_tvalid; // @[RxPipeline.scala 39:29]
  wire  rx_rss_hasher_io_in_tready; // @[RxPipeline.scala 39:29]
  wire  rx_rss_hasher_io_in_tlast; // @[RxPipeline.scala 39:29]
  wire  rx_rss_hasher_io_in_tuser; // @[RxPipeline.scala 39:29]
  wire [15:0] rx_rss_hasher_io_in_rx_info_tlen; // @[RxPipeline.scala 39:29]
  wire [5:0] rx_rss_hasher_io_in_rx_info_qid; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_rx_info_ip_chksum; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_rx_info_tcp_chksum; // @[RxPipeline.scala 39:29]
  wire [7:0] rx_rss_hasher_io_in_extern_config_c2h_match_op; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_in_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 39:29]
  wire [511:0] rx_rss_hasher_io_out_tdata; // @[RxPipeline.scala 39:29]
  wire  rx_rss_hasher_io_out_tvalid; // @[RxPipeline.scala 39:29]
  wire  rx_rss_hasher_io_out_tready; // @[RxPipeline.scala 39:29]
  wire  rx_rss_hasher_io_out_tlast; // @[RxPipeline.scala 39:29]
  wire  rx_rss_hasher_io_out_tuser; // @[RxPipeline.scala 39:29]
  wire [15:0] rx_rss_hasher_io_out_rx_info_tlen; // @[RxPipeline.scala 39:29]
  wire [5:0] rx_rss_hasher_io_out_rx_info_qid; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_rx_info_ip_chksum; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_rx_info_tcp_chksum; // @[RxPipeline.scala 39:29]
  wire [7:0] rx_rss_hasher_io_out_extern_config_c2h_match_op; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 39:29]
  wire [31:0] rx_rss_hasher_io_out_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 39:29]
  wire  rx_string_matcher_clock; // @[RxPipeline.scala 40:36]
  wire  rx_string_matcher_reset; // @[RxPipeline.scala 40:36]
  wire [511:0] rx_string_matcher_io_in_tdata; // @[RxPipeline.scala 40:36]
  wire  rx_string_matcher_io_in_tvalid; // @[RxPipeline.scala 40:36]
  wire  rx_string_matcher_io_in_tready; // @[RxPipeline.scala 40:36]
  wire  rx_string_matcher_io_in_tlast; // @[RxPipeline.scala 40:36]
  wire  rx_string_matcher_io_in_tuser; // @[RxPipeline.scala 40:36]
  wire [15:0] rx_string_matcher_io_in_rx_info_tlen; // @[RxPipeline.scala 40:36]
  wire [5:0] rx_string_matcher_io_in_rx_info_qid; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_rx_info_ip_chksum; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_rx_info_tcp_chksum; // @[RxPipeline.scala 40:36]
  wire [7:0] rx_string_matcher_io_in_extern_config_c2h_match_op; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_in_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 40:36]
  wire [511:0] rx_string_matcher_io_out_tdata; // @[RxPipeline.scala 40:36]
  wire  rx_string_matcher_io_out_tvalid; // @[RxPipeline.scala 40:36]
  wire  rx_string_matcher_io_out_tready; // @[RxPipeline.scala 40:36]
  wire  rx_string_matcher_io_out_tlast; // @[RxPipeline.scala 40:36]
  wire  rx_string_matcher_io_out_tuser; // @[RxPipeline.scala 40:36]
  wire [15:0] rx_string_matcher_io_out_rx_info_tlen; // @[RxPipeline.scala 40:36]
  wire [5:0] rx_string_matcher_io_out_rx_info_qid; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_rx_info_ip_chksum; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_rx_info_tcp_chksum; // @[RxPipeline.scala 40:36]
  wire [7:0] rx_string_matcher_io_out_extern_config_c2h_match_op; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 40:36]
  wire [31:0] rx_string_matcher_io_out_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 40:36]
  wire  rx_string_searcher_clock; // @[RxPipeline.scala 41:39]
  wire  rx_string_searcher_reset; // @[RxPipeline.scala 41:39]
  wire [511:0] rx_string_searcher_io_in_tdata; // @[RxPipeline.scala 41:39]
  wire  rx_string_searcher_io_in_tvalid; // @[RxPipeline.scala 41:39]
  wire  rx_string_searcher_io_in_tready; // @[RxPipeline.scala 41:39]
  wire  rx_string_searcher_io_in_tlast; // @[RxPipeline.scala 41:39]
  wire  rx_string_searcher_io_in_tuser; // @[RxPipeline.scala 41:39]
  wire [15:0] rx_string_searcher_io_in_rx_info_tlen; // @[RxPipeline.scala 41:39]
  wire [5:0] rx_string_searcher_io_in_rx_info_qid; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_rx_info_ip_chksum; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_rx_info_tcp_chksum; // @[RxPipeline.scala 41:39]
  wire [7:0] rx_string_searcher_io_in_extern_config_c2h_match_op; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_in_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 41:39]
  wire [511:0] rx_string_searcher_io_out_tdata; // @[RxPipeline.scala 41:39]
  wire  rx_string_searcher_io_out_tvalid; // @[RxPipeline.scala 41:39]
  wire  rx_string_searcher_io_out_tready; // @[RxPipeline.scala 41:39]
  wire  rx_string_searcher_io_out_tlast; // @[RxPipeline.scala 41:39]
  wire  rx_string_searcher_io_out_tuser; // @[RxPipeline.scala 41:39]
  wire [15:0] rx_string_searcher_io_out_rx_info_tlen; // @[RxPipeline.scala 41:39]
  wire [5:0] rx_string_searcher_io_out_rx_info_qid; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_rx_info_ip_chksum; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_rx_info_tcp_chksum; // @[RxPipeline.scala 41:39]
  wire [7:0] rx_string_searcher_io_out_extern_config_c2h_match_op; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 41:39]
  wire [31:0] rx_string_searcher_io_out_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 41:39]
  RxRESearcher rx_re_searcher ( // @[RxPipeline.scala 33:30]
    .clock(rx_re_searcher_clock),
    .reset(rx_re_searcher_reset),
    .io_in_tdata(rx_re_searcher_io_in_tdata),
    .io_in_tvalid(rx_re_searcher_io_in_tvalid),
    .io_in_tready(rx_re_searcher_io_in_tready),
    .io_in_tlast(rx_re_searcher_io_in_tlast),
    .io_in_tuser(rx_re_searcher_io_in_tuser),
    .io_in_rx_info_tlen(rx_re_searcher_io_in_rx_info_tlen),
    .io_in_rx_info_qid(rx_re_searcher_io_in_rx_info_qid),
    .io_in_rx_info_ip_chksum(rx_re_searcher_io_in_rx_info_ip_chksum),
    .io_in_rx_info_tcp_chksum(rx_re_searcher_io_in_rx_info_tcp_chksum),
    .io_in_extern_config_c2h_match_op(rx_re_searcher_io_in_extern_config_c2h_match_op),
    .io_in_extern_config_c2h_match_arg_0(rx_re_searcher_io_in_extern_config_c2h_match_arg_0),
    .io_in_extern_config_c2h_match_arg_1(rx_re_searcher_io_in_extern_config_c2h_match_arg_1),
    .io_in_extern_config_c2h_match_arg_2(rx_re_searcher_io_in_extern_config_c2h_match_arg_2),
    .io_in_extern_config_c2h_match_arg_3(rx_re_searcher_io_in_extern_config_c2h_match_arg_3),
    .io_in_extern_config_c2h_match_arg_4(rx_re_searcher_io_in_extern_config_c2h_match_arg_4),
    .io_in_extern_config_c2h_match_arg_5(rx_re_searcher_io_in_extern_config_c2h_match_arg_5),
    .io_in_extern_config_c2h_match_arg_6(rx_re_searcher_io_in_extern_config_c2h_match_arg_6),
    .io_in_extern_config_c2h_match_arg_7(rx_re_searcher_io_in_extern_config_c2h_match_arg_7),
    .io_in_extern_config_c2h_match_arg_8(rx_re_searcher_io_in_extern_config_c2h_match_arg_8),
    .io_in_extern_config_c2h_match_arg_9(rx_re_searcher_io_in_extern_config_c2h_match_arg_9),
    .io_in_extern_config_c2h_match_arg_10(rx_re_searcher_io_in_extern_config_c2h_match_arg_10),
    .io_in_extern_config_c2h_match_arg_11(rx_re_searcher_io_in_extern_config_c2h_match_arg_11),
    .io_in_extern_config_c2h_match_arg_12(rx_re_searcher_io_in_extern_config_c2h_match_arg_12),
    .io_in_extern_config_c2h_match_arg_13(rx_re_searcher_io_in_extern_config_c2h_match_arg_13),
    .io_in_extern_config_c2h_match_arg_14(rx_re_searcher_io_in_extern_config_c2h_match_arg_14),
    .io_in_extern_config_c2h_match_arg_15(rx_re_searcher_io_in_extern_config_c2h_match_arg_15),
    .io_out_tdata(rx_re_searcher_io_out_tdata),
    .io_out_tvalid(rx_re_searcher_io_out_tvalid),
    .io_out_tready(rx_re_searcher_io_out_tready),
    .io_out_tlast(rx_re_searcher_io_out_tlast),
    .io_out_tuser(rx_re_searcher_io_out_tuser),
    .io_out_rx_info_tlen(rx_re_searcher_io_out_rx_info_tlen),
    .io_out_rx_info_qid(rx_re_searcher_io_out_rx_info_qid),
    .io_out_rx_info_ip_chksum(rx_re_searcher_io_out_rx_info_ip_chksum),
    .io_out_rx_info_tcp_chksum(rx_re_searcher_io_out_rx_info_tcp_chksum),
    .io_out_extern_config_c2h_match_op(rx_re_searcher_io_out_extern_config_c2h_match_op)
  );
  RxChksumVerifier rx_chksum_verifier ( // @[RxPipeline.scala 38:34]
    .clock(rx_chksum_verifier_clock),
    .reset(rx_chksum_verifier_reset),
    .io_in_tdata(rx_chksum_verifier_io_in_tdata),
    .io_in_tvalid(rx_chksum_verifier_io_in_tvalid),
    .io_in_tready(rx_chksum_verifier_io_in_tready),
    .io_in_tlast(rx_chksum_verifier_io_in_tlast),
    .io_in_tuser(rx_chksum_verifier_io_in_tuser),
    .io_in_rx_info_tlen(rx_chksum_verifier_io_in_rx_info_tlen),
    .io_in_extern_config_c2h_match_op(rx_chksum_verifier_io_in_extern_config_c2h_match_op),
    .io_in_extern_config_c2h_match_arg_0(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_0),
    .io_in_extern_config_c2h_match_arg_1(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_1),
    .io_in_extern_config_c2h_match_arg_2(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_2),
    .io_in_extern_config_c2h_match_arg_3(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_3),
    .io_in_extern_config_c2h_match_arg_4(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_4),
    .io_in_extern_config_c2h_match_arg_5(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_5),
    .io_in_extern_config_c2h_match_arg_6(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_6),
    .io_in_extern_config_c2h_match_arg_7(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_7),
    .io_in_extern_config_c2h_match_arg_8(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_8),
    .io_in_extern_config_c2h_match_arg_9(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_9),
    .io_in_extern_config_c2h_match_arg_10(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_10),
    .io_in_extern_config_c2h_match_arg_11(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_11),
    .io_in_extern_config_c2h_match_arg_12(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_12),
    .io_in_extern_config_c2h_match_arg_13(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_13),
    .io_in_extern_config_c2h_match_arg_14(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_14),
    .io_in_extern_config_c2h_match_arg_15(rx_chksum_verifier_io_in_extern_config_c2h_match_arg_15),
    .io_out_tdata(rx_chksum_verifier_io_out_tdata),
    .io_out_tvalid(rx_chksum_verifier_io_out_tvalid),
    .io_out_tready(rx_chksum_verifier_io_out_tready),
    .io_out_tlast(rx_chksum_verifier_io_out_tlast),
    .io_out_tuser(rx_chksum_verifier_io_out_tuser),
    .io_out_rx_info_tlen(rx_chksum_verifier_io_out_rx_info_tlen),
    .io_out_rx_info_qid(rx_chksum_verifier_io_out_rx_info_qid),
    .io_out_rx_info_ip_chksum(rx_chksum_verifier_io_out_rx_info_ip_chksum),
    .io_out_rx_info_tcp_chksum(rx_chksum_verifier_io_out_rx_info_tcp_chksum),
    .io_out_extern_config_c2h_match_op(rx_chksum_verifier_io_out_extern_config_c2h_match_op),
    .io_out_extern_config_c2h_match_arg_0(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_0),
    .io_out_extern_config_c2h_match_arg_1(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_1),
    .io_out_extern_config_c2h_match_arg_2(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_2),
    .io_out_extern_config_c2h_match_arg_3(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_3),
    .io_out_extern_config_c2h_match_arg_4(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_4),
    .io_out_extern_config_c2h_match_arg_5(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_5),
    .io_out_extern_config_c2h_match_arg_6(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_6),
    .io_out_extern_config_c2h_match_arg_7(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_7),
    .io_out_extern_config_c2h_match_arg_8(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_8),
    .io_out_extern_config_c2h_match_arg_9(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_9),
    .io_out_extern_config_c2h_match_arg_10(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_10),
    .io_out_extern_config_c2h_match_arg_11(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_11),
    .io_out_extern_config_c2h_match_arg_12(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_12),
    .io_out_extern_config_c2h_match_arg_13(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_13),
    .io_out_extern_config_c2h_match_arg_14(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_14),
    .io_out_extern_config_c2h_match_arg_15(rx_chksum_verifier_io_out_extern_config_c2h_match_arg_15)
  );
  RxRSSHasher rx_rss_hasher ( // @[RxPipeline.scala 39:29]
    .clock(rx_rss_hasher_clock),
    .reset(rx_rss_hasher_reset),
    .io_in_tdata(rx_rss_hasher_io_in_tdata),
    .io_in_tvalid(rx_rss_hasher_io_in_tvalid),
    .io_in_tready(rx_rss_hasher_io_in_tready),
    .io_in_tlast(rx_rss_hasher_io_in_tlast),
    .io_in_tuser(rx_rss_hasher_io_in_tuser),
    .io_in_rx_info_tlen(rx_rss_hasher_io_in_rx_info_tlen),
    .io_in_rx_info_qid(rx_rss_hasher_io_in_rx_info_qid),
    .io_in_rx_info_ip_chksum(rx_rss_hasher_io_in_rx_info_ip_chksum),
    .io_in_rx_info_tcp_chksum(rx_rss_hasher_io_in_rx_info_tcp_chksum),
    .io_in_extern_config_c2h_match_op(rx_rss_hasher_io_in_extern_config_c2h_match_op),
    .io_in_extern_config_c2h_match_arg_0(rx_rss_hasher_io_in_extern_config_c2h_match_arg_0),
    .io_in_extern_config_c2h_match_arg_1(rx_rss_hasher_io_in_extern_config_c2h_match_arg_1),
    .io_in_extern_config_c2h_match_arg_2(rx_rss_hasher_io_in_extern_config_c2h_match_arg_2),
    .io_in_extern_config_c2h_match_arg_3(rx_rss_hasher_io_in_extern_config_c2h_match_arg_3),
    .io_in_extern_config_c2h_match_arg_4(rx_rss_hasher_io_in_extern_config_c2h_match_arg_4),
    .io_in_extern_config_c2h_match_arg_5(rx_rss_hasher_io_in_extern_config_c2h_match_arg_5),
    .io_in_extern_config_c2h_match_arg_6(rx_rss_hasher_io_in_extern_config_c2h_match_arg_6),
    .io_in_extern_config_c2h_match_arg_7(rx_rss_hasher_io_in_extern_config_c2h_match_arg_7),
    .io_in_extern_config_c2h_match_arg_8(rx_rss_hasher_io_in_extern_config_c2h_match_arg_8),
    .io_in_extern_config_c2h_match_arg_9(rx_rss_hasher_io_in_extern_config_c2h_match_arg_9),
    .io_in_extern_config_c2h_match_arg_10(rx_rss_hasher_io_in_extern_config_c2h_match_arg_10),
    .io_in_extern_config_c2h_match_arg_11(rx_rss_hasher_io_in_extern_config_c2h_match_arg_11),
    .io_in_extern_config_c2h_match_arg_12(rx_rss_hasher_io_in_extern_config_c2h_match_arg_12),
    .io_in_extern_config_c2h_match_arg_13(rx_rss_hasher_io_in_extern_config_c2h_match_arg_13),
    .io_in_extern_config_c2h_match_arg_14(rx_rss_hasher_io_in_extern_config_c2h_match_arg_14),
    .io_in_extern_config_c2h_match_arg_15(rx_rss_hasher_io_in_extern_config_c2h_match_arg_15),
    .io_out_tdata(rx_rss_hasher_io_out_tdata),
    .io_out_tvalid(rx_rss_hasher_io_out_tvalid),
    .io_out_tready(rx_rss_hasher_io_out_tready),
    .io_out_tlast(rx_rss_hasher_io_out_tlast),
    .io_out_tuser(rx_rss_hasher_io_out_tuser),
    .io_out_rx_info_tlen(rx_rss_hasher_io_out_rx_info_tlen),
    .io_out_rx_info_qid(rx_rss_hasher_io_out_rx_info_qid),
    .io_out_rx_info_ip_chksum(rx_rss_hasher_io_out_rx_info_ip_chksum),
    .io_out_rx_info_tcp_chksum(rx_rss_hasher_io_out_rx_info_tcp_chksum),
    .io_out_extern_config_c2h_match_op(rx_rss_hasher_io_out_extern_config_c2h_match_op),
    .io_out_extern_config_c2h_match_arg_0(rx_rss_hasher_io_out_extern_config_c2h_match_arg_0),
    .io_out_extern_config_c2h_match_arg_1(rx_rss_hasher_io_out_extern_config_c2h_match_arg_1),
    .io_out_extern_config_c2h_match_arg_2(rx_rss_hasher_io_out_extern_config_c2h_match_arg_2),
    .io_out_extern_config_c2h_match_arg_3(rx_rss_hasher_io_out_extern_config_c2h_match_arg_3),
    .io_out_extern_config_c2h_match_arg_4(rx_rss_hasher_io_out_extern_config_c2h_match_arg_4),
    .io_out_extern_config_c2h_match_arg_5(rx_rss_hasher_io_out_extern_config_c2h_match_arg_5),
    .io_out_extern_config_c2h_match_arg_6(rx_rss_hasher_io_out_extern_config_c2h_match_arg_6),
    .io_out_extern_config_c2h_match_arg_7(rx_rss_hasher_io_out_extern_config_c2h_match_arg_7),
    .io_out_extern_config_c2h_match_arg_8(rx_rss_hasher_io_out_extern_config_c2h_match_arg_8),
    .io_out_extern_config_c2h_match_arg_9(rx_rss_hasher_io_out_extern_config_c2h_match_arg_9),
    .io_out_extern_config_c2h_match_arg_10(rx_rss_hasher_io_out_extern_config_c2h_match_arg_10),
    .io_out_extern_config_c2h_match_arg_11(rx_rss_hasher_io_out_extern_config_c2h_match_arg_11),
    .io_out_extern_config_c2h_match_arg_12(rx_rss_hasher_io_out_extern_config_c2h_match_arg_12),
    .io_out_extern_config_c2h_match_arg_13(rx_rss_hasher_io_out_extern_config_c2h_match_arg_13),
    .io_out_extern_config_c2h_match_arg_14(rx_rss_hasher_io_out_extern_config_c2h_match_arg_14),
    .io_out_extern_config_c2h_match_arg_15(rx_rss_hasher_io_out_extern_config_c2h_match_arg_15)
  );
  RxStrMatcher rx_string_matcher ( // @[RxPipeline.scala 40:36]
    .clock(rx_string_matcher_clock),
    .reset(rx_string_matcher_reset),
    .io_in_tdata(rx_string_matcher_io_in_tdata),
    .io_in_tvalid(rx_string_matcher_io_in_tvalid),
    .io_in_tready(rx_string_matcher_io_in_tready),
    .io_in_tlast(rx_string_matcher_io_in_tlast),
    .io_in_tuser(rx_string_matcher_io_in_tuser),
    .io_in_rx_info_tlen(rx_string_matcher_io_in_rx_info_tlen),
    .io_in_rx_info_qid(rx_string_matcher_io_in_rx_info_qid),
    .io_in_rx_info_ip_chksum(rx_string_matcher_io_in_rx_info_ip_chksum),
    .io_in_rx_info_tcp_chksum(rx_string_matcher_io_in_rx_info_tcp_chksum),
    .io_in_extern_config_c2h_match_op(rx_string_matcher_io_in_extern_config_c2h_match_op),
    .io_in_extern_config_c2h_match_arg_0(rx_string_matcher_io_in_extern_config_c2h_match_arg_0),
    .io_in_extern_config_c2h_match_arg_1(rx_string_matcher_io_in_extern_config_c2h_match_arg_1),
    .io_in_extern_config_c2h_match_arg_2(rx_string_matcher_io_in_extern_config_c2h_match_arg_2),
    .io_in_extern_config_c2h_match_arg_3(rx_string_matcher_io_in_extern_config_c2h_match_arg_3),
    .io_in_extern_config_c2h_match_arg_4(rx_string_matcher_io_in_extern_config_c2h_match_arg_4),
    .io_in_extern_config_c2h_match_arg_5(rx_string_matcher_io_in_extern_config_c2h_match_arg_5),
    .io_in_extern_config_c2h_match_arg_6(rx_string_matcher_io_in_extern_config_c2h_match_arg_6),
    .io_in_extern_config_c2h_match_arg_7(rx_string_matcher_io_in_extern_config_c2h_match_arg_7),
    .io_in_extern_config_c2h_match_arg_8(rx_string_matcher_io_in_extern_config_c2h_match_arg_8),
    .io_in_extern_config_c2h_match_arg_9(rx_string_matcher_io_in_extern_config_c2h_match_arg_9),
    .io_in_extern_config_c2h_match_arg_10(rx_string_matcher_io_in_extern_config_c2h_match_arg_10),
    .io_in_extern_config_c2h_match_arg_11(rx_string_matcher_io_in_extern_config_c2h_match_arg_11),
    .io_in_extern_config_c2h_match_arg_12(rx_string_matcher_io_in_extern_config_c2h_match_arg_12),
    .io_in_extern_config_c2h_match_arg_13(rx_string_matcher_io_in_extern_config_c2h_match_arg_13),
    .io_in_extern_config_c2h_match_arg_14(rx_string_matcher_io_in_extern_config_c2h_match_arg_14),
    .io_in_extern_config_c2h_match_arg_15(rx_string_matcher_io_in_extern_config_c2h_match_arg_15),
    .io_out_tdata(rx_string_matcher_io_out_tdata),
    .io_out_tvalid(rx_string_matcher_io_out_tvalid),
    .io_out_tready(rx_string_matcher_io_out_tready),
    .io_out_tlast(rx_string_matcher_io_out_tlast),
    .io_out_tuser(rx_string_matcher_io_out_tuser),
    .io_out_rx_info_tlen(rx_string_matcher_io_out_rx_info_tlen),
    .io_out_rx_info_qid(rx_string_matcher_io_out_rx_info_qid),
    .io_out_rx_info_ip_chksum(rx_string_matcher_io_out_rx_info_ip_chksum),
    .io_out_rx_info_tcp_chksum(rx_string_matcher_io_out_rx_info_tcp_chksum),
    .io_out_extern_config_c2h_match_op(rx_string_matcher_io_out_extern_config_c2h_match_op),
    .io_out_extern_config_c2h_match_arg_0(rx_string_matcher_io_out_extern_config_c2h_match_arg_0),
    .io_out_extern_config_c2h_match_arg_1(rx_string_matcher_io_out_extern_config_c2h_match_arg_1),
    .io_out_extern_config_c2h_match_arg_2(rx_string_matcher_io_out_extern_config_c2h_match_arg_2),
    .io_out_extern_config_c2h_match_arg_3(rx_string_matcher_io_out_extern_config_c2h_match_arg_3),
    .io_out_extern_config_c2h_match_arg_4(rx_string_matcher_io_out_extern_config_c2h_match_arg_4),
    .io_out_extern_config_c2h_match_arg_5(rx_string_matcher_io_out_extern_config_c2h_match_arg_5),
    .io_out_extern_config_c2h_match_arg_6(rx_string_matcher_io_out_extern_config_c2h_match_arg_6),
    .io_out_extern_config_c2h_match_arg_7(rx_string_matcher_io_out_extern_config_c2h_match_arg_7),
    .io_out_extern_config_c2h_match_arg_8(rx_string_matcher_io_out_extern_config_c2h_match_arg_8),
    .io_out_extern_config_c2h_match_arg_9(rx_string_matcher_io_out_extern_config_c2h_match_arg_9),
    .io_out_extern_config_c2h_match_arg_10(rx_string_matcher_io_out_extern_config_c2h_match_arg_10),
    .io_out_extern_config_c2h_match_arg_11(rx_string_matcher_io_out_extern_config_c2h_match_arg_11),
    .io_out_extern_config_c2h_match_arg_12(rx_string_matcher_io_out_extern_config_c2h_match_arg_12),
    .io_out_extern_config_c2h_match_arg_13(rx_string_matcher_io_out_extern_config_c2h_match_arg_13),
    .io_out_extern_config_c2h_match_arg_14(rx_string_matcher_io_out_extern_config_c2h_match_arg_14),
    .io_out_extern_config_c2h_match_arg_15(rx_string_matcher_io_out_extern_config_c2h_match_arg_15)
  );
  RxStrSearcher rx_string_searcher ( // @[RxPipeline.scala 41:39]
    .clock(rx_string_searcher_clock),
    .reset(rx_string_searcher_reset),
    .io_in_tdata(rx_string_searcher_io_in_tdata),
    .io_in_tvalid(rx_string_searcher_io_in_tvalid),
    .io_in_tready(rx_string_searcher_io_in_tready),
    .io_in_tlast(rx_string_searcher_io_in_tlast),
    .io_in_tuser(rx_string_searcher_io_in_tuser),
    .io_in_rx_info_tlen(rx_string_searcher_io_in_rx_info_tlen),
    .io_in_rx_info_qid(rx_string_searcher_io_in_rx_info_qid),
    .io_in_rx_info_ip_chksum(rx_string_searcher_io_in_rx_info_ip_chksum),
    .io_in_rx_info_tcp_chksum(rx_string_searcher_io_in_rx_info_tcp_chksum),
    .io_in_extern_config_c2h_match_op(rx_string_searcher_io_in_extern_config_c2h_match_op),
    .io_in_extern_config_c2h_match_arg_0(rx_string_searcher_io_in_extern_config_c2h_match_arg_0),
    .io_in_extern_config_c2h_match_arg_1(rx_string_searcher_io_in_extern_config_c2h_match_arg_1),
    .io_in_extern_config_c2h_match_arg_2(rx_string_searcher_io_in_extern_config_c2h_match_arg_2),
    .io_in_extern_config_c2h_match_arg_3(rx_string_searcher_io_in_extern_config_c2h_match_arg_3),
    .io_in_extern_config_c2h_match_arg_4(rx_string_searcher_io_in_extern_config_c2h_match_arg_4),
    .io_in_extern_config_c2h_match_arg_5(rx_string_searcher_io_in_extern_config_c2h_match_arg_5),
    .io_in_extern_config_c2h_match_arg_6(rx_string_searcher_io_in_extern_config_c2h_match_arg_6),
    .io_in_extern_config_c2h_match_arg_7(rx_string_searcher_io_in_extern_config_c2h_match_arg_7),
    .io_in_extern_config_c2h_match_arg_8(rx_string_searcher_io_in_extern_config_c2h_match_arg_8),
    .io_in_extern_config_c2h_match_arg_9(rx_string_searcher_io_in_extern_config_c2h_match_arg_9),
    .io_in_extern_config_c2h_match_arg_10(rx_string_searcher_io_in_extern_config_c2h_match_arg_10),
    .io_in_extern_config_c2h_match_arg_11(rx_string_searcher_io_in_extern_config_c2h_match_arg_11),
    .io_in_extern_config_c2h_match_arg_12(rx_string_searcher_io_in_extern_config_c2h_match_arg_12),
    .io_in_extern_config_c2h_match_arg_13(rx_string_searcher_io_in_extern_config_c2h_match_arg_13),
    .io_in_extern_config_c2h_match_arg_14(rx_string_searcher_io_in_extern_config_c2h_match_arg_14),
    .io_in_extern_config_c2h_match_arg_15(rx_string_searcher_io_in_extern_config_c2h_match_arg_15),
    .io_out_tdata(rx_string_searcher_io_out_tdata),
    .io_out_tvalid(rx_string_searcher_io_out_tvalid),
    .io_out_tready(rx_string_searcher_io_out_tready),
    .io_out_tlast(rx_string_searcher_io_out_tlast),
    .io_out_tuser(rx_string_searcher_io_out_tuser),
    .io_out_rx_info_tlen(rx_string_searcher_io_out_rx_info_tlen),
    .io_out_rx_info_qid(rx_string_searcher_io_out_rx_info_qid),
    .io_out_rx_info_ip_chksum(rx_string_searcher_io_out_rx_info_ip_chksum),
    .io_out_rx_info_tcp_chksum(rx_string_searcher_io_out_rx_info_tcp_chksum),
    .io_out_extern_config_c2h_match_op(rx_string_searcher_io_out_extern_config_c2h_match_op),
    .io_out_extern_config_c2h_match_arg_0(rx_string_searcher_io_out_extern_config_c2h_match_arg_0),
    .io_out_extern_config_c2h_match_arg_1(rx_string_searcher_io_out_extern_config_c2h_match_arg_1),
    .io_out_extern_config_c2h_match_arg_2(rx_string_searcher_io_out_extern_config_c2h_match_arg_2),
    .io_out_extern_config_c2h_match_arg_3(rx_string_searcher_io_out_extern_config_c2h_match_arg_3),
    .io_out_extern_config_c2h_match_arg_4(rx_string_searcher_io_out_extern_config_c2h_match_arg_4),
    .io_out_extern_config_c2h_match_arg_5(rx_string_searcher_io_out_extern_config_c2h_match_arg_5),
    .io_out_extern_config_c2h_match_arg_6(rx_string_searcher_io_out_extern_config_c2h_match_arg_6),
    .io_out_extern_config_c2h_match_arg_7(rx_string_searcher_io_out_extern_config_c2h_match_arg_7),
    .io_out_extern_config_c2h_match_arg_8(rx_string_searcher_io_out_extern_config_c2h_match_arg_8),
    .io_out_extern_config_c2h_match_arg_9(rx_string_searcher_io_out_extern_config_c2h_match_arg_9),
    .io_out_extern_config_c2h_match_arg_10(rx_string_searcher_io_out_extern_config_c2h_match_arg_10),
    .io_out_extern_config_c2h_match_arg_11(rx_string_searcher_io_out_extern_config_c2h_match_arg_11),
    .io_out_extern_config_c2h_match_arg_12(rx_string_searcher_io_out_extern_config_c2h_match_arg_12),
    .io_out_extern_config_c2h_match_arg_13(rx_string_searcher_io_out_extern_config_c2h_match_arg_13),
    .io_out_extern_config_c2h_match_arg_14(rx_string_searcher_io_out_extern_config_c2h_match_arg_14),
    .io_out_extern_config_c2h_match_arg_15(rx_string_searcher_io_out_extern_config_c2h_match_arg_15)
  );
  assign io_in_tready = rx_chksum_verifier_io_in_tready; // @[RxPipeline.scala 43:29]
  assign io_out_tdata = rx_re_searcher_io_out_tdata; // @[RxPipeline.scala 48:25]
  assign io_out_tvalid = rx_re_searcher_io_out_tvalid; // @[RxPipeline.scala 48:25]
  assign io_out_tlast = rx_re_searcher_io_out_tlast; // @[RxPipeline.scala 48:25]
  assign io_out_tuser = rx_re_searcher_io_out_tuser; // @[RxPipeline.scala 48:25]
  assign io_out_rx_info_tlen = rx_re_searcher_io_out_rx_info_tlen; // @[RxPipeline.scala 48:25]
  assign io_out_rx_info_qid = rx_re_searcher_io_out_rx_info_qid; // @[RxPipeline.scala 48:25]
  assign io_out_rx_info_ip_chksum = rx_re_searcher_io_out_rx_info_ip_chksum; // @[RxPipeline.scala 48:25]
  assign io_out_rx_info_tcp_chksum = rx_re_searcher_io_out_rx_info_tcp_chksum; // @[RxPipeline.scala 48:25]
  assign io_out_extern_config_c2h_match_op = rx_re_searcher_io_out_extern_config_c2h_match_op; // @[RxPipeline.scala 48:25]
  assign rx_re_searcher_clock = clock;
  assign rx_re_searcher_reset = reset;
  assign rx_re_searcher_io_in_tdata = rx_string_searcher_io_out_tdata; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_tvalid = rx_string_searcher_io_out_tvalid; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_tlast = rx_string_searcher_io_out_tlast; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_tuser = rx_string_searcher_io_out_tuser; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_rx_info_tlen = rx_string_searcher_io_out_rx_info_tlen; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_rx_info_qid = rx_string_searcher_io_out_rx_info_qid; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_rx_info_ip_chksum = rx_string_searcher_io_out_rx_info_ip_chksum; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_rx_info_tcp_chksum = rx_string_searcher_io_out_rx_info_tcp_chksum; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_op = rx_string_searcher_io_out_extern_config_c2h_match_op; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_0 = rx_string_searcher_io_out_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_1 = rx_string_searcher_io_out_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_2 = rx_string_searcher_io_out_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_3 = rx_string_searcher_io_out_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_4 = rx_string_searcher_io_out_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_5 = rx_string_searcher_io_out_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_6 = rx_string_searcher_io_out_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_7 = rx_string_searcher_io_out_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_8 = rx_string_searcher_io_out_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_9 = rx_string_searcher_io_out_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_10 = rx_string_searcher_io_out_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_11 = rx_string_searcher_io_out_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_12 = rx_string_searcher_io_out_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_13 = rx_string_searcher_io_out_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_14 = rx_string_searcher_io_out_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_15 = rx_string_searcher_io_out_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 47:34]
  assign rx_re_searcher_io_out_tready = io_out_tready; // @[RxPipeline.scala 48:25]
  assign rx_chksum_verifier_clock = clock;
  assign rx_chksum_verifier_reset = reset;
  assign rx_chksum_verifier_io_in_tdata = io_in_tdata; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_tvalid = io_in_tvalid; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_tlast = io_in_tlast; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_tuser = io_in_tuser; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_rx_info_tlen = io_in_rx_info_tlen; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_op = io_in_extern_config_c2h_match_op; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_0 = io_in_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_1 = io_in_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_2 = io_in_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_3 = io_in_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_4 = io_in_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_5 = io_in_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_6 = io_in_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_7 = io_in_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_8 = io_in_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_9 = io_in_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_10 = io_in_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_11 = io_in_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_12 = io_in_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_13 = io_in_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_14 = io_in_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_in_extern_config_c2h_match_arg_15 = io_in_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 43:29]
  assign rx_chksum_verifier_io_out_tready = rx_rss_hasher_io_in_tready; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_clock = clock;
  assign rx_rss_hasher_reset = reset;
  assign rx_rss_hasher_io_in_tdata = rx_chksum_verifier_io_out_tdata; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_tvalid = rx_chksum_verifier_io_out_tvalid; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_tlast = rx_chksum_verifier_io_out_tlast; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_tuser = rx_chksum_verifier_io_out_tuser; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_rx_info_tlen = rx_chksum_verifier_io_out_rx_info_tlen; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_rx_info_qid = rx_chksum_verifier_io_out_rx_info_qid; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_rx_info_ip_chksum = rx_chksum_verifier_io_out_rx_info_ip_chksum; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_rx_info_tcp_chksum = rx_chksum_verifier_io_out_rx_info_tcp_chksum; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_op = rx_chksum_verifier_io_out_extern_config_c2h_match_op; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_0 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_1 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_2 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_3 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_4 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_5 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_6 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_7 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_8 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_9 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_10 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_11 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_12 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_13 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_14 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_in_extern_config_c2h_match_arg_15 = rx_chksum_verifier_io_out_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 44:29]
  assign rx_rss_hasher_io_out_tready = rx_string_matcher_io_in_tready; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_clock = clock;
  assign rx_string_matcher_reset = reset;
  assign rx_string_matcher_io_in_tdata = rx_rss_hasher_io_out_tdata; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_tvalid = rx_rss_hasher_io_out_tvalid; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_tlast = rx_rss_hasher_io_out_tlast; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_tuser = rx_rss_hasher_io_out_tuser; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_rx_info_tlen = rx_rss_hasher_io_out_rx_info_tlen; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_rx_info_qid = rx_rss_hasher_io_out_rx_info_qid; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_rx_info_ip_chksum = rx_rss_hasher_io_out_rx_info_ip_chksum; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_rx_info_tcp_chksum = rx_rss_hasher_io_out_rx_info_tcp_chksum; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_op = rx_rss_hasher_io_out_extern_config_c2h_match_op; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_0 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_1 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_2 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_3 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_4 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_5 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_6 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_7 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_8 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_8; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_9 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_9; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_10 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_11 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_12 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_13 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_14 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_in_extern_config_c2h_match_arg_15 = rx_rss_hasher_io_out_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 45:24]
  assign rx_string_matcher_io_out_tready = rx_string_searcher_io_in_tready; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_clock = clock;
  assign rx_string_searcher_reset = reset;
  assign rx_string_searcher_io_in_tdata = rx_string_matcher_io_out_tdata; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_tvalid = rx_string_matcher_io_out_tvalid; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_tlast = rx_string_matcher_io_out_tlast; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_tuser = rx_string_matcher_io_out_tuser; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_rx_info_tlen = rx_string_matcher_io_out_rx_info_tlen; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_rx_info_qid = rx_string_matcher_io_out_rx_info_qid; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_rx_info_ip_chksum = rx_string_matcher_io_out_rx_info_ip_chksum; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_rx_info_tcp_chksum = rx_string_matcher_io_out_rx_info_tcp_chksum; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_op = rx_string_matcher_io_out_extern_config_c2h_match_op; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_0 = rx_string_matcher_io_out_extern_config_c2h_match_arg_0
    ; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_1 = rx_string_matcher_io_out_extern_config_c2h_match_arg_1
    ; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_2 = rx_string_matcher_io_out_extern_config_c2h_match_arg_2
    ; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_3 = rx_string_matcher_io_out_extern_config_c2h_match_arg_3
    ; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_4 = rx_string_matcher_io_out_extern_config_c2h_match_arg_4
    ; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_5 = rx_string_matcher_io_out_extern_config_c2h_match_arg_5
    ; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_6 = rx_string_matcher_io_out_extern_config_c2h_match_arg_6
    ; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_7 = rx_string_matcher_io_out_extern_config_c2h_match_arg_7
    ; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_8 = rx_string_matcher_io_out_extern_config_c2h_match_arg_8
    ; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_9 = rx_string_matcher_io_out_extern_config_c2h_match_arg_9
    ; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_10 =
    rx_string_matcher_io_out_extern_config_c2h_match_arg_10; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_11 =
    rx_string_matcher_io_out_extern_config_c2h_match_arg_11; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_12 =
    rx_string_matcher_io_out_extern_config_c2h_match_arg_12; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_13 =
    rx_string_matcher_io_out_extern_config_c2h_match_arg_13; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_14 =
    rx_string_matcher_io_out_extern_config_c2h_match_arg_14; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_in_extern_config_c2h_match_arg_15 =
    rx_string_matcher_io_out_extern_config_c2h_match_arg_15; // @[RxPipeline.scala 46:31]
  assign rx_string_searcher_io_out_tready = rx_re_searcher_io_in_tready; // @[RxPipeline.scala 47:34]
endmodule
module RxBufferFifo(
  input          clock,
  input          reset,
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input          io_in_tuser,
  input  [15:0]  io_in_rx_info_tlen,
  input  [5:0]   io_in_rx_info_qid,
  input  [31:0]  io_in_rx_info_ip_chksum,
  input  [31:0]  io_in_rx_info_tcp_chksum,
  input  [7:0]   io_in_extern_config_c2h_match_op,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  output [5:0]   io_out_qid,
  output [15:0]  io_out_tlen,
  input          io_reset_counter,
  output [31:0]  io_c2h_pack_counter,
  output [31:0]  io_c2h_err_counter
);
`ifdef RANDOMIZE_MEM_INIT
  reg [511:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
`endif // RANDOMIZE_REG_INIT
  reg [511:0] data_buf_reg [0:63]; // @[RxBufferFifo.scala 44:33]
  wire  data_buf_reg_io_out_tdata_MPORT_en; // @[RxBufferFifo.scala 44:33]
  wire [5:0] data_buf_reg_io_out_tdata_MPORT_addr; // @[RxBufferFifo.scala 44:33]
  wire [511:0] data_buf_reg_io_out_tdata_MPORT_data; // @[RxBufferFifo.scala 44:33]
  wire [511:0] data_buf_reg_MPORT_data; // @[RxBufferFifo.scala 44:33]
  wire [5:0] data_buf_reg_MPORT_addr; // @[RxBufferFifo.scala 44:33]
  wire  data_buf_reg_MPORT_mask; // @[RxBufferFifo.scala 44:33]
  wire  data_buf_reg_MPORT_en; // @[RxBufferFifo.scala 44:33]
  reg  data_buf_reg_io_out_tdata_MPORT_en_pipe_0;
  reg [5:0] data_buf_reg_io_out_tdata_MPORT_addr_pipe_0;
  wire  in_shake_hand = io_in_tvalid & io_in_tready; // @[RxBufferFifo.scala 43:36]
  reg  info_buf_reg_0_used; // @[RxBufferFifo.scala 47:29]
  reg  info_buf_reg_0_valid; // @[RxBufferFifo.scala 47:29]
  reg  info_buf_reg_0_chksum_offload; // @[RxBufferFifo.scala 47:29]
  reg [1:0] info_buf_reg_0_pkt_type; // @[RxBufferFifo.scala 47:29]
  reg [5:0] info_buf_reg_0_qid; // @[RxBufferFifo.scala 47:29]
  reg [15:0] info_buf_reg_0_len; // @[RxBufferFifo.scala 47:29]
  reg [15:0] info_buf_reg_0_ip_chksum; // @[RxBufferFifo.scala 47:29]
  reg [15:0] info_buf_reg_0_tcp_chksum; // @[RxBufferFifo.scala 47:29]
  reg [5:0] info_buf_reg_0_burst; // @[RxBufferFifo.scala 47:29]
  reg  info_buf_reg_1_used; // @[RxBufferFifo.scala 47:29]
  reg  info_buf_reg_1_valid; // @[RxBufferFifo.scala 47:29]
  reg  info_buf_reg_1_chksum_offload; // @[RxBufferFifo.scala 47:29]
  reg [1:0] info_buf_reg_1_pkt_type; // @[RxBufferFifo.scala 47:29]
  reg [5:0] info_buf_reg_1_qid; // @[RxBufferFifo.scala 47:29]
  reg [15:0] info_buf_reg_1_len; // @[RxBufferFifo.scala 47:29]
  reg [15:0] info_buf_reg_1_ip_chksum; // @[RxBufferFifo.scala 47:29]
  reg [15:0] info_buf_reg_1_tcp_chksum; // @[RxBufferFifo.scala 47:29]
  reg [5:0] info_buf_reg_1_burst; // @[RxBufferFifo.scala 47:29]
  reg [6:0] wr_index_reg; // @[RxBufferFifo.scala 48:29]
  reg [6:0] rd_index_reg; // @[RxBufferFifo.scala 49:29]
  reg [6:0] wr_pos_reg; // @[RxBufferFifo.scala 50:29]
  reg [6:0] rd_pos_reg; // @[RxBufferFifo.scala 51:29]
  wire  buf_full = info_buf_reg_0_valid & info_buf_reg_1_valid; // @[RxBufferFifo.scala 56:40]
  reg [31:0] pack_counter; // @[RxBufferFifo.scala 59:29]
  reg [31:0] err_counter; // @[RxBufferFifo.scala 60:28]
  reg [31:0] wrong_chksum_counter; // @[RxBufferFifo.scala 61:37]
  reg  is_overflowed; // @[RxBufferFifo.scala 66:30]
  wire [15:0] _mid_ip_chksum_T_3 = io_in_rx_info_ip_chksum[31:16] + io_in_rx_info_ip_chksum[15:0]; // @[Misc.scala 14:14]
  wire [15:0] _mid_tcp_chksum_T_3 = io_in_rx_info_tcp_chksum[31:16] + io_in_rx_info_tcp_chksum[15:0]; // @[Misc.scala 14:14]
  wire [31:0] mid_ip_chksum = {{16'd0}, _mid_ip_chksum_T_3}; // @[RxBufferFifo.scala 71:27 72:17]
  wire [15:0] _end_ip_chksum_T_3 = mid_ip_chksum[31:16] + mid_ip_chksum[15:0]; // @[Misc.scala 14:14]
  wire [15:0] end_ip_chksum = ~_end_ip_chksum_T_3; // @[RxBufferFifo.scala 77:20]
  wire [31:0] mid_tcp_chksum = {{16'd0}, _mid_tcp_chksum_T_3}; // @[RxBufferFifo.scala 73:28 74:18]
  wire [15:0] _end_tcp_chksum_T_3 = mid_tcp_chksum[31:16] + mid_tcp_chksum[15:0]; // @[Misc.scala 14:14]
  wire [15:0] end_tcp_chksum = ~_end_tcp_chksum_T_3; // @[RxBufferFifo.scala 79:21]
  wire [31:0] _pack_counter_T_1 = pack_counter + 32'h1; // @[RxBufferFifo.scala 87:36]
  wire [5:0] _GEN_2 = wr_index_reg[0] ? info_buf_reg_1_burst : info_buf_reg_0_burst; // @[RxBufferFifo.scala 89:{44,44}]
  wire [11:0] _GEN_343 = {wr_index_reg, 5'h0}; // @[RxBufferFifo.scala 98:38]
  wire [13:0] _wr_pos_reg_T = {{2'd0}, _GEN_343}; // @[RxBufferFifo.scala 98:38]
  wire  _GEN_3 = ~io_in_tlast | is_overflowed; // @[RxBufferFifo.scala 91:27 92:23 66:30]
  wire [13:0] _GEN_4 = ~io_in_tlast ? {{7'd0}, wr_pos_reg} : _wr_pos_reg_T; // @[RxBufferFifo.scala 91:27 50:29 98:22]
  wire [31:0] _err_counter_T_1 = err_counter + 32'h1; // @[RxBufferFifo.scala 101:34]
  wire [5:0] _GEN_5 = ~wr_index_reg[0] ? 6'h0 : info_buf_reg_0_burst; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire [5:0] _GEN_6 = wr_index_reg[0] ? 6'h0 : info_buf_reg_1_burst; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire [15:0] _GEN_7 = ~wr_index_reg[0] ? 16'h0 : info_buf_reg_0_tcp_chksum; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire [15:0] _GEN_8 = wr_index_reg[0] ? 16'h0 : info_buf_reg_1_tcp_chksum; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire [15:0] _GEN_9 = ~wr_index_reg[0] ? 16'h0 : info_buf_reg_0_ip_chksum; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire [15:0] _GEN_10 = wr_index_reg[0] ? 16'h0 : info_buf_reg_1_ip_chksum; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire [15:0] _GEN_11 = ~wr_index_reg[0] ? 16'h0 : info_buf_reg_0_len; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire [15:0] _GEN_12 = wr_index_reg[0] ? 16'h0 : info_buf_reg_1_len; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire [5:0] _GEN_13 = ~wr_index_reg[0] ? 6'h0 : info_buf_reg_0_qid; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire [5:0] _GEN_14 = wr_index_reg[0] ? 6'h0 : info_buf_reg_1_qid; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire [1:0] _GEN_15 = ~wr_index_reg[0] ? 2'h0 : info_buf_reg_0_pkt_type; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire [1:0] _GEN_16 = wr_index_reg[0] ? 2'h0 : info_buf_reg_1_pkt_type; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire  _GEN_17 = ~wr_index_reg[0] ? 1'h0 : info_buf_reg_0_chksum_offload; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire  _GEN_18 = wr_index_reg[0] ? 1'h0 : info_buf_reg_1_chksum_offload; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire  _GEN_19 = ~wr_index_reg[0] ? 1'h0 : info_buf_reg_0_valid; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire  _GEN_20 = wr_index_reg[0] ? 1'h0 : info_buf_reg_1_valid; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire  _GEN_21 = ~wr_index_reg[0] ? 1'h0 : info_buf_reg_0_used; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire  _GEN_22 = wr_index_reg[0] ? 1'h0 : info_buf_reg_1_used; // @[RxBufferFifo.scala 102:{34,34} 47:29]
  wire  _T_6 = ~is_overflowed; // @[RxBufferFifo.scala 110:13]
  wire  _GEN_42 = wr_index_reg[0] ? info_buf_reg_1_used : info_buf_reg_0_used; // @[RxBufferFifo.scala 112:{15,15}]
  wire  _GEN_345 = ~wr_index_reg[0]; // @[RxBufferFifo.scala 113:{43,43} 47:29]
  wire  _GEN_43 = ~wr_index_reg[0] | info_buf_reg_0_used; // @[RxBufferFifo.scala 113:{43,43} 47:29]
  wire  _GEN_44 = wr_index_reg[0] | info_buf_reg_1_used; // @[RxBufferFifo.scala 113:{43,43} 47:29]
  wire [15:0] _info_buf_reg_pkt_type_T_3 = {io_in_tdata[103:96],io_in_tdata[111:104]}; // @[Cat.scala 31:58]
  wire  _info_buf_reg_pkt_type_T_4 = _info_buf_reg_pkt_type_T_3 == 16'h800; // @[RxBufferFifo.scala 114:92]
  wire  _info_buf_reg_pkt_type_T_7 = _info_buf_reg_pkt_type_T_3 == 16'h800 & io_in_tdata[191:184] == 8'h6; // @[RxBufferFifo.scala 114:108]
  wire [1:0] _info_buf_reg_pkt_type_T_13 = {_info_buf_reg_pkt_type_T_7,_info_buf_reg_pkt_type_T_4}; // @[Cat.scala 31:58]
  wire [1:0] _GEN_45 = ~wr_index_reg[0] ? _info_buf_reg_pkt_type_T_13 : info_buf_reg_0_pkt_type; // @[RxBufferFifo.scala 114:{47,47} 47:29]
  wire [1:0] _GEN_46 = wr_index_reg[0] ? _info_buf_reg_pkt_type_T_13 : info_buf_reg_1_pkt_type; // @[RxBufferFifo.scala 114:{47,47} 47:29]
  wire  _GEN_47 = ~wr_index_reg[0] ? io_in_extern_config_c2h_match_op[6] : info_buf_reg_0_chksum_offload; // @[RxBufferFifo.scala 116:{53,53} 47:29]
  wire  _GEN_48 = wr_index_reg[0] ? io_in_extern_config_c2h_match_op[6] : info_buf_reg_1_chksum_offload; // @[RxBufferFifo.scala 116:{53,53} 47:29]
  wire  _GEN_49 = ~_GEN_42 ? _GEN_43 : info_buf_reg_0_used; // @[RxBufferFifo.scala 112:49 47:29]
  wire  _GEN_50 = ~_GEN_42 ? _GEN_44 : info_buf_reg_1_used; // @[RxBufferFifo.scala 112:49 47:29]
  wire [1:0] _GEN_51 = ~_GEN_42 ? _GEN_45 : info_buf_reg_0_pkt_type; // @[RxBufferFifo.scala 112:49 47:29]
  wire [1:0] _GEN_52 = ~_GEN_42 ? _GEN_46 : info_buf_reg_1_pkt_type; // @[RxBufferFifo.scala 112:49 47:29]
  wire  _GEN_53 = ~_GEN_42 ? _GEN_47 : info_buf_reg_0_chksum_offload; // @[RxBufferFifo.scala 112:49 47:29]
  wire  _GEN_54 = ~_GEN_42 ? _GEN_48 : info_buf_reg_1_chksum_offload; // @[RxBufferFifo.scala 112:49 47:29]
  wire [5:0] _info_buf_reg_burst_T_2 = _GEN_2 + 6'h1; // @[RxBufferFifo.scala 119:78]
  wire [5:0] _GEN_57 = ~wr_index_reg[0] ? _info_buf_reg_burst_T_2 : info_buf_reg_0_burst; // @[RxBufferFifo.scala 119:{42,42} 47:29]
  wire [5:0] _GEN_58 = wr_index_reg[0] ? _info_buf_reg_burst_T_2 : info_buf_reg_1_burst; // @[RxBufferFifo.scala 119:{42,42} 47:29]
  wire  _GEN_59 = _GEN_345 | info_buf_reg_0_valid; // @[RxBufferFifo.scala 121:{44,44} 47:29]
  wire  _GEN_60 = wr_index_reg[0] | info_buf_reg_1_valid; // @[RxBufferFifo.scala 121:{44,44} 47:29]
  wire [15:0] _GEN_61 = ~wr_index_reg[0] ? end_ip_chksum : info_buf_reg_0_ip_chksum; // @[RxBufferFifo.scala 123:{48,48} 47:29]
  wire [15:0] _GEN_62 = wr_index_reg[0] ? end_ip_chksum : info_buf_reg_1_ip_chksum; // @[RxBufferFifo.scala 123:{48,48} 47:29]
  wire [15:0] _GEN_63 = ~wr_index_reg[0] ? end_tcp_chksum : info_buf_reg_0_tcp_chksum; // @[RxBufferFifo.scala 124:{49,49} 47:29]
  wire [15:0] _GEN_64 = wr_index_reg[0] ? end_tcp_chksum : info_buf_reg_1_tcp_chksum; // @[RxBufferFifo.scala 124:{49,49} 47:29]
  wire [15:0] _GEN_65 = ~wr_index_reg[0] ? io_in_rx_info_tlen : info_buf_reg_0_len; // @[RxBufferFifo.scala 125:{42,42} 47:29]
  wire [15:0] _GEN_66 = wr_index_reg[0] ? io_in_rx_info_tlen : info_buf_reg_1_len; // @[RxBufferFifo.scala 125:{42,42} 47:29]
  wire [5:0] _GEN_67 = ~wr_index_reg[0] ? io_in_rx_info_qid : info_buf_reg_0_qid; // @[RxBufferFifo.scala 126:{42,42} 47:29]
  wire [5:0] _GEN_68 = wr_index_reg[0] ? io_in_rx_info_qid : info_buf_reg_1_qid; // @[RxBufferFifo.scala 126:{42,42} 47:29]
  wire [6:0] _wr_index_reg_T_1 = wr_index_reg + 7'h1; // @[RxBufferFifo.scala 38:12]
  wire [6:0] _wr_index_reg_T_2 = _wr_index_reg_T_1 & 7'h1; // @[RxBufferFifo.scala 38:19]
  wire [11:0] _GEN_347 = {_wr_index_reg_T_2, 5'h0}; // @[RxBufferFifo.scala 128:49]
  wire [13:0] _wr_pos_reg_T_5 = {{2'd0}, _GEN_347}; // @[RxBufferFifo.scala 128:49]
  wire [6:0] _wr_pos_reg_T_7 = wr_pos_reg + 7'h1; // @[RxBufferFifo.scala 130:36]
  wire  _GEN_69 = io_in_tlast ? _GEN_59 : info_buf_reg_0_valid; // @[RxBufferFifo.scala 120:28 47:29]
  wire  _GEN_70 = io_in_tlast ? _GEN_60 : info_buf_reg_1_valid; // @[RxBufferFifo.scala 120:28 47:29]
  wire [15:0] _GEN_71 = io_in_tlast ? _GEN_61 : info_buf_reg_0_ip_chksum; // @[RxBufferFifo.scala 120:28 47:29]
  wire [15:0] _GEN_72 = io_in_tlast ? _GEN_62 : info_buf_reg_1_ip_chksum; // @[RxBufferFifo.scala 120:28 47:29]
  wire [15:0] _GEN_73 = io_in_tlast ? _GEN_63 : info_buf_reg_0_tcp_chksum; // @[RxBufferFifo.scala 120:28 47:29]
  wire [15:0] _GEN_74 = io_in_tlast ? _GEN_64 : info_buf_reg_1_tcp_chksum; // @[RxBufferFifo.scala 120:28 47:29]
  wire [15:0] _GEN_75 = io_in_tlast ? _GEN_65 : info_buf_reg_0_len; // @[RxBufferFifo.scala 120:28 47:29]
  wire [15:0] _GEN_76 = io_in_tlast ? _GEN_66 : info_buf_reg_1_len; // @[RxBufferFifo.scala 120:28 47:29]
  wire [5:0] _GEN_77 = io_in_tlast ? _GEN_67 : info_buf_reg_0_qid; // @[RxBufferFifo.scala 120:28 47:29]
  wire [5:0] _GEN_78 = io_in_tlast ? _GEN_68 : info_buf_reg_1_qid; // @[RxBufferFifo.scala 120:28 47:29]
  wire [6:0] _GEN_79 = io_in_tlast ? _wr_index_reg_T_2 : wr_index_reg; // @[RxBufferFifo.scala 120:28 127:24 48:29]
  wire [13:0] _GEN_80 = io_in_tlast ? _wr_pos_reg_T_5 : {{7'd0}, _wr_pos_reg_T_7}; // @[RxBufferFifo.scala 120:28 128:22 130:22]
  wire  _GEN_81 = io_in_tlast ? 1'h0 : is_overflowed; // @[RxBufferFifo.scala 132:32 134:25 66:30]
  wire [13:0] _GEN_82 = io_in_tlast ? _wr_pos_reg_T : {{7'd0}, wr_pos_reg}; // @[RxBufferFifo.scala 132:32 135:22 50:29]
  wire  _GEN_83 = ~is_overflowed ? _GEN_49 : info_buf_reg_0_used; // @[RxBufferFifo.scala 110:28 47:29]
  wire  _GEN_84 = ~is_overflowed ? _GEN_50 : info_buf_reg_1_used; // @[RxBufferFifo.scala 110:28 47:29]
  wire [1:0] _GEN_85 = ~is_overflowed ? _GEN_51 : info_buf_reg_0_pkt_type; // @[RxBufferFifo.scala 110:28 47:29]
  wire [1:0] _GEN_86 = ~is_overflowed ? _GEN_52 : info_buf_reg_1_pkt_type; // @[RxBufferFifo.scala 110:28 47:29]
  wire  _GEN_87 = ~is_overflowed ? _GEN_53 : info_buf_reg_0_chksum_offload; // @[RxBufferFifo.scala 110:28 47:29]
  wire  _GEN_88 = ~is_overflowed ? _GEN_54 : info_buf_reg_1_chksum_offload; // @[RxBufferFifo.scala 110:28 47:29]
  wire [5:0] _GEN_94 = ~is_overflowed ? _GEN_57 : info_buf_reg_0_burst; // @[RxBufferFifo.scala 110:28 47:29]
  wire [5:0] _GEN_95 = ~is_overflowed ? _GEN_58 : info_buf_reg_1_burst; // @[RxBufferFifo.scala 110:28 47:29]
  wire  _GEN_96 = ~is_overflowed ? _GEN_69 : info_buf_reg_0_valid; // @[RxBufferFifo.scala 110:28 47:29]
  wire  _GEN_97 = ~is_overflowed ? _GEN_70 : info_buf_reg_1_valid; // @[RxBufferFifo.scala 110:28 47:29]
  wire [15:0] _GEN_98 = ~is_overflowed ? _GEN_71 : info_buf_reg_0_ip_chksum; // @[RxBufferFifo.scala 110:28 47:29]
  wire [15:0] _GEN_99 = ~is_overflowed ? _GEN_72 : info_buf_reg_1_ip_chksum; // @[RxBufferFifo.scala 110:28 47:29]
  wire [15:0] _GEN_100 = ~is_overflowed ? _GEN_73 : info_buf_reg_0_tcp_chksum; // @[RxBufferFifo.scala 110:28 47:29]
  wire [15:0] _GEN_101 = ~is_overflowed ? _GEN_74 : info_buf_reg_1_tcp_chksum; // @[RxBufferFifo.scala 110:28 47:29]
  wire [15:0] _GEN_102 = ~is_overflowed ? _GEN_75 : info_buf_reg_0_len; // @[RxBufferFifo.scala 110:28 47:29]
  wire [15:0] _GEN_103 = ~is_overflowed ? _GEN_76 : info_buf_reg_1_len; // @[RxBufferFifo.scala 110:28 47:29]
  wire [5:0] _GEN_104 = ~is_overflowed ? _GEN_77 : info_buf_reg_0_qid; // @[RxBufferFifo.scala 110:28 47:29]
  wire [5:0] _GEN_105 = ~is_overflowed ? _GEN_78 : info_buf_reg_1_qid; // @[RxBufferFifo.scala 110:28 47:29]
  wire [6:0] _GEN_106 = ~is_overflowed ? _GEN_79 : wr_index_reg; // @[RxBufferFifo.scala 110:28 48:29]
  wire [13:0] _GEN_107 = ~is_overflowed ? _GEN_80 : _GEN_82; // @[RxBufferFifo.scala 110:28]
  wire  _GEN_108 = ~is_overflowed ? is_overflowed : _GEN_81; // @[RxBufferFifo.scala 110:28 66:30]
  wire  _GEN_109 = io_in_tvalid ? _GEN_83 : info_buf_reg_0_used; // @[RxBufferFifo.scala 108:29 47:29]
  wire  _GEN_110 = io_in_tvalid ? _GEN_84 : info_buf_reg_1_used; // @[RxBufferFifo.scala 108:29 47:29]
  wire [1:0] _GEN_111 = io_in_tvalid ? _GEN_85 : info_buf_reg_0_pkt_type; // @[RxBufferFifo.scala 108:29 47:29]
  wire [1:0] _GEN_112 = io_in_tvalid ? _GEN_86 : info_buf_reg_1_pkt_type; // @[RxBufferFifo.scala 108:29 47:29]
  wire  _GEN_113 = io_in_tvalid ? _GEN_87 : info_buf_reg_0_chksum_offload; // @[RxBufferFifo.scala 108:29 47:29]
  wire  _GEN_114 = io_in_tvalid ? _GEN_88 : info_buf_reg_1_chksum_offload; // @[RxBufferFifo.scala 108:29 47:29]
  wire  _GEN_117 = io_in_tvalid & _T_6; // @[RxBufferFifo.scala 108:29 44:33]
  wire [5:0] _GEN_120 = io_in_tvalid ? _GEN_94 : info_buf_reg_0_burst; // @[RxBufferFifo.scala 108:29 47:29]
  wire [5:0] _GEN_121 = io_in_tvalid ? _GEN_95 : info_buf_reg_1_burst; // @[RxBufferFifo.scala 108:29 47:29]
  wire  _GEN_122 = io_in_tvalid ? _GEN_96 : info_buf_reg_0_valid; // @[RxBufferFifo.scala 108:29 47:29]
  wire  _GEN_123 = io_in_tvalid ? _GEN_97 : info_buf_reg_1_valid; // @[RxBufferFifo.scala 108:29 47:29]
  wire [15:0] _GEN_124 = io_in_tvalid ? _GEN_98 : info_buf_reg_0_ip_chksum; // @[RxBufferFifo.scala 108:29 47:29]
  wire [15:0] _GEN_125 = io_in_tvalid ? _GEN_99 : info_buf_reg_1_ip_chksum; // @[RxBufferFifo.scala 108:29 47:29]
  wire [15:0] _GEN_126 = io_in_tvalid ? _GEN_100 : info_buf_reg_0_tcp_chksum; // @[RxBufferFifo.scala 108:29 47:29]
  wire [15:0] _GEN_127 = io_in_tvalid ? _GEN_101 : info_buf_reg_1_tcp_chksum; // @[RxBufferFifo.scala 108:29 47:29]
  wire [15:0] _GEN_128 = io_in_tvalid ? _GEN_102 : info_buf_reg_0_len; // @[RxBufferFifo.scala 108:29 47:29]
  wire [15:0] _GEN_129 = io_in_tvalid ? _GEN_103 : info_buf_reg_1_len; // @[RxBufferFifo.scala 108:29 47:29]
  wire [5:0] _GEN_130 = io_in_tvalid ? _GEN_104 : info_buf_reg_0_qid; // @[RxBufferFifo.scala 108:29 47:29]
  wire [5:0] _GEN_131 = io_in_tvalid ? _GEN_105 : info_buf_reg_1_qid; // @[RxBufferFifo.scala 108:29 47:29]
  wire [6:0] _GEN_132 = io_in_tvalid ? _GEN_106 : wr_index_reg; // @[RxBufferFifo.scala 108:29 48:29]
  wire [13:0] _GEN_133 = io_in_tvalid ? _GEN_107 : {{7'd0}, wr_pos_reg}; // @[RxBufferFifo.scala 108:29 50:29]
  wire  _GEN_134 = io_in_tvalid ? _GEN_108 : is_overflowed; // @[RxBufferFifo.scala 108:29 66:30]
  wire [31:0] _GEN_135 = io_in_tlast & io_in_tuser ? _err_counter_T_1 : err_counter; // @[RxBufferFifo.scala 104:45 105:19 60:28]
  wire [13:0] _GEN_136 = io_in_tlast & io_in_tuser ? _wr_pos_reg_T : _GEN_133; // @[RxBufferFifo.scala 104:45 106:18]
  wire [5:0] _GEN_137 = io_in_tlast & io_in_tuser ? _GEN_5 : _GEN_120; // @[RxBufferFifo.scala 104:45]
  wire [5:0] _GEN_138 = io_in_tlast & io_in_tuser ? _GEN_6 : _GEN_121; // @[RxBufferFifo.scala 104:45]
  wire [15:0] _GEN_139 = io_in_tlast & io_in_tuser ? _GEN_7 : _GEN_126; // @[RxBufferFifo.scala 104:45]
  wire [15:0] _GEN_140 = io_in_tlast & io_in_tuser ? _GEN_8 : _GEN_127; // @[RxBufferFifo.scala 104:45]
  wire [15:0] _GEN_141 = io_in_tlast & io_in_tuser ? _GEN_9 : _GEN_124; // @[RxBufferFifo.scala 104:45]
  wire [15:0] _GEN_142 = io_in_tlast & io_in_tuser ? _GEN_10 : _GEN_125; // @[RxBufferFifo.scala 104:45]
  wire [15:0] _GEN_143 = io_in_tlast & io_in_tuser ? _GEN_11 : _GEN_128; // @[RxBufferFifo.scala 104:45]
  wire [15:0] _GEN_144 = io_in_tlast & io_in_tuser ? _GEN_12 : _GEN_129; // @[RxBufferFifo.scala 104:45]
  wire [5:0] _GEN_145 = io_in_tlast & io_in_tuser ? _GEN_13 : _GEN_130; // @[RxBufferFifo.scala 104:45]
  wire [5:0] _GEN_146 = io_in_tlast & io_in_tuser ? _GEN_14 : _GEN_131; // @[RxBufferFifo.scala 104:45]
  wire [1:0] _GEN_147 = io_in_tlast & io_in_tuser ? _GEN_15 : _GEN_111; // @[RxBufferFifo.scala 104:45]
  wire [1:0] _GEN_148 = io_in_tlast & io_in_tuser ? _GEN_16 : _GEN_112; // @[RxBufferFifo.scala 104:45]
  wire  _GEN_149 = io_in_tlast & io_in_tuser ? _GEN_17 : _GEN_113; // @[RxBufferFifo.scala 104:45]
  wire  _GEN_150 = io_in_tlast & io_in_tuser ? _GEN_18 : _GEN_114; // @[RxBufferFifo.scala 104:45]
  wire  _GEN_151 = io_in_tlast & io_in_tuser ? _GEN_19 : _GEN_122; // @[RxBufferFifo.scala 104:45]
  wire  _GEN_152 = io_in_tlast & io_in_tuser ? _GEN_20 : _GEN_123; // @[RxBufferFifo.scala 104:45]
  wire  _GEN_153 = io_in_tlast & io_in_tuser ? _GEN_21 : _GEN_109; // @[RxBufferFifo.scala 104:45]
  wire  _GEN_154 = io_in_tlast & io_in_tuser ? _GEN_22 : _GEN_110; // @[RxBufferFifo.scala 104:45]
  wire  _GEN_157 = io_in_tlast & io_in_tuser ? 1'h0 : _GEN_117; // @[RxBufferFifo.scala 104:45 44:33]
  wire [6:0] _GEN_160 = io_in_tlast & io_in_tuser ? wr_index_reg : _GEN_132; // @[RxBufferFifo.scala 104:45 48:29]
  wire  _GEN_161 = io_in_tlast & io_in_tuser ? is_overflowed : _GEN_134; // @[RxBufferFifo.scala 104:45 66:30]
  wire [13:0] _GEN_163 = _GEN_2 == 6'h20 ? _GEN_4 : _GEN_136; // @[RxBufferFifo.scala 89:61]
  wire [5:0] _GEN_165 = _GEN_2 == 6'h20 ? _GEN_5 : _GEN_137; // @[RxBufferFifo.scala 89:61]
  wire [5:0] _GEN_166 = _GEN_2 == 6'h20 ? _GEN_6 : _GEN_138; // @[RxBufferFifo.scala 89:61]
  wire [15:0] _GEN_167 = _GEN_2 == 6'h20 ? _GEN_7 : _GEN_139; // @[RxBufferFifo.scala 89:61]
  wire [15:0] _GEN_168 = _GEN_2 == 6'h20 ? _GEN_8 : _GEN_140; // @[RxBufferFifo.scala 89:61]
  wire [15:0] _GEN_169 = _GEN_2 == 6'h20 ? _GEN_9 : _GEN_141; // @[RxBufferFifo.scala 89:61]
  wire [15:0] _GEN_170 = _GEN_2 == 6'h20 ? _GEN_10 : _GEN_142; // @[RxBufferFifo.scala 89:61]
  wire [15:0] _GEN_171 = _GEN_2 == 6'h20 ? _GEN_11 : _GEN_143; // @[RxBufferFifo.scala 89:61]
  wire [15:0] _GEN_172 = _GEN_2 == 6'h20 ? _GEN_12 : _GEN_144; // @[RxBufferFifo.scala 89:61]
  wire [5:0] _GEN_173 = _GEN_2 == 6'h20 ? _GEN_13 : _GEN_145; // @[RxBufferFifo.scala 89:61]
  wire [5:0] _GEN_174 = _GEN_2 == 6'h20 ? _GEN_14 : _GEN_146; // @[RxBufferFifo.scala 89:61]
  wire [1:0] _GEN_175 = _GEN_2 == 6'h20 ? _GEN_15 : _GEN_147; // @[RxBufferFifo.scala 89:61]
  wire [1:0] _GEN_176 = _GEN_2 == 6'h20 ? _GEN_16 : _GEN_148; // @[RxBufferFifo.scala 89:61]
  wire  _GEN_177 = _GEN_2 == 6'h20 ? _GEN_17 : _GEN_149; // @[RxBufferFifo.scala 89:61]
  wire  _GEN_178 = _GEN_2 == 6'h20 ? _GEN_18 : _GEN_150; // @[RxBufferFifo.scala 89:61]
  wire  _GEN_179 = _GEN_2 == 6'h20 ? _GEN_19 : _GEN_151; // @[RxBufferFifo.scala 89:61]
  wire  _GEN_180 = _GEN_2 == 6'h20 ? _GEN_20 : _GEN_152; // @[RxBufferFifo.scala 89:61]
  wire  _GEN_181 = _GEN_2 == 6'h20 ? _GEN_21 : _GEN_153; // @[RxBufferFifo.scala 89:61]
  wire  _GEN_182 = _GEN_2 == 6'h20 ? _GEN_22 : _GEN_154; // @[RxBufferFifo.scala 89:61]
  wire  _GEN_185 = _GEN_2 == 6'h20 ? 1'h0 : _GEN_157; // @[RxBufferFifo.scala 44:33 89:61]
  wire [13:0] _GEN_191 = in_shake_hand ? _GEN_163 : {{7'd0}, wr_pos_reg}; // @[RxBufferFifo.scala 50:29 85:29]
  wire [5:0] _GEN_193 = in_shake_hand ? _GEN_165 : info_buf_reg_0_burst; // @[RxBufferFifo.scala 47:29 85:29]
  wire [5:0] _GEN_194 = in_shake_hand ? _GEN_166 : info_buf_reg_1_burst; // @[RxBufferFifo.scala 47:29 85:29]
  wire [15:0] _GEN_195 = in_shake_hand ? _GEN_167 : info_buf_reg_0_tcp_chksum; // @[RxBufferFifo.scala 47:29 85:29]
  wire [15:0] _GEN_196 = in_shake_hand ? _GEN_168 : info_buf_reg_1_tcp_chksum; // @[RxBufferFifo.scala 47:29 85:29]
  wire [15:0] _GEN_197 = in_shake_hand ? _GEN_169 : info_buf_reg_0_ip_chksum; // @[RxBufferFifo.scala 47:29 85:29]
  wire [15:0] _GEN_198 = in_shake_hand ? _GEN_170 : info_buf_reg_1_ip_chksum; // @[RxBufferFifo.scala 47:29 85:29]
  wire [15:0] _GEN_199 = in_shake_hand ? _GEN_171 : info_buf_reg_0_len; // @[RxBufferFifo.scala 47:29 85:29]
  wire [15:0] _GEN_200 = in_shake_hand ? _GEN_172 : info_buf_reg_1_len; // @[RxBufferFifo.scala 47:29 85:29]
  wire [5:0] _GEN_201 = in_shake_hand ? _GEN_173 : info_buf_reg_0_qid; // @[RxBufferFifo.scala 47:29 85:29]
  wire [5:0] _GEN_202 = in_shake_hand ? _GEN_174 : info_buf_reg_1_qid; // @[RxBufferFifo.scala 47:29 85:29]
  wire [1:0] _GEN_203 = in_shake_hand ? _GEN_175 : info_buf_reg_0_pkt_type; // @[RxBufferFifo.scala 47:29 85:29]
  wire [1:0] _GEN_204 = in_shake_hand ? _GEN_176 : info_buf_reg_1_pkt_type; // @[RxBufferFifo.scala 47:29 85:29]
  wire  _GEN_205 = in_shake_hand ? _GEN_177 : info_buf_reg_0_chksum_offload; // @[RxBufferFifo.scala 47:29 85:29]
  wire  _GEN_206 = in_shake_hand ? _GEN_178 : info_buf_reg_1_chksum_offload; // @[RxBufferFifo.scala 47:29 85:29]
  wire  _GEN_207 = in_shake_hand ? _GEN_179 : info_buf_reg_0_valid; // @[RxBufferFifo.scala 47:29 85:29]
  wire  _GEN_208 = in_shake_hand ? _GEN_180 : info_buf_reg_1_valid; // @[RxBufferFifo.scala 47:29 85:29]
  wire  _GEN_209 = in_shake_hand ? _GEN_181 : info_buf_reg_0_used; // @[RxBufferFifo.scala 47:29 85:29]
  wire  _GEN_210 = in_shake_hand ? _GEN_182 : info_buf_reg_1_used; // @[RxBufferFifo.scala 47:29 85:29]
  wire  _GEN_213 = in_shake_hand & _GEN_185; // @[RxBufferFifo.scala 85:29 44:33]
  wire [13:0] _GEN_220 = io_reset_counter ? {{7'd0}, wr_pos_reg} : _GEN_191; // @[RxBufferFifo.scala 81:26 50:29]
  wire [5:0] _GEN_221 = io_reset_counter ? info_buf_reg_0_burst : _GEN_193; // @[RxBufferFifo.scala 81:26 47:29]
  wire [5:0] _GEN_222 = io_reset_counter ? info_buf_reg_1_burst : _GEN_194; // @[RxBufferFifo.scala 81:26 47:29]
  wire [15:0] _GEN_223 = io_reset_counter ? info_buf_reg_0_tcp_chksum : _GEN_195; // @[RxBufferFifo.scala 81:26 47:29]
  wire [15:0] _GEN_224 = io_reset_counter ? info_buf_reg_1_tcp_chksum : _GEN_196; // @[RxBufferFifo.scala 81:26 47:29]
  wire [15:0] _GEN_225 = io_reset_counter ? info_buf_reg_0_ip_chksum : _GEN_197; // @[RxBufferFifo.scala 81:26 47:29]
  wire [15:0] _GEN_226 = io_reset_counter ? info_buf_reg_1_ip_chksum : _GEN_198; // @[RxBufferFifo.scala 81:26 47:29]
  wire [15:0] _GEN_227 = io_reset_counter ? info_buf_reg_0_len : _GEN_199; // @[RxBufferFifo.scala 81:26 47:29]
  wire [15:0] _GEN_228 = io_reset_counter ? info_buf_reg_1_len : _GEN_200; // @[RxBufferFifo.scala 81:26 47:29]
  wire [5:0] _GEN_229 = io_reset_counter ? info_buf_reg_0_qid : _GEN_201; // @[RxBufferFifo.scala 81:26 47:29]
  wire [5:0] _GEN_230 = io_reset_counter ? info_buf_reg_1_qid : _GEN_202; // @[RxBufferFifo.scala 81:26 47:29]
  wire [1:0] _GEN_231 = io_reset_counter ? info_buf_reg_0_pkt_type : _GEN_203; // @[RxBufferFifo.scala 81:26 47:29]
  wire [1:0] _GEN_232 = io_reset_counter ? info_buf_reg_1_pkt_type : _GEN_204; // @[RxBufferFifo.scala 81:26 47:29]
  wire  _GEN_233 = io_reset_counter ? info_buf_reg_0_chksum_offload : _GEN_205; // @[RxBufferFifo.scala 81:26 47:29]
  wire  _GEN_234 = io_reset_counter ? info_buf_reg_1_chksum_offload : _GEN_206; // @[RxBufferFifo.scala 81:26 47:29]
  wire  _GEN_235 = io_reset_counter ? info_buf_reg_0_valid : _GEN_207; // @[RxBufferFifo.scala 81:26 47:29]
  wire  _GEN_236 = io_reset_counter ? info_buf_reg_1_valid : _GEN_208; // @[RxBufferFifo.scala 81:26 47:29]
  wire  _GEN_237 = io_reset_counter ? info_buf_reg_0_used : _GEN_209; // @[RxBufferFifo.scala 81:26 47:29]
  wire  _GEN_238 = io_reset_counter ? info_buf_reg_1_used : _GEN_210; // @[RxBufferFifo.scala 81:26 47:29]
  wire  _GEN_246 = rd_index_reg[0] ? info_buf_reg_1_valid : info_buf_reg_0_valid; // @[RxBufferFifo.scala 141:{38,38}]
  wire  out_shake_hand = io_out_tready & _GEN_246; // @[RxBufferFifo.scala 141:38]
  wire [5:0] _GEN_252 = rd_index_reg[0] ? info_buf_reg_1_burst : info_buf_reg_0_burst; // @[RxBufferFifo.scala 152:{89,89}]
  wire  _io_out_tlast_T_2 = _GEN_252 == 6'h1; // @[RxBufferFifo.scala 152:89]
  wire  _GEN_256 = rd_index_reg[0] ? info_buf_reg_1_chksum_offload : info_buf_reg_0_chksum_offload; // @[RxBufferFifo.scala 144:{7,7}]
  wire [1:0] _GEN_258 = rd_index_reg[0] ? info_buf_reg_1_pkt_type : info_buf_reg_0_pkt_type; // @[RxBufferFifo.scala 145:{43,43}]
  wire [15:0] _GEN_260 = rd_index_reg[0] ? info_buf_reg_1_ip_chksum : info_buf_reg_0_ip_chksum; // @[RxBufferFifo.scala 145:{88,88}]
  wire [15:0] _GEN_264 = rd_index_reg[0] ? info_buf_reg_1_tcp_chksum : info_buf_reg_0_tcp_chksum; // @[RxBufferFifo.scala 146:{88,88}]
  wire  _io_out_tvalid_T_14 = ~_GEN_258[1] | _GEN_264 == 16'h0; // @[RxBufferFifo.scala 146:47]
  wire  _io_out_tvalid_T_15 = (~_GEN_258[0] | _GEN_260 == 16'h0) & _io_out_tvalid_T_14; // @[RxBufferFifo.scala 145:97]
  wire  _io_out_tvalid_T_16 = ~_GEN_256 | _io_out_tvalid_T_15; // @[RxBufferFifo.scala 144:50]
  wire  _wrong_chksum_counter_T_18 = io_out_tready & io_out_tlast & ~_io_out_tvalid_T_16; // @[RxBufferFifo.scala 156:80]
  wire [31:0] _GEN_349 = {{31'd0}, _wrong_chksum_counter_T_18}; // @[RxBufferFifo.scala 156:48]
  wire [31:0] _wrong_chksum_counter_T_20 = wrong_chksum_counter + _GEN_349; // @[RxBufferFifo.scala 156:48]
  wire [6:0] _rd_pos_next_T_1 = rd_index_reg + 7'h1; // @[RxBufferFifo.scala 38:12]
  wire [6:0] _rd_pos_next_T_2 = _rd_pos_next_T_1 & 7'h1; // @[RxBufferFifo.scala 38:19]
  wire [11:0] _GEN_350 = {_rd_pos_next_T_2, 5'h0}; // @[RxBufferFifo.scala 175:44]
  wire [13:0] _rd_pos_next_T_3 = {{2'd0}, _GEN_350}; // @[RxBufferFifo.scala 175:44]
  wire [6:0] _rd_pos_next_T_5 = rd_pos_reg + 7'h1; // @[RxBufferFifo.scala 177:31]
  wire [13:0] _GEN_342 = _io_out_tlast_T_2 ? _rd_pos_next_T_3 : {{7'd0}, _rd_pos_next_T_5}; // @[RxBufferFifo.scala 174:51 175:17 177:17]
  wire [6:0] rd_pos_next = _GEN_342[6:0];
  wire [6:0] _io_out_tdata_T = out_shake_hand ? rd_pos_next : rd_pos_reg; // @[RxBufferFifo.scala 160:36]
  wire [5:0] _info_buf_reg_burst_T_5 = _GEN_252 - 6'h1; // @[RxBufferFifo.scala 170:78]
  wire [13:0] _GEN_351 = reset ? 14'h0 : _GEN_220; // @[RxBufferFifo.scala 50:{29,29}]
  assign data_buf_reg_io_out_tdata_MPORT_en = data_buf_reg_io_out_tdata_MPORT_en_pipe_0;
  assign data_buf_reg_io_out_tdata_MPORT_addr = data_buf_reg_io_out_tdata_MPORT_addr_pipe_0;
  assign data_buf_reg_io_out_tdata_MPORT_data = data_buf_reg[data_buf_reg_io_out_tdata_MPORT_addr]; // @[RxBufferFifo.scala 44:33]
  assign data_buf_reg_MPORT_data = io_in_tdata;
  assign data_buf_reg_MPORT_addr = wr_pos_reg[5:0];
  assign data_buf_reg_MPORT_mask = 1'h1;
  assign data_buf_reg_MPORT_en = io_reset_counter ? 1'h0 : _GEN_213;
  assign io_in_tready = ~buf_full; // @[RxBufferFifo.scala 58:19]
  assign io_out_tdata = data_buf_reg_io_out_tdata_MPORT_data; // @[RxBufferFifo.scala 160:17]
  assign io_out_tvalid = _GEN_246 & _io_out_tvalid_T_16; // @[RxBufferFifo.scala 155:53]
  assign io_out_tlast = _GEN_246 & _GEN_252 == 6'h1; // @[RxBufferFifo.scala 152:53]
  assign io_out_qid = rd_index_reg[0] ? info_buf_reg_1_qid : info_buf_reg_0_qid; // @[RxBufferFifo.scala 149:{17,17}]
  assign io_out_tlen = rd_index_reg[0] ? info_buf_reg_1_len : info_buf_reg_0_len; // @[RxBufferFifo.scala 150:{17,17}]
  assign io_c2h_pack_counter = pack_counter; // @[RxBufferFifo.scala 63:23]
  assign io_c2h_err_counter = err_counter + wrong_chksum_counter; // @[RxBufferFifo.scala 64:37]
  always @(posedge clock) begin
    if (data_buf_reg_MPORT_en & data_buf_reg_MPORT_mask) begin
      data_buf_reg[data_buf_reg_MPORT_addr] <= data_buf_reg_MPORT_data; // @[RxBufferFifo.scala 44:33]
    end
    data_buf_reg_io_out_tdata_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      data_buf_reg_io_out_tdata_MPORT_addr_pipe_0 <= _io_out_tdata_T[5:0];
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_0_used <= 1'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (~rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_0_used <= 1'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_0_used <= _GEN_237;
        end
      end else begin
        info_buf_reg_0_used <= _GEN_237;
      end
    end else begin
      info_buf_reg_0_used <= _GEN_237;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_0_valid <= 1'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (~rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_0_valid <= 1'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_0_valid <= _GEN_235;
        end
      end else begin
        info_buf_reg_0_valid <= _GEN_235;
      end
    end else begin
      info_buf_reg_0_valid <= _GEN_235;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_0_chksum_offload <= 1'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (~rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_0_chksum_offload <= 1'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_0_chksum_offload <= _GEN_233;
        end
      end else begin
        info_buf_reg_0_chksum_offload <= _GEN_233;
      end
    end else begin
      info_buf_reg_0_chksum_offload <= _GEN_233;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_0_pkt_type <= 2'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (~rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_0_pkt_type <= 2'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_0_pkt_type <= _GEN_231;
        end
      end else begin
        info_buf_reg_0_pkt_type <= _GEN_231;
      end
    end else begin
      info_buf_reg_0_pkt_type <= _GEN_231;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_0_qid <= 6'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (~rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_0_qid <= 6'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_0_qid <= _GEN_229;
        end
      end else begin
        info_buf_reg_0_qid <= _GEN_229;
      end
    end else begin
      info_buf_reg_0_qid <= _GEN_229;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_0_len <= 16'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (~rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_0_len <= 16'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_0_len <= _GEN_227;
        end
      end else begin
        info_buf_reg_0_len <= _GEN_227;
      end
    end else begin
      info_buf_reg_0_len <= _GEN_227;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_0_ip_chksum <= 16'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (~rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_0_ip_chksum <= 16'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_0_ip_chksum <= _GEN_225;
        end
      end else begin
        info_buf_reg_0_ip_chksum <= _GEN_225;
      end
    end else begin
      info_buf_reg_0_ip_chksum <= _GEN_225;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_0_tcp_chksum <= 16'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (~rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_0_tcp_chksum <= 16'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_0_tcp_chksum <= _GEN_223;
        end
      end else begin
        info_buf_reg_0_tcp_chksum <= _GEN_223;
      end
    end else begin
      info_buf_reg_0_tcp_chksum <= _GEN_223;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_0_burst <= 6'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (~rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_0_burst <= 6'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_0_burst <= _GEN_221;
        end
      end else if (~rd_index_reg[0]) begin // @[RxBufferFifo.scala 170:42]
        info_buf_reg_0_burst <= _info_buf_reg_burst_T_5; // @[RxBufferFifo.scala 170:42]
      end else begin
        info_buf_reg_0_burst <= _GEN_221;
      end
    end else begin
      info_buf_reg_0_burst <= _GEN_221;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_1_used <= 1'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_1_used <= 1'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_1_used <= _GEN_238;
        end
      end else begin
        info_buf_reg_1_used <= _GEN_238;
      end
    end else begin
      info_buf_reg_1_used <= _GEN_238;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_1_valid <= 1'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_1_valid <= 1'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_1_valid <= _GEN_236;
        end
      end else begin
        info_buf_reg_1_valid <= _GEN_236;
      end
    end else begin
      info_buf_reg_1_valid <= _GEN_236;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_1_chksum_offload <= 1'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_1_chksum_offload <= 1'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_1_chksum_offload <= _GEN_234;
        end
      end else begin
        info_buf_reg_1_chksum_offload <= _GEN_234;
      end
    end else begin
      info_buf_reg_1_chksum_offload <= _GEN_234;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_1_pkt_type <= 2'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_1_pkt_type <= 2'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_1_pkt_type <= _GEN_232;
        end
      end else begin
        info_buf_reg_1_pkt_type <= _GEN_232;
      end
    end else begin
      info_buf_reg_1_pkt_type <= _GEN_232;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_1_qid <= 6'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_1_qid <= 6'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_1_qid <= _GEN_230;
        end
      end else begin
        info_buf_reg_1_qid <= _GEN_230;
      end
    end else begin
      info_buf_reg_1_qid <= _GEN_230;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_1_len <= 16'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_1_len <= 16'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_1_len <= _GEN_228;
        end
      end else begin
        info_buf_reg_1_len <= _GEN_228;
      end
    end else begin
      info_buf_reg_1_len <= _GEN_228;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_1_ip_chksum <= 16'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_1_ip_chksum <= 16'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_1_ip_chksum <= _GEN_226;
        end
      end else begin
        info_buf_reg_1_ip_chksum <= _GEN_226;
      end
    end else begin
      info_buf_reg_1_ip_chksum <= _GEN_226;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_1_tcp_chksum <= 16'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_1_tcp_chksum <= 16'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_1_tcp_chksum <= _GEN_224;
        end
      end else begin
        info_buf_reg_1_tcp_chksum <= _GEN_224;
      end
    end else begin
      info_buf_reg_1_tcp_chksum <= _GEN_224;
    end
    if (reset) begin // @[RxBufferFifo.scala 47:29]
      info_buf_reg_1_burst <= 6'h0; // @[RxBufferFifo.scala 47:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        if (rd_index_reg[0]) begin // @[RxBufferFifo.scala 167:36]
          info_buf_reg_1_burst <= 6'h0; // @[RxBufferFifo.scala 167:36]
        end else begin
          info_buf_reg_1_burst <= _GEN_222;
        end
      end else if (rd_index_reg[0]) begin // @[RxBufferFifo.scala 170:42]
        info_buf_reg_1_burst <= _info_buf_reg_burst_T_5; // @[RxBufferFifo.scala 170:42]
      end else begin
        info_buf_reg_1_burst <= _GEN_222;
      end
    end else begin
      info_buf_reg_1_burst <= _GEN_222;
    end
    if (reset) begin // @[RxBufferFifo.scala 48:29]
      wr_index_reg <= 7'h0; // @[RxBufferFifo.scala 48:29]
    end else if (!(io_reset_counter)) begin // @[RxBufferFifo.scala 81:26]
      if (in_shake_hand) begin // @[RxBufferFifo.scala 85:29]
        if (!(_GEN_2 == 6'h20)) begin // @[RxBufferFifo.scala 89:61]
          wr_index_reg <= _GEN_160;
        end
      end
    end
    if (reset) begin // @[RxBufferFifo.scala 49:29]
      rd_index_reg <= 7'h0; // @[RxBufferFifo.scala 49:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 162:24]
      if (_io_out_tlast_T_2) begin // @[RxBufferFifo.scala 166:55]
        rd_index_reg <= _rd_pos_next_T_2; // @[RxBufferFifo.scala 168:22]
      end
    end
    wr_pos_reg <= _GEN_351[6:0]; // @[RxBufferFifo.scala 50:{29,29}]
    if (reset) begin // @[RxBufferFifo.scala 51:29]
      rd_pos_reg <= 7'h0; // @[RxBufferFifo.scala 51:29]
    end else if (out_shake_hand) begin // @[RxBufferFifo.scala 160:36]
      rd_pos_reg <= rd_pos_next;
    end
    if (reset) begin // @[RxBufferFifo.scala 59:29]
      pack_counter <= 32'h0; // @[RxBufferFifo.scala 59:29]
    end else if (io_reset_counter) begin // @[RxBufferFifo.scala 81:26]
      pack_counter <= 32'h0; // @[RxBufferFifo.scala 82:18]
    end else if (in_shake_hand) begin // @[RxBufferFifo.scala 85:29]
      if (io_in_tlast) begin // @[RxBufferFifo.scala 86:24]
        pack_counter <= _pack_counter_T_1; // @[RxBufferFifo.scala 87:20]
      end
    end
    if (reset) begin // @[RxBufferFifo.scala 60:28]
      err_counter <= 32'h0; // @[RxBufferFifo.scala 60:28]
    end else if (io_reset_counter) begin // @[RxBufferFifo.scala 81:26]
      err_counter <= 32'h0; // @[RxBufferFifo.scala 83:17]
    end else if (in_shake_hand) begin // @[RxBufferFifo.scala 85:29]
      if (_GEN_2 == 6'h20) begin // @[RxBufferFifo.scala 89:61]
        err_counter <= _err_counter_T_1; // @[RxBufferFifo.scala 101:19]
      end else begin
        err_counter <= _GEN_135;
      end
    end
    if (reset) begin // @[RxBufferFifo.scala 61:37]
      wrong_chksum_counter <= 32'h0; // @[RxBufferFifo.scala 61:37]
    end else begin
      wrong_chksum_counter <= _wrong_chksum_counter_T_20; // @[RxBufferFifo.scala 156:24]
    end
    if (reset) begin // @[RxBufferFifo.scala 66:30]
      is_overflowed <= 1'h0; // @[RxBufferFifo.scala 66:30]
    end else if (!(io_reset_counter)) begin // @[RxBufferFifo.scala 81:26]
      if (in_shake_hand) begin // @[RxBufferFifo.scala 85:29]
        if (_GEN_2 == 6'h20) begin // @[RxBufferFifo.scala 89:61]
          is_overflowed <= _GEN_3;
        end else begin
          is_overflowed <= _GEN_161;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {16{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    data_buf_reg[initvar] = _RAND_0[511:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  data_buf_reg_io_out_tdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  data_buf_reg_io_out_tdata_MPORT_addr_pipe_0 = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  info_buf_reg_0_used = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  info_buf_reg_0_valid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  info_buf_reg_0_chksum_offload = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  info_buf_reg_0_pkt_type = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  info_buf_reg_0_qid = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  info_buf_reg_0_len = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  info_buf_reg_0_ip_chksum = _RAND_9[15:0];
  _RAND_10 = {1{`RANDOM}};
  info_buf_reg_0_tcp_chksum = _RAND_10[15:0];
  _RAND_11 = {1{`RANDOM}};
  info_buf_reg_0_burst = _RAND_11[5:0];
  _RAND_12 = {1{`RANDOM}};
  info_buf_reg_1_used = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  info_buf_reg_1_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  info_buf_reg_1_chksum_offload = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  info_buf_reg_1_pkt_type = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  info_buf_reg_1_qid = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  info_buf_reg_1_len = _RAND_17[15:0];
  _RAND_18 = {1{`RANDOM}};
  info_buf_reg_1_ip_chksum = _RAND_18[15:0];
  _RAND_19 = {1{`RANDOM}};
  info_buf_reg_1_tcp_chksum = _RAND_19[15:0];
  _RAND_20 = {1{`RANDOM}};
  info_buf_reg_1_burst = _RAND_20[5:0];
  _RAND_21 = {1{`RANDOM}};
  wr_index_reg = _RAND_21[6:0];
  _RAND_22 = {1{`RANDOM}};
  rd_index_reg = _RAND_22[6:0];
  _RAND_23 = {1{`RANDOM}};
  wr_pos_reg = _RAND_23[6:0];
  _RAND_24 = {1{`RANDOM}};
  rd_pos_reg = _RAND_24[6:0];
  _RAND_25 = {1{`RANDOM}};
  pack_counter = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  err_counter = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  wrong_chksum_counter = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  is_overflowed = _RAND_28[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RxHandler(
  input          clock,
  input          reset,
  input  [511:0] io_CMAC_out_tdata,
  input          io_CMAC_out_tvalid,
  output         io_CMAC_out_tready,
  input          io_CMAC_out_tlast,
  input          io_CMAC_out_tuser,
  input  [63:0]  io_CMAC_out_tkeep,
  output [511:0] io_QDMA_c2h_stub_in_tdata,
  output         io_QDMA_c2h_stub_in_tvalid,
  input          io_QDMA_c2h_stub_in_tready,
  output         io_QDMA_c2h_stub_in_tlast,
  output         io_QDMA_c2h_stub_in_tuser,
  input          io_reset_counter,
  output [31:0]  io_c2h_pack_counter,
  output [31:0]  io_c2h_err_counter,
  input  [7:0]   io_extern_config_c2h_match_op,
  input  [31:0]  io_extern_config_c2h_match_arg_0,
  input  [31:0]  io_extern_config_c2h_match_arg_1,
  input  [31:0]  io_extern_config_c2h_match_arg_2,
  input  [31:0]  io_extern_config_c2h_match_arg_3,
  input  [31:0]  io_extern_config_c2h_match_arg_4,
  input  [31:0]  io_extern_config_c2h_match_arg_5,
  input  [31:0]  io_extern_config_c2h_match_arg_6,
  input  [31:0]  io_extern_config_c2h_match_arg_7,
  input  [31:0]  io_extern_config_c2h_match_arg_8,
  input  [31:0]  io_extern_config_c2h_match_arg_9,
  input  [31:0]  io_extern_config_c2h_match_arg_10,
  input  [31:0]  io_extern_config_c2h_match_arg_11,
  input  [31:0]  io_extern_config_c2h_match_arg_12,
  input  [31:0]  io_extern_config_c2h_match_arg_13,
  input  [31:0]  io_extern_config_c2h_match_arg_14,
  input  [31:0]  io_extern_config_c2h_match_arg_15
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  rx_converter_clock; // @[RxHandler.scala 38:28]
  wire  rx_converter_reset; // @[RxHandler.scala 38:28]
  wire [511:0] rx_converter_io_in_tdata; // @[RxHandler.scala 38:28]
  wire  rx_converter_io_in_tvalid; // @[RxHandler.scala 38:28]
  wire  rx_converter_io_in_tready; // @[RxHandler.scala 38:28]
  wire  rx_converter_io_in_tlast; // @[RxHandler.scala 38:28]
  wire  rx_converter_io_in_tuser; // @[RxHandler.scala 38:28]
  wire [63:0] rx_converter_io_in_tkeep; // @[RxHandler.scala 38:28]
  wire [511:0] rx_converter_io_out_tdata; // @[RxHandler.scala 38:28]
  wire  rx_converter_io_out_tvalid; // @[RxHandler.scala 38:28]
  wire  rx_converter_io_out_tready; // @[RxHandler.scala 38:28]
  wire  rx_converter_io_out_tlast; // @[RxHandler.scala 38:28]
  wire  rx_converter_io_out_tuser; // @[RxHandler.scala 38:28]
  wire [15:0] rx_converter_io_out_rx_info_tlen; // @[RxHandler.scala 38:28]
  wire [7:0] rx_converter_io_out_extern_config_c2h_match_op; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_0; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_1; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_2; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_3; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_4; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_5; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_6; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_7; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_8; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_9; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_10; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_11; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_12; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_13; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_14; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_out_extern_config_c2h_match_arg_15; // @[RxHandler.scala 38:28]
  wire [7:0] rx_converter_io_extern_config_c2h_match_op; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_0; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_1; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_2; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_3; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_4; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_5; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_6; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_7; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_8; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_9; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_10; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_11; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_12; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_13; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_14; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_15; // @[RxHandler.scala 38:28]
  wire  rx_pipeline_clock; // @[RxHandler.scala 42:27]
  wire  rx_pipeline_reset; // @[RxHandler.scala 42:27]
  wire [511:0] rx_pipeline_io_in_tdata; // @[RxHandler.scala 42:27]
  wire  rx_pipeline_io_in_tvalid; // @[RxHandler.scala 42:27]
  wire  rx_pipeline_io_in_tready; // @[RxHandler.scala 42:27]
  wire  rx_pipeline_io_in_tlast; // @[RxHandler.scala 42:27]
  wire  rx_pipeline_io_in_tuser; // @[RxHandler.scala 42:27]
  wire [15:0] rx_pipeline_io_in_rx_info_tlen; // @[RxHandler.scala 42:27]
  wire [7:0] rx_pipeline_io_in_extern_config_c2h_match_op; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_0; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_1; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_2; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_3; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_4; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_5; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_6; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_7; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_8; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_9; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_10; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_11; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_12; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_13; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_14; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_in_extern_config_c2h_match_arg_15; // @[RxHandler.scala 42:27]
  wire [511:0] rx_pipeline_io_out_tdata; // @[RxHandler.scala 42:27]
  wire  rx_pipeline_io_out_tvalid; // @[RxHandler.scala 42:27]
  wire  rx_pipeline_io_out_tready; // @[RxHandler.scala 42:27]
  wire  rx_pipeline_io_out_tlast; // @[RxHandler.scala 42:27]
  wire  rx_pipeline_io_out_tuser; // @[RxHandler.scala 42:27]
  wire [15:0] rx_pipeline_io_out_rx_info_tlen; // @[RxHandler.scala 42:27]
  wire [5:0] rx_pipeline_io_out_rx_info_qid; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_out_rx_info_ip_chksum; // @[RxHandler.scala 42:27]
  wire [31:0] rx_pipeline_io_out_rx_info_tcp_chksum; // @[RxHandler.scala 42:27]
  wire [7:0] rx_pipeline_io_out_extern_config_c2h_match_op; // @[RxHandler.scala 42:27]
  wire  rx_buffer_fifo_clock; // @[RxHandler.scala 45:30]
  wire  rx_buffer_fifo_reset; // @[RxHandler.scala 45:30]
  wire [511:0] rx_buffer_fifo_io_in_tdata; // @[RxHandler.scala 45:30]
  wire  rx_buffer_fifo_io_in_tvalid; // @[RxHandler.scala 45:30]
  wire  rx_buffer_fifo_io_in_tready; // @[RxHandler.scala 45:30]
  wire  rx_buffer_fifo_io_in_tlast; // @[RxHandler.scala 45:30]
  wire  rx_buffer_fifo_io_in_tuser; // @[RxHandler.scala 45:30]
  wire [15:0] rx_buffer_fifo_io_in_rx_info_tlen; // @[RxHandler.scala 45:30]
  wire [5:0] rx_buffer_fifo_io_in_rx_info_qid; // @[RxHandler.scala 45:30]
  wire [31:0] rx_buffer_fifo_io_in_rx_info_ip_chksum; // @[RxHandler.scala 45:30]
  wire [31:0] rx_buffer_fifo_io_in_rx_info_tcp_chksum; // @[RxHandler.scala 45:30]
  wire [7:0] rx_buffer_fifo_io_in_extern_config_c2h_match_op; // @[RxHandler.scala 45:30]
  wire [511:0] rx_buffer_fifo_io_out_tdata; // @[RxHandler.scala 45:30]
  wire  rx_buffer_fifo_io_out_tvalid; // @[RxHandler.scala 45:30]
  wire  rx_buffer_fifo_io_out_tready; // @[RxHandler.scala 45:30]
  wire  rx_buffer_fifo_io_out_tlast; // @[RxHandler.scala 45:30]
  wire [5:0] rx_buffer_fifo_io_out_qid; // @[RxHandler.scala 45:30]
  wire [15:0] rx_buffer_fifo_io_out_tlen; // @[RxHandler.scala 45:30]
  wire  rx_buffer_fifo_io_reset_counter; // @[RxHandler.scala 45:30]
  wire [31:0] rx_buffer_fifo_io_c2h_pack_counter; // @[RxHandler.scala 45:30]
  wire [31:0] rx_buffer_fifo_io_c2h_err_counter; // @[RxHandler.scala 45:30]
  reg  QDMA_c2h_stub_in_tuser_reg; // @[RxHandler.scala 55:43]
  wire  _GEN_0 = io_QDMA_c2h_stub_in_tvalid & io_QDMA_c2h_stub_in_tready ? io_QDMA_c2h_stub_in_tlast :
    QDMA_c2h_stub_in_tuser_reg; // @[RxHandler.scala 56:65 57:32 55:43]
  wire  _io_QDMA_c2h_stub_in_tlast_T = ~io_QDMA_c2h_stub_in_tuser; // @[RxHandler.scala 64:63]
  wire [10:0] Gen_c2h_hdr_qid = {{5'd0}, rx_buffer_fifo_io_out_qid};
  wire [5:0] Gen_c2h_hdr_flow_id = Gen_c2h_hdr_qid[5:0];
  wire [15:0] Gen_c2h_hdr_tdest = {{5'd0}, Gen_c2h_hdr_qid};
  wire [15:0] Gen_c2h_hdr_pkt_len = rx_buffer_fifo_io_out_tlen;
  wire [511:0] _io_QDMA_c2h_stub_in_tdata_T = {362'h0,2'h0,4'h0,Gen_c2h_hdr_pkt_len,80'h0,Gen_c2h_hdr_tdest,10'h0,
    Gen_c2h_hdr_flow_id,5'h0,Gen_c2h_hdr_qid}; // @[RxHandler.scala 75:46]
  RxConverter rx_converter ( // @[RxHandler.scala 38:28]
    .clock(rx_converter_clock),
    .reset(rx_converter_reset),
    .io_in_tdata(rx_converter_io_in_tdata),
    .io_in_tvalid(rx_converter_io_in_tvalid),
    .io_in_tready(rx_converter_io_in_tready),
    .io_in_tlast(rx_converter_io_in_tlast),
    .io_in_tuser(rx_converter_io_in_tuser),
    .io_in_tkeep(rx_converter_io_in_tkeep),
    .io_out_tdata(rx_converter_io_out_tdata),
    .io_out_tvalid(rx_converter_io_out_tvalid),
    .io_out_tready(rx_converter_io_out_tready),
    .io_out_tlast(rx_converter_io_out_tlast),
    .io_out_tuser(rx_converter_io_out_tuser),
    .io_out_rx_info_tlen(rx_converter_io_out_rx_info_tlen),
    .io_out_extern_config_c2h_match_op(rx_converter_io_out_extern_config_c2h_match_op),
    .io_out_extern_config_c2h_match_arg_0(rx_converter_io_out_extern_config_c2h_match_arg_0),
    .io_out_extern_config_c2h_match_arg_1(rx_converter_io_out_extern_config_c2h_match_arg_1),
    .io_out_extern_config_c2h_match_arg_2(rx_converter_io_out_extern_config_c2h_match_arg_2),
    .io_out_extern_config_c2h_match_arg_3(rx_converter_io_out_extern_config_c2h_match_arg_3),
    .io_out_extern_config_c2h_match_arg_4(rx_converter_io_out_extern_config_c2h_match_arg_4),
    .io_out_extern_config_c2h_match_arg_5(rx_converter_io_out_extern_config_c2h_match_arg_5),
    .io_out_extern_config_c2h_match_arg_6(rx_converter_io_out_extern_config_c2h_match_arg_6),
    .io_out_extern_config_c2h_match_arg_7(rx_converter_io_out_extern_config_c2h_match_arg_7),
    .io_out_extern_config_c2h_match_arg_8(rx_converter_io_out_extern_config_c2h_match_arg_8),
    .io_out_extern_config_c2h_match_arg_9(rx_converter_io_out_extern_config_c2h_match_arg_9),
    .io_out_extern_config_c2h_match_arg_10(rx_converter_io_out_extern_config_c2h_match_arg_10),
    .io_out_extern_config_c2h_match_arg_11(rx_converter_io_out_extern_config_c2h_match_arg_11),
    .io_out_extern_config_c2h_match_arg_12(rx_converter_io_out_extern_config_c2h_match_arg_12),
    .io_out_extern_config_c2h_match_arg_13(rx_converter_io_out_extern_config_c2h_match_arg_13),
    .io_out_extern_config_c2h_match_arg_14(rx_converter_io_out_extern_config_c2h_match_arg_14),
    .io_out_extern_config_c2h_match_arg_15(rx_converter_io_out_extern_config_c2h_match_arg_15),
    .io_extern_config_c2h_match_op(rx_converter_io_extern_config_c2h_match_op),
    .io_extern_config_c2h_match_arg_0(rx_converter_io_extern_config_c2h_match_arg_0),
    .io_extern_config_c2h_match_arg_1(rx_converter_io_extern_config_c2h_match_arg_1),
    .io_extern_config_c2h_match_arg_2(rx_converter_io_extern_config_c2h_match_arg_2),
    .io_extern_config_c2h_match_arg_3(rx_converter_io_extern_config_c2h_match_arg_3),
    .io_extern_config_c2h_match_arg_4(rx_converter_io_extern_config_c2h_match_arg_4),
    .io_extern_config_c2h_match_arg_5(rx_converter_io_extern_config_c2h_match_arg_5),
    .io_extern_config_c2h_match_arg_6(rx_converter_io_extern_config_c2h_match_arg_6),
    .io_extern_config_c2h_match_arg_7(rx_converter_io_extern_config_c2h_match_arg_7),
    .io_extern_config_c2h_match_arg_8(rx_converter_io_extern_config_c2h_match_arg_8),
    .io_extern_config_c2h_match_arg_9(rx_converter_io_extern_config_c2h_match_arg_9),
    .io_extern_config_c2h_match_arg_10(rx_converter_io_extern_config_c2h_match_arg_10),
    .io_extern_config_c2h_match_arg_11(rx_converter_io_extern_config_c2h_match_arg_11),
    .io_extern_config_c2h_match_arg_12(rx_converter_io_extern_config_c2h_match_arg_12),
    .io_extern_config_c2h_match_arg_13(rx_converter_io_extern_config_c2h_match_arg_13),
    .io_extern_config_c2h_match_arg_14(rx_converter_io_extern_config_c2h_match_arg_14),
    .io_extern_config_c2h_match_arg_15(rx_converter_io_extern_config_c2h_match_arg_15)
  );
  RxPipeline rx_pipeline ( // @[RxHandler.scala 42:27]
    .clock(rx_pipeline_clock),
    .reset(rx_pipeline_reset),
    .io_in_tdata(rx_pipeline_io_in_tdata),
    .io_in_tvalid(rx_pipeline_io_in_tvalid),
    .io_in_tready(rx_pipeline_io_in_tready),
    .io_in_tlast(rx_pipeline_io_in_tlast),
    .io_in_tuser(rx_pipeline_io_in_tuser),
    .io_in_rx_info_tlen(rx_pipeline_io_in_rx_info_tlen),
    .io_in_extern_config_c2h_match_op(rx_pipeline_io_in_extern_config_c2h_match_op),
    .io_in_extern_config_c2h_match_arg_0(rx_pipeline_io_in_extern_config_c2h_match_arg_0),
    .io_in_extern_config_c2h_match_arg_1(rx_pipeline_io_in_extern_config_c2h_match_arg_1),
    .io_in_extern_config_c2h_match_arg_2(rx_pipeline_io_in_extern_config_c2h_match_arg_2),
    .io_in_extern_config_c2h_match_arg_3(rx_pipeline_io_in_extern_config_c2h_match_arg_3),
    .io_in_extern_config_c2h_match_arg_4(rx_pipeline_io_in_extern_config_c2h_match_arg_4),
    .io_in_extern_config_c2h_match_arg_5(rx_pipeline_io_in_extern_config_c2h_match_arg_5),
    .io_in_extern_config_c2h_match_arg_6(rx_pipeline_io_in_extern_config_c2h_match_arg_6),
    .io_in_extern_config_c2h_match_arg_7(rx_pipeline_io_in_extern_config_c2h_match_arg_7),
    .io_in_extern_config_c2h_match_arg_8(rx_pipeline_io_in_extern_config_c2h_match_arg_8),
    .io_in_extern_config_c2h_match_arg_9(rx_pipeline_io_in_extern_config_c2h_match_arg_9),
    .io_in_extern_config_c2h_match_arg_10(rx_pipeline_io_in_extern_config_c2h_match_arg_10),
    .io_in_extern_config_c2h_match_arg_11(rx_pipeline_io_in_extern_config_c2h_match_arg_11),
    .io_in_extern_config_c2h_match_arg_12(rx_pipeline_io_in_extern_config_c2h_match_arg_12),
    .io_in_extern_config_c2h_match_arg_13(rx_pipeline_io_in_extern_config_c2h_match_arg_13),
    .io_in_extern_config_c2h_match_arg_14(rx_pipeline_io_in_extern_config_c2h_match_arg_14),
    .io_in_extern_config_c2h_match_arg_15(rx_pipeline_io_in_extern_config_c2h_match_arg_15),
    .io_out_tdata(rx_pipeline_io_out_tdata),
    .io_out_tvalid(rx_pipeline_io_out_tvalid),
    .io_out_tready(rx_pipeline_io_out_tready),
    .io_out_tlast(rx_pipeline_io_out_tlast),
    .io_out_tuser(rx_pipeline_io_out_tuser),
    .io_out_rx_info_tlen(rx_pipeline_io_out_rx_info_tlen),
    .io_out_rx_info_qid(rx_pipeline_io_out_rx_info_qid),
    .io_out_rx_info_ip_chksum(rx_pipeline_io_out_rx_info_ip_chksum),
    .io_out_rx_info_tcp_chksum(rx_pipeline_io_out_rx_info_tcp_chksum),
    .io_out_extern_config_c2h_match_op(rx_pipeline_io_out_extern_config_c2h_match_op)
  );
  RxBufferFifo rx_buffer_fifo ( // @[RxHandler.scala 45:30]
    .clock(rx_buffer_fifo_clock),
    .reset(rx_buffer_fifo_reset),
    .io_in_tdata(rx_buffer_fifo_io_in_tdata),
    .io_in_tvalid(rx_buffer_fifo_io_in_tvalid),
    .io_in_tready(rx_buffer_fifo_io_in_tready),
    .io_in_tlast(rx_buffer_fifo_io_in_tlast),
    .io_in_tuser(rx_buffer_fifo_io_in_tuser),
    .io_in_rx_info_tlen(rx_buffer_fifo_io_in_rx_info_tlen),
    .io_in_rx_info_qid(rx_buffer_fifo_io_in_rx_info_qid),
    .io_in_rx_info_ip_chksum(rx_buffer_fifo_io_in_rx_info_ip_chksum),
    .io_in_rx_info_tcp_chksum(rx_buffer_fifo_io_in_rx_info_tcp_chksum),
    .io_in_extern_config_c2h_match_op(rx_buffer_fifo_io_in_extern_config_c2h_match_op),
    .io_out_tdata(rx_buffer_fifo_io_out_tdata),
    .io_out_tvalid(rx_buffer_fifo_io_out_tvalid),
    .io_out_tready(rx_buffer_fifo_io_out_tready),
    .io_out_tlast(rx_buffer_fifo_io_out_tlast),
    .io_out_qid(rx_buffer_fifo_io_out_qid),
    .io_out_tlen(rx_buffer_fifo_io_out_tlen),
    .io_reset_counter(rx_buffer_fifo_io_reset_counter),
    .io_c2h_pack_counter(rx_buffer_fifo_io_c2h_pack_counter),
    .io_c2h_err_counter(rx_buffer_fifo_io_c2h_err_counter)
  );
  assign io_CMAC_out_tready = rx_converter_io_in_tready; // @[RxHandler.scala 39:15]
  assign io_QDMA_c2h_stub_in_tdata = io_QDMA_c2h_stub_in_tuser ? _io_QDMA_c2h_stub_in_tdata_T :
    rx_buffer_fifo_io_out_tdata; // @[RxHandler.scala 68:34 75:31 78:31]
  assign io_QDMA_c2h_stub_in_tvalid = rx_buffer_fifo_io_out_tvalid; // @[RxHandler.scala 62:30]
  assign io_QDMA_c2h_stub_in_tlast = rx_buffer_fifo_io_out_tlast & ~io_QDMA_c2h_stub_in_tuser; // @[RxHandler.scala 64:61]
  assign io_QDMA_c2h_stub_in_tuser = QDMA_c2h_stub_in_tuser_reg & io_QDMA_c2h_stub_in_tvalid; // @[RxHandler.scala 60:59]
  assign io_c2h_pack_counter = rx_buffer_fifo_io_c2h_pack_counter; // @[RxHandler.scala 48:23]
  assign io_c2h_err_counter = rx_buffer_fifo_io_c2h_err_counter; // @[RxHandler.scala 49:22]
  assign rx_converter_clock = clock;
  assign rx_converter_reset = reset;
  assign rx_converter_io_in_tdata = io_CMAC_out_tdata; // @[RxHandler.scala 39:15]
  assign rx_converter_io_in_tvalid = io_CMAC_out_tvalid; // @[RxHandler.scala 39:15]
  assign rx_converter_io_in_tlast = io_CMAC_out_tlast; // @[RxHandler.scala 39:15]
  assign rx_converter_io_in_tuser = io_CMAC_out_tuser; // @[RxHandler.scala 39:15]
  assign rx_converter_io_in_tkeep = io_CMAC_out_tkeep; // @[RxHandler.scala 39:15]
  assign rx_converter_io_out_tready = rx_pipeline_io_in_tready; // @[RxHandler.scala 43:23]
  assign rx_converter_io_extern_config_c2h_match_op = io_extern_config_c2h_match_op; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_0 = io_extern_config_c2h_match_arg_0; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_1 = io_extern_config_c2h_match_arg_1; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_2 = io_extern_config_c2h_match_arg_2; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_3 = io_extern_config_c2h_match_arg_3; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_4 = io_extern_config_c2h_match_arg_4; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_5 = io_extern_config_c2h_match_arg_5; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_6 = io_extern_config_c2h_match_arg_6; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_7 = io_extern_config_c2h_match_arg_7; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_8 = io_extern_config_c2h_match_arg_8; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_9 = io_extern_config_c2h_match_arg_9; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_10 = io_extern_config_c2h_match_arg_10; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_11 = io_extern_config_c2h_match_arg_11; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_12 = io_extern_config_c2h_match_arg_12; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_13 = io_extern_config_c2h_match_arg_13; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_14 = io_extern_config_c2h_match_arg_14; // @[RxHandler.scala 40:33]
  assign rx_converter_io_extern_config_c2h_match_arg_15 = io_extern_config_c2h_match_arg_15; // @[RxHandler.scala 40:33]
  assign rx_pipeline_clock = clock;
  assign rx_pipeline_reset = reset;
  assign rx_pipeline_io_in_tdata = rx_converter_io_out_tdata; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_tvalid = rx_converter_io_out_tvalid; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_tlast = rx_converter_io_out_tlast; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_tuser = rx_converter_io_out_tuser; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_rx_info_tlen = rx_converter_io_out_rx_info_tlen; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_op = rx_converter_io_out_extern_config_c2h_match_op; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_0 = rx_converter_io_out_extern_config_c2h_match_arg_0; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_1 = rx_converter_io_out_extern_config_c2h_match_arg_1; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_2 = rx_converter_io_out_extern_config_c2h_match_arg_2; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_3 = rx_converter_io_out_extern_config_c2h_match_arg_3; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_4 = rx_converter_io_out_extern_config_c2h_match_arg_4; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_5 = rx_converter_io_out_extern_config_c2h_match_arg_5; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_6 = rx_converter_io_out_extern_config_c2h_match_arg_6; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_7 = rx_converter_io_out_extern_config_c2h_match_arg_7; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_8 = rx_converter_io_out_extern_config_c2h_match_arg_8; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_9 = rx_converter_io_out_extern_config_c2h_match_arg_9; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_10 = rx_converter_io_out_extern_config_c2h_match_arg_10; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_11 = rx_converter_io_out_extern_config_c2h_match_arg_11; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_12 = rx_converter_io_out_extern_config_c2h_match_arg_12; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_13 = rx_converter_io_out_extern_config_c2h_match_arg_13; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_14 = rx_converter_io_out_extern_config_c2h_match_arg_14; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_in_extern_config_c2h_match_arg_15 = rx_converter_io_out_extern_config_c2h_match_arg_15; // @[RxHandler.scala 43:23]
  assign rx_pipeline_io_out_tready = rx_buffer_fifo_io_in_tready; // @[RxHandler.scala 46:22]
  assign rx_buffer_fifo_clock = clock;
  assign rx_buffer_fifo_reset = reset;
  assign rx_buffer_fifo_io_in_tdata = rx_pipeline_io_out_tdata; // @[RxHandler.scala 46:22]
  assign rx_buffer_fifo_io_in_tvalid = rx_pipeline_io_out_tvalid; // @[RxHandler.scala 46:22]
  assign rx_buffer_fifo_io_in_tlast = rx_pipeline_io_out_tlast; // @[RxHandler.scala 46:22]
  assign rx_buffer_fifo_io_in_tuser = rx_pipeline_io_out_tuser; // @[RxHandler.scala 46:22]
  assign rx_buffer_fifo_io_in_rx_info_tlen = rx_pipeline_io_out_rx_info_tlen; // @[RxHandler.scala 46:22]
  assign rx_buffer_fifo_io_in_rx_info_qid = rx_pipeline_io_out_rx_info_qid; // @[RxHandler.scala 46:22]
  assign rx_buffer_fifo_io_in_rx_info_ip_chksum = rx_pipeline_io_out_rx_info_ip_chksum; // @[RxHandler.scala 46:22]
  assign rx_buffer_fifo_io_in_rx_info_tcp_chksum = rx_pipeline_io_out_rx_info_tcp_chksum; // @[RxHandler.scala 46:22]
  assign rx_buffer_fifo_io_in_extern_config_c2h_match_op = rx_pipeline_io_out_extern_config_c2h_match_op; // @[RxHandler.scala 46:22]
  assign rx_buffer_fifo_io_out_tready = io_QDMA_c2h_stub_in_tready & _io_QDMA_c2h_stub_in_tlast_T; // @[RxHandler.scala 65:63]
  assign rx_buffer_fifo_io_reset_counter = io_reset_counter; // @[RxHandler.scala 47:35]
  always @(posedge clock) begin
    QDMA_c2h_stub_in_tuser_reg <= reset | _GEN_0; // @[RxHandler.scala 55:{43,43}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  QDMA_c2h_stub_in_tuser_reg = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PackageHandler(
  input          clock,
  input          reset,
  input  [511:0] io_QDMA_h2c_stub_out_tdata,
  input          io_QDMA_h2c_stub_out_tvalid,
  output         io_QDMA_h2c_stub_out_tready,
  input          io_QDMA_h2c_stub_out_tlast,
  input          io_QDMA_h2c_stub_out_tuser,
  output [511:0] io_CMAC_in_tdata,
  output         io_CMAC_in_tvalid,
  input          io_CMAC_in_tready,
  output         io_CMAC_in_tlast,
  output         io_CMAC_in_tuser,
  output [63:0]  io_CMAC_in_tkeep,
  input  [511:0] io_CMAC_out_tdata,
  input          io_CMAC_out_tvalid,
  output         io_CMAC_out_tready,
  input          io_CMAC_out_tlast,
  input          io_CMAC_out_tuser,
  input  [63:0]  io_CMAC_out_tkeep,
  output [511:0] io_QDMA_c2h_stub_in_tdata,
  output         io_QDMA_c2h_stub_in_tvalid,
  input          io_QDMA_c2h_stub_in_tready,
  output         io_QDMA_c2h_stub_in_tlast,
  output         io_QDMA_c2h_stub_in_tuser,
  input          io_reset_counter,
  input  [7:0]   io_extern_config_c2h_match_op,
  input  [31:0]  io_extern_config_c2h_match_arg_0,
  input  [31:0]  io_extern_config_c2h_match_arg_1,
  input  [31:0]  io_extern_config_c2h_match_arg_2,
  input  [31:0]  io_extern_config_c2h_match_arg_3,
  input  [31:0]  io_extern_config_c2h_match_arg_4,
  input  [31:0]  io_extern_config_c2h_match_arg_5,
  input  [31:0]  io_extern_config_c2h_match_arg_6,
  input  [31:0]  io_extern_config_c2h_match_arg_7,
  input  [31:0]  io_extern_config_c2h_match_arg_8,
  input  [31:0]  io_extern_config_c2h_match_arg_9,
  input  [31:0]  io_extern_config_c2h_match_arg_10,
  input  [31:0]  io_extern_config_c2h_match_arg_11,
  input  [31:0]  io_extern_config_c2h_match_arg_12,
  input  [31:0]  io_extern_config_c2h_match_arg_13,
  input  [31:0]  io_extern_config_c2h_match_arg_14,
  input  [31:0]  io_extern_config_c2h_match_arg_15,
  output [31:0]  io_c2h_pack_counter,
  output [31:0]  io_c2h_err_counter,
  output [31:0]  io_h2c_pack_counter,
  output [31:0]  io_h2c_err_counter
);
  wire  tx_handler_clock; // @[PackageHandler.scala 30:26]
  wire  tx_handler_reset; // @[PackageHandler.scala 30:26]
  wire [511:0] tx_handler_io_QDMA_h2c_stub_out_tdata; // @[PackageHandler.scala 30:26]
  wire  tx_handler_io_QDMA_h2c_stub_out_tvalid; // @[PackageHandler.scala 30:26]
  wire  tx_handler_io_QDMA_h2c_stub_out_tready; // @[PackageHandler.scala 30:26]
  wire  tx_handler_io_QDMA_h2c_stub_out_tlast; // @[PackageHandler.scala 30:26]
  wire  tx_handler_io_QDMA_h2c_stub_out_tuser; // @[PackageHandler.scala 30:26]
  wire [511:0] tx_handler_io_CMAC_in_tdata; // @[PackageHandler.scala 30:26]
  wire  tx_handler_io_CMAC_in_tvalid; // @[PackageHandler.scala 30:26]
  wire  tx_handler_io_CMAC_in_tready; // @[PackageHandler.scala 30:26]
  wire  tx_handler_io_CMAC_in_tlast; // @[PackageHandler.scala 30:26]
  wire  tx_handler_io_reset_counter; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_h2c_pack_counter; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_h2c_err_counter; // @[PackageHandler.scala 30:26]
  wire [7:0] tx_handler_io_extern_config_c2h_match_op; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_0; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_1; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_2; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_3; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_4; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_5; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_6; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_7; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_8; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_9; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_10; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_11; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_12; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_13; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_14; // @[PackageHandler.scala 30:26]
  wire [31:0] tx_handler_io_extern_config_c2h_match_arg_15; // @[PackageHandler.scala 30:26]
  wire  rx_handler_clock; // @[PackageHandler.scala 38:26]
  wire  rx_handler_reset; // @[PackageHandler.scala 38:26]
  wire [511:0] rx_handler_io_CMAC_out_tdata; // @[PackageHandler.scala 38:26]
  wire  rx_handler_io_CMAC_out_tvalid; // @[PackageHandler.scala 38:26]
  wire  rx_handler_io_CMAC_out_tready; // @[PackageHandler.scala 38:26]
  wire  rx_handler_io_CMAC_out_tlast; // @[PackageHandler.scala 38:26]
  wire  rx_handler_io_CMAC_out_tuser; // @[PackageHandler.scala 38:26]
  wire [63:0] rx_handler_io_CMAC_out_tkeep; // @[PackageHandler.scala 38:26]
  wire [511:0] rx_handler_io_QDMA_c2h_stub_in_tdata; // @[PackageHandler.scala 38:26]
  wire  rx_handler_io_QDMA_c2h_stub_in_tvalid; // @[PackageHandler.scala 38:26]
  wire  rx_handler_io_QDMA_c2h_stub_in_tready; // @[PackageHandler.scala 38:26]
  wire  rx_handler_io_QDMA_c2h_stub_in_tlast; // @[PackageHandler.scala 38:26]
  wire  rx_handler_io_QDMA_c2h_stub_in_tuser; // @[PackageHandler.scala 38:26]
  wire  rx_handler_io_reset_counter; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_c2h_pack_counter; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_c2h_err_counter; // @[PackageHandler.scala 38:26]
  wire [7:0] rx_handler_io_extern_config_c2h_match_op; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_0; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_1; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_2; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_3; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_4; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_5; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_6; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_7; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_8; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_9; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_10; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_11; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_12; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_13; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_14; // @[PackageHandler.scala 38:26]
  wire [31:0] rx_handler_io_extern_config_c2h_match_arg_15; // @[PackageHandler.scala 38:26]
  TxHandler tx_handler ( // @[PackageHandler.scala 30:26]
    .clock(tx_handler_clock),
    .reset(tx_handler_reset),
    .io_QDMA_h2c_stub_out_tdata(tx_handler_io_QDMA_h2c_stub_out_tdata),
    .io_QDMA_h2c_stub_out_tvalid(tx_handler_io_QDMA_h2c_stub_out_tvalid),
    .io_QDMA_h2c_stub_out_tready(tx_handler_io_QDMA_h2c_stub_out_tready),
    .io_QDMA_h2c_stub_out_tlast(tx_handler_io_QDMA_h2c_stub_out_tlast),
    .io_QDMA_h2c_stub_out_tuser(tx_handler_io_QDMA_h2c_stub_out_tuser),
    .io_CMAC_in_tdata(tx_handler_io_CMAC_in_tdata),
    .io_CMAC_in_tvalid(tx_handler_io_CMAC_in_tvalid),
    .io_CMAC_in_tready(tx_handler_io_CMAC_in_tready),
    .io_CMAC_in_tlast(tx_handler_io_CMAC_in_tlast),
    .io_reset_counter(tx_handler_io_reset_counter),
    .io_h2c_pack_counter(tx_handler_io_h2c_pack_counter),
    .io_h2c_err_counter(tx_handler_io_h2c_err_counter),
    .io_extern_config_c2h_match_op(tx_handler_io_extern_config_c2h_match_op),
    .io_extern_config_c2h_match_arg_0(tx_handler_io_extern_config_c2h_match_arg_0),
    .io_extern_config_c2h_match_arg_1(tx_handler_io_extern_config_c2h_match_arg_1),
    .io_extern_config_c2h_match_arg_2(tx_handler_io_extern_config_c2h_match_arg_2),
    .io_extern_config_c2h_match_arg_3(tx_handler_io_extern_config_c2h_match_arg_3),
    .io_extern_config_c2h_match_arg_4(tx_handler_io_extern_config_c2h_match_arg_4),
    .io_extern_config_c2h_match_arg_5(tx_handler_io_extern_config_c2h_match_arg_5),
    .io_extern_config_c2h_match_arg_6(tx_handler_io_extern_config_c2h_match_arg_6),
    .io_extern_config_c2h_match_arg_7(tx_handler_io_extern_config_c2h_match_arg_7),
    .io_extern_config_c2h_match_arg_8(tx_handler_io_extern_config_c2h_match_arg_8),
    .io_extern_config_c2h_match_arg_9(tx_handler_io_extern_config_c2h_match_arg_9),
    .io_extern_config_c2h_match_arg_10(tx_handler_io_extern_config_c2h_match_arg_10),
    .io_extern_config_c2h_match_arg_11(tx_handler_io_extern_config_c2h_match_arg_11),
    .io_extern_config_c2h_match_arg_12(tx_handler_io_extern_config_c2h_match_arg_12),
    .io_extern_config_c2h_match_arg_13(tx_handler_io_extern_config_c2h_match_arg_13),
    .io_extern_config_c2h_match_arg_14(tx_handler_io_extern_config_c2h_match_arg_14),
    .io_extern_config_c2h_match_arg_15(tx_handler_io_extern_config_c2h_match_arg_15)
  );
  RxHandler rx_handler ( // @[PackageHandler.scala 38:26]
    .clock(rx_handler_clock),
    .reset(rx_handler_reset),
    .io_CMAC_out_tdata(rx_handler_io_CMAC_out_tdata),
    .io_CMAC_out_tvalid(rx_handler_io_CMAC_out_tvalid),
    .io_CMAC_out_tready(rx_handler_io_CMAC_out_tready),
    .io_CMAC_out_tlast(rx_handler_io_CMAC_out_tlast),
    .io_CMAC_out_tuser(rx_handler_io_CMAC_out_tuser),
    .io_CMAC_out_tkeep(rx_handler_io_CMAC_out_tkeep),
    .io_QDMA_c2h_stub_in_tdata(rx_handler_io_QDMA_c2h_stub_in_tdata),
    .io_QDMA_c2h_stub_in_tvalid(rx_handler_io_QDMA_c2h_stub_in_tvalid),
    .io_QDMA_c2h_stub_in_tready(rx_handler_io_QDMA_c2h_stub_in_tready),
    .io_QDMA_c2h_stub_in_tlast(rx_handler_io_QDMA_c2h_stub_in_tlast),
    .io_QDMA_c2h_stub_in_tuser(rx_handler_io_QDMA_c2h_stub_in_tuser),
    .io_reset_counter(rx_handler_io_reset_counter),
    .io_c2h_pack_counter(rx_handler_io_c2h_pack_counter),
    .io_c2h_err_counter(rx_handler_io_c2h_err_counter),
    .io_extern_config_c2h_match_op(rx_handler_io_extern_config_c2h_match_op),
    .io_extern_config_c2h_match_arg_0(rx_handler_io_extern_config_c2h_match_arg_0),
    .io_extern_config_c2h_match_arg_1(rx_handler_io_extern_config_c2h_match_arg_1),
    .io_extern_config_c2h_match_arg_2(rx_handler_io_extern_config_c2h_match_arg_2),
    .io_extern_config_c2h_match_arg_3(rx_handler_io_extern_config_c2h_match_arg_3),
    .io_extern_config_c2h_match_arg_4(rx_handler_io_extern_config_c2h_match_arg_4),
    .io_extern_config_c2h_match_arg_5(rx_handler_io_extern_config_c2h_match_arg_5),
    .io_extern_config_c2h_match_arg_6(rx_handler_io_extern_config_c2h_match_arg_6),
    .io_extern_config_c2h_match_arg_7(rx_handler_io_extern_config_c2h_match_arg_7),
    .io_extern_config_c2h_match_arg_8(rx_handler_io_extern_config_c2h_match_arg_8),
    .io_extern_config_c2h_match_arg_9(rx_handler_io_extern_config_c2h_match_arg_9),
    .io_extern_config_c2h_match_arg_10(rx_handler_io_extern_config_c2h_match_arg_10),
    .io_extern_config_c2h_match_arg_11(rx_handler_io_extern_config_c2h_match_arg_11),
    .io_extern_config_c2h_match_arg_12(rx_handler_io_extern_config_c2h_match_arg_12),
    .io_extern_config_c2h_match_arg_13(rx_handler_io_extern_config_c2h_match_arg_13),
    .io_extern_config_c2h_match_arg_14(rx_handler_io_extern_config_c2h_match_arg_14),
    .io_extern_config_c2h_match_arg_15(rx_handler_io_extern_config_c2h_match_arg_15)
  );
  assign io_QDMA_h2c_stub_out_tready = tx_handler_io_QDMA_h2c_stub_out_tready; // @[PackageHandler.scala 31:24]
  assign io_CMAC_in_tdata = tx_handler_io_CMAC_in_tdata; // @[PackageHandler.scala 32:24]
  assign io_CMAC_in_tvalid = tx_handler_io_CMAC_in_tvalid; // @[PackageHandler.scala 32:24]
  assign io_CMAC_in_tlast = tx_handler_io_CMAC_in_tlast; // @[PackageHandler.scala 32:24]
  assign io_CMAC_in_tuser = 1'h0; // @[PackageHandler.scala 32:24]
  assign io_CMAC_in_tkeep = 64'hffffffffffffffff; // @[PackageHandler.scala 32:24]
  assign io_CMAC_out_tready = rx_handler_io_CMAC_out_tready; // @[PackageHandler.scala 40:23]
  assign io_QDMA_c2h_stub_in_tdata = rx_handler_io_QDMA_c2h_stub_in_tdata; // @[PackageHandler.scala 39:23]
  assign io_QDMA_c2h_stub_in_tvalid = rx_handler_io_QDMA_c2h_stub_in_tvalid; // @[PackageHandler.scala 39:23]
  assign io_QDMA_c2h_stub_in_tlast = rx_handler_io_QDMA_c2h_stub_in_tlast; // @[PackageHandler.scala 39:23]
  assign io_QDMA_c2h_stub_in_tuser = rx_handler_io_QDMA_c2h_stub_in_tuser; // @[PackageHandler.scala 39:23]
  assign io_c2h_pack_counter = rx_handler_io_c2h_pack_counter; // @[PackageHandler.scala 43:33]
  assign io_c2h_err_counter = rx_handler_io_c2h_err_counter; // @[PackageHandler.scala 44:33]
  assign io_h2c_pack_counter = tx_handler_io_h2c_pack_counter; // @[PackageHandler.scala 35:31]
  assign io_h2c_err_counter = tx_handler_io_h2c_err_counter; // @[PackageHandler.scala 36:31]
  assign tx_handler_clock = clock;
  assign tx_handler_reset = reset;
  assign tx_handler_io_QDMA_h2c_stub_out_tdata = io_QDMA_h2c_stub_out_tdata; // @[PackageHandler.scala 31:24]
  assign tx_handler_io_QDMA_h2c_stub_out_tvalid = io_QDMA_h2c_stub_out_tvalid; // @[PackageHandler.scala 31:24]
  assign tx_handler_io_QDMA_h2c_stub_out_tlast = io_QDMA_h2c_stub_out_tlast; // @[PackageHandler.scala 31:24]
  assign tx_handler_io_QDMA_h2c_stub_out_tuser = io_QDMA_h2c_stub_out_tuser; // @[PackageHandler.scala 31:24]
  assign tx_handler_io_CMAC_in_tready = io_CMAC_in_tready; // @[PackageHandler.scala 32:24]
  assign tx_handler_io_reset_counter = io_reset_counter; // @[PackageHandler.scala 33:31]
  assign tx_handler_io_extern_config_c2h_match_op = io_extern_config_c2h_match_op; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_0 = io_extern_config_c2h_match_arg_0; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_1 = io_extern_config_c2h_match_arg_1; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_2 = io_extern_config_c2h_match_arg_2; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_3 = io_extern_config_c2h_match_arg_3; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_4 = io_extern_config_c2h_match_arg_4; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_5 = io_extern_config_c2h_match_arg_5; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_6 = io_extern_config_c2h_match_arg_6; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_7 = io_extern_config_c2h_match_arg_7; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_8 = io_extern_config_c2h_match_arg_8; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_9 = io_extern_config_c2h_match_arg_9; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_10 = io_extern_config_c2h_match_arg_10; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_11 = io_extern_config_c2h_match_arg_11; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_12 = io_extern_config_c2h_match_arg_12; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_13 = io_extern_config_c2h_match_arg_13; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_14 = io_extern_config_c2h_match_arg_14; // @[PackageHandler.scala 34:33]
  assign tx_handler_io_extern_config_c2h_match_arg_15 = io_extern_config_c2h_match_arg_15; // @[PackageHandler.scala 34:33]
  assign rx_handler_clock = clock;
  assign rx_handler_reset = reset;
  assign rx_handler_io_CMAC_out_tdata = io_CMAC_out_tdata; // @[PackageHandler.scala 40:23]
  assign rx_handler_io_CMAC_out_tvalid = io_CMAC_out_tvalid; // @[PackageHandler.scala 40:23]
  assign rx_handler_io_CMAC_out_tlast = io_CMAC_out_tlast; // @[PackageHandler.scala 40:23]
  assign rx_handler_io_CMAC_out_tuser = io_CMAC_out_tuser; // @[PackageHandler.scala 40:23]
  assign rx_handler_io_CMAC_out_tkeep = io_CMAC_out_tkeep; // @[PackageHandler.scala 40:23]
  assign rx_handler_io_QDMA_c2h_stub_in_tready = io_QDMA_c2h_stub_in_tready; // @[PackageHandler.scala 39:23]
  assign rx_handler_io_reset_counter = io_reset_counter; // @[PackageHandler.scala 41:33]
  assign rx_handler_io_extern_config_c2h_match_op = io_extern_config_c2h_match_op; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_0 = io_extern_config_c2h_match_arg_0; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_1 = io_extern_config_c2h_match_arg_1; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_2 = io_extern_config_c2h_match_arg_2; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_3 = io_extern_config_c2h_match_arg_3; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_4 = io_extern_config_c2h_match_arg_4; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_5 = io_extern_config_c2h_match_arg_5; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_6 = io_extern_config_c2h_match_arg_6; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_7 = io_extern_config_c2h_match_arg_7; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_8 = io_extern_config_c2h_match_arg_8; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_9 = io_extern_config_c2h_match_arg_9; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_10 = io_extern_config_c2h_match_arg_10; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_11 = io_extern_config_c2h_match_arg_11; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_12 = io_extern_config_c2h_match_arg_12; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_13 = io_extern_config_c2h_match_arg_13; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_14 = io_extern_config_c2h_match_arg_14; // @[PackageHandler.scala 42:33]
  assign rx_handler_io_extern_config_c2h_match_arg_15 = io_extern_config_c2h_match_arg_15; // @[PackageHandler.scala 42:33]
endmodule
