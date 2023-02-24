module TxConverter(
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
  input  [7:0]   io_extern_config_c2h_match_op
);
  assign io_in_tready = io_out_tready; // @[TxConverter.scala 21:26]
  assign io_out_tdata = io_in_tdata; // @[TxConverter.scala 20:26]
  assign io_out_tvalid = io_in_tvalid & ~io_in_tuser; // @[TxConverter.scala 15:34]
  assign io_out_tlast = io_in_tlast; // @[TxConverter.scala 19:26]
  assign io_out_extern_config_c2h_match_op = io_extern_config_c2h_match_op; // @[TxConverter.scala 16:26]
endmodule
module TxPipeline(
  input  [511:0] io_in_tdata,
  input          io_in_tvalid,
  output         io_in_tready,
  input          io_in_tlast,
  input  [7:0]   io_in_extern_config_c2h_match_op,
  output [511:0] io_out_tdata,
  output         io_out_tvalid,
  input          io_out_tready,
  output         io_out_tlast,
  output [7:0]   io_out_extern_config_c2h_match_op
);
  assign io_in_tready = io_out_tready; // @[TxPipeline.scala 14:9]
  assign io_out_tdata = io_in_tdata; // @[TxPipeline.scala 14:9]
  assign io_out_tvalid = io_in_tvalid; // @[TxPipeline.scala 14:9]
  assign io_out_tlast = io_in_tlast; // @[TxPipeline.scala 14:9]
  assign io_out_extern_config_c2h_match_op = io_in_extern_config_c2h_match_op; // @[TxPipeline.scala 14:9]
endmodule
module TxBufferFifo(
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
  wire [15:0] _GEN_39 = ~wr_index_reg[0] ? 16'hffff : info_buf_reg_0_ip_chksum; // @[TxBufferFifo.scala 114:{50,50} 42:29]
  wire [15:0] _GEN_40 = wr_index_reg[0] ? 16'hffff : info_buf_reg_1_ip_chksum; // @[TxBufferFifo.scala 114:{50,50} 42:29]
  wire [15:0] _GEN_41 = ~wr_index_reg[0] ? 16'hffff : info_buf_reg_0_tcp_chksum; // @[TxBufferFifo.scala 115:{51,51} 42:29]
  wire [15:0] _GEN_42 = wr_index_reg[0] ? 16'hffff : info_buf_reg_1_tcp_chksum; // @[TxBufferFifo.scala 115:{51,51} 42:29]
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
  input  [7:0]   io_extern_config_c2h_match_op
);
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
  wire [511:0] tx_pipeline_io_in_tdata; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_io_in_tvalid; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_io_in_tready; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_io_in_tlast; // @[TxHandler.scala 24:27]
  wire [7:0] tx_pipeline_io_in_extern_config_c2h_match_op; // @[TxHandler.scala 24:27]
  wire [511:0] tx_pipeline_io_out_tdata; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_io_out_tvalid; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_io_out_tready; // @[TxHandler.scala 24:27]
  wire  tx_pipeline_io_out_tlast; // @[TxHandler.scala 24:27]
  wire [7:0] tx_pipeline_io_out_extern_config_c2h_match_op; // @[TxHandler.scala 24:27]
  wire  tx_buffer_fifo_clock; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_reset; // @[TxHandler.scala 27:30]
  wire [511:0] tx_buffer_fifo_io_in_tdata; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_in_tvalid; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_in_tready; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_in_tlast; // @[TxHandler.scala 27:30]
  wire [7:0] tx_buffer_fifo_io_in_extern_config_c2h_match_op; // @[TxHandler.scala 27:30]
  wire [511:0] tx_buffer_fifo_io_out_tdata; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_out_tvalid; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_out_tready; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_out_tlast; // @[TxHandler.scala 27:30]
  wire  tx_buffer_fifo_io_reset_counter; // @[TxHandler.scala 27:30]
  wire [31:0] tx_buffer_fifo_io_h2c_pack_counter; // @[TxHandler.scala 27:30]
  wire [31:0] tx_buffer_fifo_io_h2c_err_counter; // @[TxHandler.scala 27:30]
  TxConverter tx_converter ( // @[TxHandler.scala 20:28]
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
    .io_extern_config_c2h_match_op(tx_converter_io_extern_config_c2h_match_op)
  );
  TxPipeline tx_pipeline ( // @[TxHandler.scala 24:27]
    .io_in_tdata(tx_pipeline_io_in_tdata),
    .io_in_tvalid(tx_pipeline_io_in_tvalid),
    .io_in_tready(tx_pipeline_io_in_tready),
    .io_in_tlast(tx_pipeline_io_in_tlast),
    .io_in_extern_config_c2h_match_op(tx_pipeline_io_in_extern_config_c2h_match_op),
    .io_out_tdata(tx_pipeline_io_out_tdata),
    .io_out_tvalid(tx_pipeline_io_out_tvalid),
    .io_out_tready(tx_pipeline_io_out_tready),
    .io_out_tlast(tx_pipeline_io_out_tlast),
    .io_out_extern_config_c2h_match_op(tx_pipeline_io_out_extern_config_c2h_match_op)
  );
  TxBufferFifo tx_buffer_fifo ( // @[TxHandler.scala 27:30]
    .clock(tx_buffer_fifo_clock),
    .reset(tx_buffer_fifo_reset),
    .io_in_tdata(tx_buffer_fifo_io_in_tdata),
    .io_in_tvalid(tx_buffer_fifo_io_in_tvalid),
    .io_in_tready(tx_buffer_fifo_io_in_tready),
    .io_in_tlast(tx_buffer_fifo_io_in_tlast),
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
  assign tx_converter_io_in_tdata = io_QDMA_h2c_stub_out_tdata; // @[TxHandler.scala 21:32]
  assign tx_converter_io_in_tvalid = io_QDMA_h2c_stub_out_tvalid; // @[TxHandler.scala 21:32]
  assign tx_converter_io_in_tlast = io_QDMA_h2c_stub_out_tlast; // @[TxHandler.scala 21:32]
  assign tx_converter_io_in_tuser = io_QDMA_h2c_stub_out_tuser; // @[TxHandler.scala 21:32]
  assign tx_converter_io_out_tready = tx_pipeline_io_in_tready; // @[TxHandler.scala 25:23]
  assign tx_converter_io_extern_config_c2h_match_op = io_extern_config_c2h_match_op; // @[TxHandler.scala 22:33]
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
  assign tx_buffer_fifo_io_in_extern_config_c2h_match_op = tx_pipeline_io_out_extern_config_c2h_match_op; // @[TxHandler.scala 28:35]
  assign tx_buffer_fifo_io_out_tready = io_CMAC_in_tready; // @[TxHandler.scala 29:35]
  assign tx_buffer_fifo_io_reset_counter = io_reset_counter; // @[TxHandler.scala 30:35]
endmodule
module ReduceAddSync(
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
  input  [7:0]   io_extern_config_c2h_match_op,
  input  [31:0]  io_extern_config_c2h_match_arg_0,
  input  [31:0]  io_extern_config_c2h_match_arg_1,
  input  [31:0]  io_extern_config_c2h_match_arg_2,
  input  [31:0]  io_extern_config_c2h_match_arg_3,
  input  [31:0]  io_extern_config_c2h_match_arg_4,
  input  [31:0]  io_extern_config_c2h_match_arg_5,
  input  [31:0]  io_extern_config_c2h_match_arg_6,
  input  [31:0]  io_extern_config_c2h_match_arg_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [607:0] _RAND_0;
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
`endif // RANDOMIZE_REG_INIT
  wire  burst_size_cal_clock; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_0; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_1; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_2; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_3; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_4; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_5; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_6; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_7; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_8; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_9; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_10; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_11; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_12; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_13; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_14; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_15; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_16; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_17; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_18; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_19; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_20; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_21; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_22; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_23; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_24; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_25; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_26; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_27; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_28; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_29; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_30; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_31; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_32; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_33; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_34; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_35; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_36; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_37; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_38; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_39; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_40; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_41; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_42; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_43; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_44; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_45; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_46; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_47; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_48; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_49; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_50; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_51; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_52; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_53; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_54; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_55; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_56; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_57; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_58; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_59; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_60; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_61; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_62; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_in_vec_63; // @[RxConverter.scala 29:30]
  wire [7:0] burst_size_cal_io_out_sum; // @[RxConverter.scala 29:30]
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
  reg [7:0] extern_config_reg_c2h_match_op; // @[RxConverter.scala 25:34]
  reg [31:0] extern_config_reg_c2h_match_arg_0; // @[RxConverter.scala 25:34]
  reg [31:0] extern_config_reg_c2h_match_arg_1; // @[RxConverter.scala 25:34]
  reg [31:0] extern_config_reg_c2h_match_arg_2; // @[RxConverter.scala 25:34]
  reg [31:0] extern_config_reg_c2h_match_arg_3; // @[RxConverter.scala 25:34]
  reg [31:0] extern_config_reg_c2h_match_arg_4; // @[RxConverter.scala 25:34]
  reg [31:0] extern_config_reg_c2h_match_arg_5; // @[RxConverter.scala 25:34]
  reg [31:0] extern_config_reg_c2h_match_arg_6; // @[RxConverter.scala 25:34]
  reg [31:0] extern_config_reg_c2h_match_arg_7; // @[RxConverter.scala 25:34]
  wire [63:0] cal_tkeep = in_shake_hand ? io_in_tkeep : in_reg_tkeep; // @[RxConverter.scala 28:22]
  reg [15:0] tlen_reg; // @[RxConverter.scala 34:25]
  wire [15:0] _GEN_6 = {{8'd0}, burst_size_cal_io_out_sum}; // @[RxConverter.scala 39:28]
  wire [15:0] _tlen_reg_T_1 = tlen_reg + _GEN_6; // @[RxConverter.scala 39:28]
  wire  keep_val_0 = in_reg_tkeep[0]; // @[RxConverter.scala 45:32]
  wire  keep_val_8 = in_reg_tkeep[1]; // @[RxConverter.scala 45:32]
  wire  keep_val_16 = in_reg_tkeep[2]; // @[RxConverter.scala 45:32]
  wire  keep_val_24 = in_reg_tkeep[3]; // @[RxConverter.scala 45:32]
  wire  keep_val_32 = in_reg_tkeep[4]; // @[RxConverter.scala 45:32]
  wire  keep_val_40 = in_reg_tkeep[5]; // @[RxConverter.scala 45:32]
  wire  keep_val_48 = in_reg_tkeep[6]; // @[RxConverter.scala 45:32]
  wire  keep_val_56 = in_reg_tkeep[7]; // @[RxConverter.scala 45:32]
  wire  keep_val_64 = in_reg_tkeep[8]; // @[RxConverter.scala 45:32]
  wire  keep_val_72 = in_reg_tkeep[9]; // @[RxConverter.scala 45:32]
  wire  keep_val_80 = in_reg_tkeep[10]; // @[RxConverter.scala 45:32]
  wire  keep_val_88 = in_reg_tkeep[11]; // @[RxConverter.scala 45:32]
  wire  keep_val_96 = in_reg_tkeep[12]; // @[RxConverter.scala 45:32]
  wire  keep_val_104 = in_reg_tkeep[13]; // @[RxConverter.scala 45:32]
  wire  keep_val_112 = in_reg_tkeep[14]; // @[RxConverter.scala 45:32]
  wire  keep_val_120 = in_reg_tkeep[15]; // @[RxConverter.scala 45:32]
  wire  keep_val_128 = in_reg_tkeep[16]; // @[RxConverter.scala 45:32]
  wire  keep_val_136 = in_reg_tkeep[17]; // @[RxConverter.scala 45:32]
  wire  keep_val_144 = in_reg_tkeep[18]; // @[RxConverter.scala 45:32]
  wire  keep_val_152 = in_reg_tkeep[19]; // @[RxConverter.scala 45:32]
  wire  keep_val_160 = in_reg_tkeep[20]; // @[RxConverter.scala 45:32]
  wire  keep_val_168 = in_reg_tkeep[21]; // @[RxConverter.scala 45:32]
  wire  keep_val_176 = in_reg_tkeep[22]; // @[RxConverter.scala 45:32]
  wire  keep_val_184 = in_reg_tkeep[23]; // @[RxConverter.scala 45:32]
  wire  keep_val_192 = in_reg_tkeep[24]; // @[RxConverter.scala 45:32]
  wire  keep_val_200 = in_reg_tkeep[25]; // @[RxConverter.scala 45:32]
  wire  keep_val_208 = in_reg_tkeep[26]; // @[RxConverter.scala 45:32]
  wire  keep_val_216 = in_reg_tkeep[27]; // @[RxConverter.scala 45:32]
  wire  keep_val_224 = in_reg_tkeep[28]; // @[RxConverter.scala 45:32]
  wire  keep_val_232 = in_reg_tkeep[29]; // @[RxConverter.scala 45:32]
  wire  keep_val_240 = in_reg_tkeep[30]; // @[RxConverter.scala 45:32]
  wire  keep_val_248 = in_reg_tkeep[31]; // @[RxConverter.scala 45:32]
  wire  keep_val_256 = in_reg_tkeep[32]; // @[RxConverter.scala 45:32]
  wire  keep_val_264 = in_reg_tkeep[33]; // @[RxConverter.scala 45:32]
  wire  keep_val_272 = in_reg_tkeep[34]; // @[RxConverter.scala 45:32]
  wire  keep_val_280 = in_reg_tkeep[35]; // @[RxConverter.scala 45:32]
  wire  keep_val_288 = in_reg_tkeep[36]; // @[RxConverter.scala 45:32]
  wire  keep_val_296 = in_reg_tkeep[37]; // @[RxConverter.scala 45:32]
  wire  keep_val_304 = in_reg_tkeep[38]; // @[RxConverter.scala 45:32]
  wire  keep_val_312 = in_reg_tkeep[39]; // @[RxConverter.scala 45:32]
  wire  keep_val_320 = in_reg_tkeep[40]; // @[RxConverter.scala 45:32]
  wire  keep_val_328 = in_reg_tkeep[41]; // @[RxConverter.scala 45:32]
  wire  keep_val_336 = in_reg_tkeep[42]; // @[RxConverter.scala 45:32]
  wire  keep_val_344 = in_reg_tkeep[43]; // @[RxConverter.scala 45:32]
  wire  keep_val_352 = in_reg_tkeep[44]; // @[RxConverter.scala 45:32]
  wire  keep_val_360 = in_reg_tkeep[45]; // @[RxConverter.scala 45:32]
  wire  keep_val_368 = in_reg_tkeep[46]; // @[RxConverter.scala 45:32]
  wire  keep_val_376 = in_reg_tkeep[47]; // @[RxConverter.scala 45:32]
  wire  keep_val_384 = in_reg_tkeep[48]; // @[RxConverter.scala 45:32]
  wire  keep_val_392 = in_reg_tkeep[49]; // @[RxConverter.scala 45:32]
  wire  keep_val_400 = in_reg_tkeep[50]; // @[RxConverter.scala 45:32]
  wire  keep_val_408 = in_reg_tkeep[51]; // @[RxConverter.scala 45:32]
  wire  keep_val_416 = in_reg_tkeep[52]; // @[RxConverter.scala 45:32]
  wire  keep_val_424 = in_reg_tkeep[53]; // @[RxConverter.scala 45:32]
  wire  keep_val_432 = in_reg_tkeep[54]; // @[RxConverter.scala 45:32]
  wire  keep_val_440 = in_reg_tkeep[55]; // @[RxConverter.scala 45:32]
  wire  keep_val_448 = in_reg_tkeep[56]; // @[RxConverter.scala 45:32]
  wire  keep_val_456 = in_reg_tkeep[57]; // @[RxConverter.scala 45:32]
  wire  keep_val_464 = in_reg_tkeep[58]; // @[RxConverter.scala 45:32]
  wire  keep_val_472 = in_reg_tkeep[59]; // @[RxConverter.scala 45:32]
  wire  keep_val_480 = in_reg_tkeep[60]; // @[RxConverter.scala 45:32]
  wire  keep_val_488 = in_reg_tkeep[61]; // @[RxConverter.scala 45:32]
  wire  keep_val_496 = in_reg_tkeep[62]; // @[RxConverter.scala 45:32]
  wire  keep_val_504 = in_reg_tkeep[63]; // @[RxConverter.scala 45:32]
  wire [7:0] io_out_tdata_lo_lo_lo_lo_lo_lo = {keep_val_0,keep_val_0,keep_val_0,keep_val_0,keep_val_0,keep_val_0,
    keep_val_0,keep_val_0}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_lo_lo_lo_lo_lo = {keep_val_8,keep_val_8,keep_val_8,keep_val_8,keep_val_8,keep_val_8,
    keep_val_8,keep_val_8,io_out_tdata_lo_lo_lo_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_lo_lo_lo_hi_lo = {keep_val_16,keep_val_16,keep_val_16,keep_val_16,keep_val_16,keep_val_16,
    keep_val_16,keep_val_16}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_lo_lo_lo_lo = {keep_val_24,keep_val_24,keep_val_24,keep_val_24,keep_val_24,keep_val_24,
    keep_val_24,keep_val_24,io_out_tdata_lo_lo_lo_lo_hi_lo,io_out_tdata_lo_lo_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_lo_lo_hi_lo_lo = {keep_val_32,keep_val_32,keep_val_32,keep_val_32,keep_val_32,keep_val_32,
    keep_val_32,keep_val_32}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_lo_lo_lo_hi_lo = {keep_val_40,keep_val_40,keep_val_40,keep_val_40,keep_val_40,keep_val_40,
    keep_val_40,keep_val_40,io_out_tdata_lo_lo_lo_hi_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_lo_lo_hi_hi_lo = {keep_val_48,keep_val_48,keep_val_48,keep_val_48,keep_val_48,keep_val_48,
    keep_val_48,keep_val_48}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_lo_lo_lo_hi = {keep_val_56,keep_val_56,keep_val_56,keep_val_56,keep_val_56,keep_val_56,
    keep_val_56,keep_val_56,io_out_tdata_lo_lo_lo_hi_hi_lo,io_out_tdata_lo_lo_lo_hi_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_lo_hi_lo_lo_lo = {keep_val_64,keep_val_64,keep_val_64,keep_val_64,keep_val_64,keep_val_64,
    keep_val_64,keep_val_64}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_lo_lo_hi_lo_lo = {keep_val_72,keep_val_72,keep_val_72,keep_val_72,keep_val_72,keep_val_72,
    keep_val_72,keep_val_72,io_out_tdata_lo_lo_hi_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_lo_hi_lo_hi_lo = {keep_val_80,keep_val_80,keep_val_80,keep_val_80,keep_val_80,keep_val_80,
    keep_val_80,keep_val_80}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_lo_lo_hi_lo = {keep_val_88,keep_val_88,keep_val_88,keep_val_88,keep_val_88,keep_val_88,
    keep_val_88,keep_val_88,io_out_tdata_lo_lo_hi_lo_hi_lo,io_out_tdata_lo_lo_hi_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_lo_hi_hi_lo_lo = {keep_val_96,keep_val_96,keep_val_96,keep_val_96,keep_val_96,keep_val_96,
    keep_val_96,keep_val_96}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_lo_lo_hi_hi_lo = {keep_val_104,keep_val_104,keep_val_104,keep_val_104,keep_val_104,
    keep_val_104,keep_val_104,keep_val_104,io_out_tdata_lo_lo_hi_hi_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_lo_hi_hi_hi_lo = {keep_val_112,keep_val_112,keep_val_112,keep_val_112,keep_val_112,
    keep_val_112,keep_val_112,keep_val_112}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_lo_lo_hi_hi = {keep_val_120,keep_val_120,keep_val_120,keep_val_120,keep_val_120,keep_val_120,
    keep_val_120,keep_val_120,io_out_tdata_lo_lo_hi_hi_hi_lo,io_out_tdata_lo_lo_hi_hi_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_hi_lo_lo_lo_lo = {keep_val_128,keep_val_128,keep_val_128,keep_val_128,keep_val_128,
    keep_val_128,keep_val_128,keep_val_128}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_lo_hi_lo_lo_lo = {keep_val_136,keep_val_136,keep_val_136,keep_val_136,keep_val_136,
    keep_val_136,keep_val_136,keep_val_136,io_out_tdata_lo_hi_lo_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_hi_lo_lo_hi_lo = {keep_val_144,keep_val_144,keep_val_144,keep_val_144,keep_val_144,
    keep_val_144,keep_val_144,keep_val_144}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_lo_hi_lo_lo = {keep_val_152,keep_val_152,keep_val_152,keep_val_152,keep_val_152,keep_val_152,
    keep_val_152,keep_val_152,io_out_tdata_lo_hi_lo_lo_hi_lo,io_out_tdata_lo_hi_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_hi_lo_hi_lo_lo = {keep_val_160,keep_val_160,keep_val_160,keep_val_160,keep_val_160,
    keep_val_160,keep_val_160,keep_val_160}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_lo_hi_lo_hi_lo = {keep_val_168,keep_val_168,keep_val_168,keep_val_168,keep_val_168,
    keep_val_168,keep_val_168,keep_val_168,io_out_tdata_lo_hi_lo_hi_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_hi_lo_hi_hi_lo = {keep_val_176,keep_val_176,keep_val_176,keep_val_176,keep_val_176,
    keep_val_176,keep_val_176,keep_val_176}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_lo_hi_lo_hi = {keep_val_184,keep_val_184,keep_val_184,keep_val_184,keep_val_184,keep_val_184,
    keep_val_184,keep_val_184,io_out_tdata_lo_hi_lo_hi_hi_lo,io_out_tdata_lo_hi_lo_hi_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_hi_hi_lo_lo_lo = {keep_val_192,keep_val_192,keep_val_192,keep_val_192,keep_val_192,
    keep_val_192,keep_val_192,keep_val_192}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_lo_hi_hi_lo_lo = {keep_val_200,keep_val_200,keep_val_200,keep_val_200,keep_val_200,
    keep_val_200,keep_val_200,keep_val_200,io_out_tdata_lo_hi_hi_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_hi_hi_lo_hi_lo = {keep_val_208,keep_val_208,keep_val_208,keep_val_208,keep_val_208,
    keep_val_208,keep_val_208,keep_val_208}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_lo_hi_hi_lo = {keep_val_216,keep_val_216,keep_val_216,keep_val_216,keep_val_216,keep_val_216,
    keep_val_216,keep_val_216,io_out_tdata_lo_hi_hi_lo_hi_lo,io_out_tdata_lo_hi_hi_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_hi_hi_hi_lo_lo = {keep_val_224,keep_val_224,keep_val_224,keep_val_224,keep_val_224,
    keep_val_224,keep_val_224,keep_val_224}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_lo_hi_hi_hi_lo = {keep_val_232,keep_val_232,keep_val_232,keep_val_232,keep_val_232,
    keep_val_232,keep_val_232,keep_val_232,io_out_tdata_lo_hi_hi_hi_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_lo_hi_hi_hi_hi_lo = {keep_val_240,keep_val_240,keep_val_240,keep_val_240,keep_val_240,
    keep_val_240,keep_val_240,keep_val_240}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_lo_hi_hi_hi = {keep_val_248,keep_val_248,keep_val_248,keep_val_248,keep_val_248,keep_val_248,
    keep_val_248,keep_val_248,io_out_tdata_lo_hi_hi_hi_hi_lo,io_out_tdata_lo_hi_hi_hi_lo}; // @[RxConverter.scala 53:52]
  wire [255:0] io_out_tdata_lo = {io_out_tdata_lo_hi_hi_hi,io_out_tdata_lo_hi_hi_lo,io_out_tdata_lo_hi_lo_hi,
    io_out_tdata_lo_hi_lo_lo,io_out_tdata_lo_lo_hi_hi,io_out_tdata_lo_lo_hi_lo,io_out_tdata_lo_lo_lo_hi,
    io_out_tdata_lo_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_lo_lo_lo_lo_lo = {keep_val_256,keep_val_256,keep_val_256,keep_val_256,keep_val_256,
    keep_val_256,keep_val_256,keep_val_256}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_hi_lo_lo_lo_lo = {keep_val_264,keep_val_264,keep_val_264,keep_val_264,keep_val_264,
    keep_val_264,keep_val_264,keep_val_264,io_out_tdata_hi_lo_lo_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_lo_lo_lo_hi_lo = {keep_val_272,keep_val_272,keep_val_272,keep_val_272,keep_val_272,
    keep_val_272,keep_val_272,keep_val_272}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_hi_lo_lo_lo = {keep_val_280,keep_val_280,keep_val_280,keep_val_280,keep_val_280,keep_val_280,
    keep_val_280,keep_val_280,io_out_tdata_hi_lo_lo_lo_hi_lo,io_out_tdata_hi_lo_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_lo_lo_hi_lo_lo = {keep_val_288,keep_val_288,keep_val_288,keep_val_288,keep_val_288,
    keep_val_288,keep_val_288,keep_val_288}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_hi_lo_lo_hi_lo = {keep_val_296,keep_val_296,keep_val_296,keep_val_296,keep_val_296,
    keep_val_296,keep_val_296,keep_val_296,io_out_tdata_hi_lo_lo_hi_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_lo_lo_hi_hi_lo = {keep_val_304,keep_val_304,keep_val_304,keep_val_304,keep_val_304,
    keep_val_304,keep_val_304,keep_val_304}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_hi_lo_lo_hi = {keep_val_312,keep_val_312,keep_val_312,keep_val_312,keep_val_312,keep_val_312,
    keep_val_312,keep_val_312,io_out_tdata_hi_lo_lo_hi_hi_lo,io_out_tdata_hi_lo_lo_hi_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_lo_hi_lo_lo_lo = {keep_val_320,keep_val_320,keep_val_320,keep_val_320,keep_val_320,
    keep_val_320,keep_val_320,keep_val_320}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_hi_lo_hi_lo_lo = {keep_val_328,keep_val_328,keep_val_328,keep_val_328,keep_val_328,
    keep_val_328,keep_val_328,keep_val_328,io_out_tdata_hi_lo_hi_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_lo_hi_lo_hi_lo = {keep_val_336,keep_val_336,keep_val_336,keep_val_336,keep_val_336,
    keep_val_336,keep_val_336,keep_val_336}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_hi_lo_hi_lo = {keep_val_344,keep_val_344,keep_val_344,keep_val_344,keep_val_344,keep_val_344,
    keep_val_344,keep_val_344,io_out_tdata_hi_lo_hi_lo_hi_lo,io_out_tdata_hi_lo_hi_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_lo_hi_hi_lo_lo = {keep_val_352,keep_val_352,keep_val_352,keep_val_352,keep_val_352,
    keep_val_352,keep_val_352,keep_val_352}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_hi_lo_hi_hi_lo = {keep_val_360,keep_val_360,keep_val_360,keep_val_360,keep_val_360,
    keep_val_360,keep_val_360,keep_val_360,io_out_tdata_hi_lo_hi_hi_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_lo_hi_hi_hi_lo = {keep_val_368,keep_val_368,keep_val_368,keep_val_368,keep_val_368,
    keep_val_368,keep_val_368,keep_val_368}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_hi_lo_hi_hi = {keep_val_376,keep_val_376,keep_val_376,keep_val_376,keep_val_376,keep_val_376,
    keep_val_376,keep_val_376,io_out_tdata_hi_lo_hi_hi_hi_lo,io_out_tdata_hi_lo_hi_hi_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_hi_lo_lo_lo_lo = {keep_val_384,keep_val_384,keep_val_384,keep_val_384,keep_val_384,
    keep_val_384,keep_val_384,keep_val_384}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_hi_hi_lo_lo_lo = {keep_val_392,keep_val_392,keep_val_392,keep_val_392,keep_val_392,
    keep_val_392,keep_val_392,keep_val_392,io_out_tdata_hi_hi_lo_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_hi_lo_lo_hi_lo = {keep_val_400,keep_val_400,keep_val_400,keep_val_400,keep_val_400,
    keep_val_400,keep_val_400,keep_val_400}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_hi_hi_lo_lo = {keep_val_408,keep_val_408,keep_val_408,keep_val_408,keep_val_408,keep_val_408,
    keep_val_408,keep_val_408,io_out_tdata_hi_hi_lo_lo_hi_lo,io_out_tdata_hi_hi_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_hi_lo_hi_lo_lo = {keep_val_416,keep_val_416,keep_val_416,keep_val_416,keep_val_416,
    keep_val_416,keep_val_416,keep_val_416}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_hi_hi_lo_hi_lo = {keep_val_424,keep_val_424,keep_val_424,keep_val_424,keep_val_424,
    keep_val_424,keep_val_424,keep_val_424,io_out_tdata_hi_hi_lo_hi_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_hi_lo_hi_hi_lo = {keep_val_432,keep_val_432,keep_val_432,keep_val_432,keep_val_432,
    keep_val_432,keep_val_432,keep_val_432}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_hi_hi_lo_hi = {keep_val_440,keep_val_440,keep_val_440,keep_val_440,keep_val_440,keep_val_440,
    keep_val_440,keep_val_440,io_out_tdata_hi_hi_lo_hi_hi_lo,io_out_tdata_hi_hi_lo_hi_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_hi_hi_lo_lo_lo = {keep_val_448,keep_val_448,keep_val_448,keep_val_448,keep_val_448,
    keep_val_448,keep_val_448,keep_val_448}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_hi_hi_hi_lo_lo = {keep_val_456,keep_val_456,keep_val_456,keep_val_456,keep_val_456,
    keep_val_456,keep_val_456,keep_val_456,io_out_tdata_hi_hi_hi_lo_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_hi_hi_lo_hi_lo = {keep_val_464,keep_val_464,keep_val_464,keep_val_464,keep_val_464,
    keep_val_464,keep_val_464,keep_val_464}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_hi_hi_hi_lo = {keep_val_472,keep_val_472,keep_val_472,keep_val_472,keep_val_472,keep_val_472,
    keep_val_472,keep_val_472,io_out_tdata_hi_hi_hi_lo_hi_lo,io_out_tdata_hi_hi_hi_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_hi_hi_hi_lo_lo = {keep_val_480,keep_val_480,keep_val_480,keep_val_480,keep_val_480,
    keep_val_480,keep_val_480,keep_val_480}; // @[RxConverter.scala 53:52]
  wire [15:0] io_out_tdata_hi_hi_hi_hi_lo = {keep_val_488,keep_val_488,keep_val_488,keep_val_488,keep_val_488,
    keep_val_488,keep_val_488,keep_val_488,io_out_tdata_hi_hi_hi_hi_lo_lo}; // @[RxConverter.scala 53:52]
  wire [7:0] io_out_tdata_hi_hi_hi_hi_hi_lo = {keep_val_496,keep_val_496,keep_val_496,keep_val_496,keep_val_496,
    keep_val_496,keep_val_496,keep_val_496}; // @[RxConverter.scala 53:52]
  wire [31:0] io_out_tdata_hi_hi_hi_hi = {keep_val_504,keep_val_504,keep_val_504,keep_val_504,keep_val_504,keep_val_504,
    keep_val_504,keep_val_504,io_out_tdata_hi_hi_hi_hi_hi_lo,io_out_tdata_hi_hi_hi_hi_lo}; // @[RxConverter.scala 53:52]
  wire [511:0] _io_out_tdata_T = {io_out_tdata_hi_hi_hi_hi,io_out_tdata_hi_hi_hi_lo,io_out_tdata_hi_hi_lo_hi,
    io_out_tdata_hi_hi_lo_lo,io_out_tdata_hi_lo_hi_hi,io_out_tdata_hi_lo_hi_lo,io_out_tdata_hi_lo_lo_hi,
    io_out_tdata_hi_lo_lo_lo,io_out_tdata_lo}; // @[RxConverter.scala 53:52]
  ReduceAddSync burst_size_cal ( // @[RxConverter.scala 29:30]
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
  assign io_in_tready = io_out_tready | ~in_reg_used_reg; // @[RxConverter.scala 56:34]
  assign io_out_tdata = in_reg_tdata & _io_out_tdata_T; // @[RxConverter.scala 53:33]
  assign io_out_tvalid = in_reg_tvalid & in_reg_used_reg; // @[RxConverter.scala 54:34]
  assign io_out_tlast = in_reg_r[0]; // @[RxConverter.scala 17:119]
  assign io_out_tuser = in_reg_r[578]; // @[RxConverter.scala 17:119]
  assign io_out_rx_info_tlen = first_beat_reg ? {{8'd0}, burst_size_cal_io_out_sum} : _tlen_reg_T_1; // @[RxConverter.scala 58:29]
  assign io_out_extern_config_c2h_match_op = extern_config_reg_c2h_match_op; // @[RxConverter.scala 60:24]
  assign io_out_extern_config_c2h_match_arg_0 = extern_config_reg_c2h_match_arg_0; // @[RxConverter.scala 60:24]
  assign io_out_extern_config_c2h_match_arg_1 = extern_config_reg_c2h_match_arg_1; // @[RxConverter.scala 60:24]
  assign io_out_extern_config_c2h_match_arg_2 = extern_config_reg_c2h_match_arg_2; // @[RxConverter.scala 60:24]
  assign io_out_extern_config_c2h_match_arg_3 = extern_config_reg_c2h_match_arg_3; // @[RxConverter.scala 60:24]
  assign io_out_extern_config_c2h_match_arg_4 = extern_config_reg_c2h_match_arg_4; // @[RxConverter.scala 60:24]
  assign io_out_extern_config_c2h_match_arg_5 = extern_config_reg_c2h_match_arg_5; // @[RxConverter.scala 60:24]
  assign io_out_extern_config_c2h_match_arg_6 = extern_config_reg_c2h_match_arg_6; // @[RxConverter.scala 60:24]
  assign io_out_extern_config_c2h_match_arg_7 = extern_config_reg_c2h_match_arg_7; // @[RxConverter.scala 60:24]
  assign burst_size_cal_clock = clock;
  assign burst_size_cal_io_in_vec_0 = {{7'd0}, cal_tkeep[0]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_1 = {{7'd0}, cal_tkeep[1]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_2 = {{7'd0}, cal_tkeep[2]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_3 = {{7'd0}, cal_tkeep[3]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_4 = {{7'd0}, cal_tkeep[4]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_5 = {{7'd0}, cal_tkeep[5]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_6 = {{7'd0}, cal_tkeep[6]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_7 = {{7'd0}, cal_tkeep[7]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_8 = {{7'd0}, cal_tkeep[8]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_9 = {{7'd0}, cal_tkeep[9]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_10 = {{7'd0}, cal_tkeep[10]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_11 = {{7'd0}, cal_tkeep[11]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_12 = {{7'd0}, cal_tkeep[12]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_13 = {{7'd0}, cal_tkeep[13]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_14 = {{7'd0}, cal_tkeep[14]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_15 = {{7'd0}, cal_tkeep[15]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_16 = {{7'd0}, cal_tkeep[16]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_17 = {{7'd0}, cal_tkeep[17]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_18 = {{7'd0}, cal_tkeep[18]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_19 = {{7'd0}, cal_tkeep[19]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_20 = {{7'd0}, cal_tkeep[20]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_21 = {{7'd0}, cal_tkeep[21]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_22 = {{7'd0}, cal_tkeep[22]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_23 = {{7'd0}, cal_tkeep[23]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_24 = {{7'd0}, cal_tkeep[24]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_25 = {{7'd0}, cal_tkeep[25]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_26 = {{7'd0}, cal_tkeep[26]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_27 = {{7'd0}, cal_tkeep[27]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_28 = {{7'd0}, cal_tkeep[28]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_29 = {{7'd0}, cal_tkeep[29]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_30 = {{7'd0}, cal_tkeep[30]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_31 = {{7'd0}, cal_tkeep[31]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_32 = {{7'd0}, cal_tkeep[32]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_33 = {{7'd0}, cal_tkeep[33]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_34 = {{7'd0}, cal_tkeep[34]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_35 = {{7'd0}, cal_tkeep[35]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_36 = {{7'd0}, cal_tkeep[36]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_37 = {{7'd0}, cal_tkeep[37]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_38 = {{7'd0}, cal_tkeep[38]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_39 = {{7'd0}, cal_tkeep[39]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_40 = {{7'd0}, cal_tkeep[40]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_41 = {{7'd0}, cal_tkeep[41]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_42 = {{7'd0}, cal_tkeep[42]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_43 = {{7'd0}, cal_tkeep[43]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_44 = {{7'd0}, cal_tkeep[44]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_45 = {{7'd0}, cal_tkeep[45]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_46 = {{7'd0}, cal_tkeep[46]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_47 = {{7'd0}, cal_tkeep[47]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_48 = {{7'd0}, cal_tkeep[48]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_49 = {{7'd0}, cal_tkeep[49]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_50 = {{7'd0}, cal_tkeep[50]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_51 = {{7'd0}, cal_tkeep[51]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_52 = {{7'd0}, cal_tkeep[52]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_53 = {{7'd0}, cal_tkeep[53]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_54 = {{7'd0}, cal_tkeep[54]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_55 = {{7'd0}, cal_tkeep[55]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_56 = {{7'd0}, cal_tkeep[56]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_57 = {{7'd0}, cal_tkeep[57]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_58 = {{7'd0}, cal_tkeep[58]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_59 = {{7'd0}, cal_tkeep[59]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_60 = {{7'd0}, cal_tkeep[60]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_61 = {{7'd0}, cal_tkeep[61]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_62 = {{7'd0}, cal_tkeep[62]}; // @[RxConverter.scala 30:53]
  assign burst_size_cal_io_in_vec_63 = {{7'd0}, cal_tkeep[63]}; // @[RxConverter.scala 30:53]
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
    if (reset) begin // @[RxConverter.scala 25:34]
      extern_config_reg_c2h_match_op <= 8'h0; // @[RxConverter.scala 25:34]
    end else begin
      extern_config_reg_c2h_match_op <= io_extern_config_c2h_match_op; // @[RxConverter.scala 26:21]
    end
    if (reset) begin // @[RxConverter.scala 25:34]
      extern_config_reg_c2h_match_arg_0 <= 32'h0; // @[RxConverter.scala 25:34]
    end else begin
      extern_config_reg_c2h_match_arg_0 <= io_extern_config_c2h_match_arg_0; // @[RxConverter.scala 26:21]
    end
    if (reset) begin // @[RxConverter.scala 25:34]
      extern_config_reg_c2h_match_arg_1 <= 32'h0; // @[RxConverter.scala 25:34]
    end else begin
      extern_config_reg_c2h_match_arg_1 <= io_extern_config_c2h_match_arg_1; // @[RxConverter.scala 26:21]
    end
    if (reset) begin // @[RxConverter.scala 25:34]
      extern_config_reg_c2h_match_arg_2 <= 32'h0; // @[RxConverter.scala 25:34]
    end else begin
      extern_config_reg_c2h_match_arg_2 <= io_extern_config_c2h_match_arg_2; // @[RxConverter.scala 26:21]
    end
    if (reset) begin // @[RxConverter.scala 25:34]
      extern_config_reg_c2h_match_arg_3 <= 32'h0; // @[RxConverter.scala 25:34]
    end else begin
      extern_config_reg_c2h_match_arg_3 <= io_extern_config_c2h_match_arg_3; // @[RxConverter.scala 26:21]
    end
    if (reset) begin // @[RxConverter.scala 25:34]
      extern_config_reg_c2h_match_arg_4 <= 32'h0; // @[RxConverter.scala 25:34]
    end else begin
      extern_config_reg_c2h_match_arg_4 <= io_extern_config_c2h_match_arg_4; // @[RxConverter.scala 26:21]
    end
    if (reset) begin // @[RxConverter.scala 25:34]
      extern_config_reg_c2h_match_arg_5 <= 32'h0; // @[RxConverter.scala 25:34]
    end else begin
      extern_config_reg_c2h_match_arg_5 <= io_extern_config_c2h_match_arg_5; // @[RxConverter.scala 26:21]
    end
    if (reset) begin // @[RxConverter.scala 25:34]
      extern_config_reg_c2h_match_arg_6 <= 32'h0; // @[RxConverter.scala 25:34]
    end else begin
      extern_config_reg_c2h_match_arg_6 <= io_extern_config_c2h_match_arg_6; // @[RxConverter.scala 26:21]
    end
    if (reset) begin // @[RxConverter.scala 25:34]
      extern_config_reg_c2h_match_arg_7 <= 32'h0; // @[RxConverter.scala 25:34]
    end else begin
      extern_config_reg_c2h_match_arg_7 <= io_extern_config_c2h_match_arg_7; // @[RxConverter.scala 26:21]
    end
    if (reset) begin // @[RxConverter.scala 34:25]
      tlen_reg <= 16'h0; // @[RxConverter.scala 34:25]
    end else if (in_shake_hand) begin // @[RxConverter.scala 35:24]
      if (first_beat_reg) begin // @[RxConverter.scala 36:27]
        tlen_reg <= {{8'd0}, burst_size_cal_io_out_sum}; // @[RxConverter.scala 37:16]
      end else begin
        tlen_reg <= _tlen_reg_T_1; // @[RxConverter.scala 39:16]
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
  _RAND_3 = {1{`RANDOM}};
  extern_config_reg_c2h_match_op = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  extern_config_reg_c2h_match_arg_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  extern_config_reg_c2h_match_arg_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  extern_config_reg_c2h_match_arg_2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  extern_config_reg_c2h_match_arg_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  extern_config_reg_c2h_match_arg_4 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  extern_config_reg_c2h_match_arg_5 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  extern_config_reg_c2h_match_arg_6 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  extern_config_reg_c2h_match_arg_7 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  tlen_reg = _RAND_12[15:0];
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
  input  [15:0] io_in_rule_0,
  input  [15:0] io_in_rule_1,
  input  [15:0] io_in_rule_2,
  input  [15:0] io_in_rule_3,
  input  [15:0] io_in_rule_4,
  input  [15:0] io_in_rule_5,
  input  [15:0] io_in_rule_6,
  input  [15:0] io_in_rule_7,
  input  [15:0] io_in_rule_8,
  input  [15:0] io_in_rule_9,
  input  [15:0] io_in_rule_10,
  input  [15:0] io_in_rule_11,
  input  [15:0] io_in_rule_12,
  input  [15:0] io_in_rule_13,
  input  [15:0] io_in_rule_14,
  input  [15:0] io_in_rule_15,
  output [3:0]  io_out_state
);
  wire [3:0] result_0 = io_in_char == io_in_rule_0[7:0] & io_in_state == io_in_rule_0[11:8] ? io_in_rule_0[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_1 = io_in_char == io_in_rule_1[7:0] & io_in_state == io_in_rule_1[11:8] ? io_in_rule_1[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_2 = io_in_char == io_in_rule_2[7:0] & io_in_state == io_in_rule_2[11:8] ? io_in_rule_2[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_3 = io_in_char == io_in_rule_3[7:0] & io_in_state == io_in_rule_3[11:8] ? io_in_rule_3[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_4 = io_in_char == io_in_rule_4[7:0] & io_in_state == io_in_rule_4[11:8] ? io_in_rule_4[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_5 = io_in_char == io_in_rule_5[7:0] & io_in_state == io_in_rule_5[11:8] ? io_in_rule_5[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_6 = io_in_char == io_in_rule_6[7:0] & io_in_state == io_in_rule_6[11:8] ? io_in_rule_6[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_7 = io_in_char == io_in_rule_7[7:0] & io_in_state == io_in_rule_7[11:8] ? io_in_rule_7[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_8 = io_in_char == io_in_rule_8[7:0] & io_in_state == io_in_rule_8[11:8] ? io_in_rule_8[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_9 = io_in_char == io_in_rule_9[7:0] & io_in_state == io_in_rule_9[11:8] ? io_in_rule_9[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_10 = io_in_char == io_in_rule_10[7:0] & io_in_state == io_in_rule_10[11:8] ? io_in_rule_10[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_11 = io_in_char == io_in_rule_11[7:0] & io_in_state == io_in_rule_11[11:8] ? io_in_rule_11[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_12 = io_in_char == io_in_rule_12[7:0] & io_in_state == io_in_rule_12[11:8] ? io_in_rule_12[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_13 = io_in_char == io_in_rule_13[7:0] & io_in_state == io_in_rule_13[11:8] ? io_in_rule_13[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_14 = io_in_char == io_in_rule_14[7:0] & io_in_state == io_in_rule_14[11:8] ? io_in_rule_14[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] result_15 = io_in_char == io_in_rule_15[7:0] & io_in_state == io_in_rule_15[11:8] ? io_in_rule_15[15:12] : 4'h0
    ; // @[RxRESearcher.scala 20:84 21:17]
  wire [3:0] _io_out_state_T = result_0 | result_1; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_1 = result_2 | result_3; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_2 = result_4 | result_5; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_3 = result_6 | result_7; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_4 = result_8 | result_9; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_5 = result_10 | result_11; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_6 = result_12 | result_13; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_7 = result_14 | result_15; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_8 = _io_out_state_T | _io_out_state_T_1; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_9 = _io_out_state_T_2 | _io_out_state_T_3; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_10 = _io_out_state_T_4 | _io_out_state_T_5; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_11 = _io_out_state_T_6 | _io_out_state_T_7; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_12 = _io_out_state_T_8 | _io_out_state_T_9; // @[RxRESearcher.scala 25:38]
  wire [3:0] _io_out_state_T_13 = _io_out_state_T_10 | _io_out_state_T_11; // @[RxRESearcher.scala 25:38]
  assign io_out_state = _io_out_state_T_12 | _io_out_state_T_13; // @[RxRESearcher.scala 25:38]
endmodule
module REHandler(
  input         clock,
  input         reset,
  input  [15:0] io_in_char,
  input  [3:0]  io_in_state,
  input  [15:0] io_in_rule_0,
  input  [15:0] io_in_rule_1,
  input  [15:0] io_in_rule_2,
  input  [15:0] io_in_rule_3,
  input  [15:0] io_in_rule_4,
  input  [15:0] io_in_rule_5,
  input  [15:0] io_in_rule_6,
  input  [15:0] io_in_rule_7,
  input  [15:0] io_in_rule_8,
  input  [15:0] io_in_rule_9,
  input  [15:0] io_in_rule_10,
  input  [15:0] io_in_rule_11,
  input  [15:0] io_in_rule_12,
  input  [15:0] io_in_rule_13,
  input  [15:0] io_in_rule_14,
  input  [15:0] io_in_rule_15,
  output [3:0]  io_out_state
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] re_handler_unit_queue_0_io_in_char; // @[RxRESearcher.scala 38:52]
  wire [3:0] re_handler_unit_queue_0_io_in_state; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_0; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_1; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_2; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_3; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_4; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_5; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_6; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_7; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_8; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_9; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_10; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_11; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_12; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_13; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_14; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_0_io_in_rule_15; // @[RxRESearcher.scala 38:52]
  wire [3:0] re_handler_unit_queue_0_io_out_state; // @[RxRESearcher.scala 38:52]
  wire [7:0] re_handler_unit_queue_1_io_in_char; // @[RxRESearcher.scala 38:52]
  wire [3:0] re_handler_unit_queue_1_io_in_state; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_0; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_1; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_2; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_3; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_4; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_5; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_6; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_7; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_8; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_9; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_10; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_11; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_12; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_13; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_14; // @[RxRESearcher.scala 38:52]
  wire [15:0] re_handler_unit_queue_1_io_in_rule_15; // @[RxRESearcher.scala 38:52]
  wire [3:0] re_handler_unit_queue_1_io_out_state; // @[RxRESearcher.scala 38:52]
  reg [3:0] part_result_reg; // @[RxRESearcher.scala 39:32]
  REHandlerUnit re_handler_unit_queue_0 ( // @[RxRESearcher.scala 38:52]
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
  REHandlerUnit re_handler_unit_queue_1 ( // @[RxRESearcher.scala 38:52]
    .io_in_char(re_handler_unit_queue_1_io_in_char),
    .io_in_state(re_handler_unit_queue_1_io_in_state),
    .io_in_rule_0(re_handler_unit_queue_1_io_in_rule_0),
    .io_in_rule_1(re_handler_unit_queue_1_io_in_rule_1),
    .io_in_rule_2(re_handler_unit_queue_1_io_in_rule_2),
    .io_in_rule_3(re_handler_unit_queue_1_io_in_rule_3),
    .io_in_rule_4(re_handler_unit_queue_1_io_in_rule_4),
    .io_in_rule_5(re_handler_unit_queue_1_io_in_rule_5),
    .io_in_rule_6(re_handler_unit_queue_1_io_in_rule_6),
    .io_in_rule_7(re_handler_unit_queue_1_io_in_rule_7),
    .io_in_rule_8(re_handler_unit_queue_1_io_in_rule_8),
    .io_in_rule_9(re_handler_unit_queue_1_io_in_rule_9),
    .io_in_rule_10(re_handler_unit_queue_1_io_in_rule_10),
    .io_in_rule_11(re_handler_unit_queue_1_io_in_rule_11),
    .io_in_rule_12(re_handler_unit_queue_1_io_in_rule_12),
    .io_in_rule_13(re_handler_unit_queue_1_io_in_rule_13),
    .io_in_rule_14(re_handler_unit_queue_1_io_in_rule_14),
    .io_in_rule_15(re_handler_unit_queue_1_io_in_rule_15),
    .io_out_state(re_handler_unit_queue_1_io_out_state)
  );
  assign io_out_state = part_result_reg; // @[RxRESearcher.scala 49:16]
  assign re_handler_unit_queue_0_io_in_char = io_in_char[7:0]; // @[RxRESearcher.scala 42:54]
  assign re_handler_unit_queue_0_io_in_state = io_in_state; // @[RxRESearcher.scala 44:54]
  assign re_handler_unit_queue_0_io_in_rule_0 = io_in_rule_0; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_1 = io_in_rule_1; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_2 = io_in_rule_2; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_3 = io_in_rule_3; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_4 = io_in_rule_4; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_5 = io_in_rule_5; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_6 = io_in_rule_6; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_7 = io_in_rule_7; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_8 = io_in_rule_8; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_9 = io_in_rule_9; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_10 = io_in_rule_10; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_11 = io_in_rule_11; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_12 = io_in_rule_12; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_13 = io_in_rule_13; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_14 = io_in_rule_14; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_0_io_in_rule_15 = io_in_rule_15; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_char = io_in_char[15:8]; // @[RxRESearcher.scala 42:54]
  assign re_handler_unit_queue_1_io_in_state = re_handler_unit_queue_0_io_out_state; // @[RxRESearcher.scala 45:47]
  assign re_handler_unit_queue_1_io_in_rule_0 = io_in_rule_0; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_1 = io_in_rule_1; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_2 = io_in_rule_2; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_3 = io_in_rule_3; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_4 = io_in_rule_4; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_5 = io_in_rule_5; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_6 = io_in_rule_6; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_7 = io_in_rule_7; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_8 = io_in_rule_8; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_9 = io_in_rule_9; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_10 = io_in_rule_10; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_11 = io_in_rule_11; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_12 = io_in_rule_12; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_13 = io_in_rule_13; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_14 = io_in_rule_14; // @[RxRESearcher.scala 43:41]
  assign re_handler_unit_queue_1_io_in_rule_15 = io_in_rule_15; // @[RxRESearcher.scala 43:41]
  always @(posedge clock) begin
    if (reset) begin // @[RxRESearcher.scala 39:32]
      part_result_reg <= 4'h0; // @[RxRESearcher.scala 39:32]
    end else begin
      part_result_reg <= re_handler_unit_queue_1_io_out_state; // @[RxRESearcher.scala 48:19]
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
  input  [7:0]   io_in_extern_config_c2h_match_op,
  input  [31:0]  io_in_extern_config_c2h_match_arg_0,
  input  [31:0]  io_in_extern_config_c2h_match_arg_1,
  input  [31:0]  io_in_extern_config_c2h_match_arg_2,
  input  [31:0]  io_in_extern_config_c2h_match_arg_3,
  input  [31:0]  io_in_extern_config_c2h_match_arg_4,
  input  [31:0]  io_in_extern_config_c2h_match_arg_5,
  input  [31:0]  io_in_extern_config_c2h_match_arg_6,
  input  [31:0]  io_in_extern_config_c2h_match_arg_7,
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
  reg [287:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  re_handler_queue_0_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_0_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_0_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_0_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_0_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_1_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_1_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_1_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_1_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_1_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_2_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_2_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_2_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_2_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_2_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_3_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_3_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_3_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_3_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_3_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_4_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_4_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_4_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_4_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_4_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_5_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_5_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_5_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_5_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_5_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_6_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_6_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_6_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_6_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_6_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_7_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_7_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_7_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_7_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_7_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_8_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_8_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_8_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_8_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_8_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_9_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_9_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_9_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_9_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_9_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_10_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_10_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_10_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_10_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_10_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_11_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_11_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_11_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_11_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_11_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_12_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_12_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_12_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_12_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_12_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_13_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_13_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_13_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_13_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_13_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_14_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_14_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_14_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_14_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_14_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_15_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_15_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_15_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_15_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_15_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_16_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_16_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_16_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_16_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_16_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_17_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_17_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_17_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_17_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_17_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_18_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_18_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_18_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_18_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_18_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_19_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_19_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_19_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_19_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_19_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_20_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_20_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_20_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_20_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_20_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_21_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_21_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_21_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_21_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_21_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_22_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_22_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_22_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_22_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_22_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_23_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_23_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_23_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_23_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_23_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_24_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_24_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_24_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_24_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_24_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_25_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_25_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_25_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_25_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_25_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_26_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_26_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_26_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_26_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_26_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_27_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_27_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_27_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_27_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_27_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_28_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_28_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_28_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_28_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_28_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_29_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_29_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_29_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_29_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_29_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_30_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_30_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_30_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_30_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_30_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_31_clock; // @[RxRESearcher.scala 63:54]
  wire  re_handler_queue_31_reset; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_char; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_31_io_in_state; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_0; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_1; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_2; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_3; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_4; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_5; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_6; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_7; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_8; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_9; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_10; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_11; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_12; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_13; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_14; // @[RxRESearcher.scala 63:54]
  wire [15:0] re_handler_queue_31_io_in_rule_15; // @[RxRESearcher.scala 63:54]
  wire [3:0] re_handler_queue_31_io_out_state; // @[RxRESearcher.scala 63:54]
  wire  in_shake_hand = io_in_tready & io_in_tvalid; // @[RxPipelineHandler.scala 12:38]
  wire  out_shake_hand = io_out_tready & io_out_tvalid; // @[RxPipelineHandler.scala 13:38]
  wire [604:0] _in_reg_T_1 = {4'h0,io_in_rx_info_tlen,6'h0,64'h0,io_in_tuser,io_in_tdata,io_in_tvalid,io_in_tlast}; // @[Cat.scala 31:58]
  reg [604:0] in_reg_r; // @[Reg.scala 28:20]
  wire  in_reg_tlast = in_reg_r[0]; // @[RxPipelineHandler.scala 14:128]
  wire  in_reg_tvalid = in_reg_r[1]; // @[RxPipelineHandler.scala 14:128]
  wire [511:0] in_reg_tdata = in_reg_r[513:2]; // @[RxPipelineHandler.scala 14:128]
  wire [5:0] in_reg_rx_info_qid = in_reg_r[584:579]; // @[RxPipelineHandler.scala 14:128]
  wire [263:0] _extern_config_reg_T = {io_in_extern_config_c2h_match_op,io_in_extern_config_c2h_match_arg_7,
    io_in_extern_config_c2h_match_arg_6,io_in_extern_config_c2h_match_arg_5,io_in_extern_config_c2h_match_arg_4,
    io_in_extern_config_c2h_match_arg_3,io_in_extern_config_c2h_match_arg_2,io_in_extern_config_c2h_match_arg_1,
    io_in_extern_config_c2h_match_arg_0}; // @[RxPipelineHandler.scala 15:57]
  reg [263:0] extern_config_reg_r; // @[Reg.scala 28:20]
  wire [31:0] extern_config_reg_c2h_match_arg_0 = extern_config_reg_r[31:0]; // @[RxPipelineHandler.scala 15:91]
  wire [31:0] extern_config_reg_c2h_match_arg_1 = extern_config_reg_r[63:32]; // @[RxPipelineHandler.scala 15:91]
  wire [31:0] extern_config_reg_c2h_match_arg_2 = extern_config_reg_r[95:64]; // @[RxPipelineHandler.scala 15:91]
  wire [31:0] extern_config_reg_c2h_match_arg_3 = extern_config_reg_r[127:96]; // @[RxPipelineHandler.scala 15:91]
  wire [31:0] extern_config_reg_c2h_match_arg_4 = extern_config_reg_r[159:128]; // @[RxPipelineHandler.scala 15:91]
  wire [31:0] extern_config_reg_c2h_match_arg_5 = extern_config_reg_r[191:160]; // @[RxPipelineHandler.scala 15:91]
  wire [31:0] extern_config_reg_c2h_match_arg_6 = extern_config_reg_r[223:192]; // @[RxPipelineHandler.scala 15:91]
  wire [31:0] extern_config_reg_c2h_match_arg_7 = extern_config_reg_r[255:224]; // @[RxPipelineHandler.scala 15:91]
  wire [7:0] extern_config_reg_c2h_match_op = extern_config_reg_r[263:256]; // @[RxPipelineHandler.scala 15:91]
  reg  in_reg_used_reg; // @[RxPipelineHandler.scala 18:32]
  wire  _GEN_3 = out_shake_hand ? 1'h0 : in_reg_used_reg; // @[RxPipelineHandler.scala 21:29 22:21 18:32]
  wire  _GEN_4 = in_shake_hand | _GEN_3; // @[RxPipelineHandler.scala 19:23 20:21]
  wire  _io_out_tvalid_T = in_reg_tvalid & in_reg_used_reg; // @[RxPipelineHandler.scala 27:47]
  wire  _io_in_tready_T = ~in_reg_used_reg; // @[RxPipelineHandler.scala 30:49]
  reg [7:0] beat_counter_reg; // @[RxRESearcher.scala 58:33]
  reg  done_reg; // @[RxRESearcher.scala 59:25]
  reg [3:0] cur_state_reg; // @[RxRESearcher.scala 60:30]
  wire [255:0] _input_rule_T = {extern_config_reg_c2h_match_arg_7,extern_config_reg_c2h_match_arg_6,
    extern_config_reg_c2h_match_arg_5,extern_config_reg_c2h_match_arg_4,extern_config_reg_c2h_match_arg_3,
    extern_config_reg_c2h_match_arg_2,extern_config_reg_c2h_match_arg_1,extern_config_reg_c2h_match_arg_0}; // @[RxRESearcher.scala 62:60]
  reg  match_found_reg; // @[RxRESearcher.scala 66:32]
  wire [3:0] state_vec_0 = re_handler_queue_0_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] state_vec_1 = re_handler_queue_1_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_6 = 5'h1 == beat_counter_reg[4:0] ? state_vec_1 : state_vec_0; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_2 = re_handler_queue_2_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_7 = 5'h2 == beat_counter_reg[4:0] ? state_vec_2 : _GEN_6; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_3 = re_handler_queue_3_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_8 = 5'h3 == beat_counter_reg[4:0] ? state_vec_3 : _GEN_7; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_4 = re_handler_queue_4_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_9 = 5'h4 == beat_counter_reg[4:0] ? state_vec_4 : _GEN_8; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_5 = re_handler_queue_5_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_10 = 5'h5 == beat_counter_reg[4:0] ? state_vec_5 : _GEN_9; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_6 = re_handler_queue_6_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_11 = 5'h6 == beat_counter_reg[4:0] ? state_vec_6 : _GEN_10; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_7 = re_handler_queue_7_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_12 = 5'h7 == beat_counter_reg[4:0] ? state_vec_7 : _GEN_11; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_8 = re_handler_queue_8_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_13 = 5'h8 == beat_counter_reg[4:0] ? state_vec_8 : _GEN_12; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_9 = re_handler_queue_9_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_14 = 5'h9 == beat_counter_reg[4:0] ? state_vec_9 : _GEN_13; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_10 = re_handler_queue_10_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_15 = 5'ha == beat_counter_reg[4:0] ? state_vec_10 : _GEN_14; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_11 = re_handler_queue_11_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_16 = 5'hb == beat_counter_reg[4:0] ? state_vec_11 : _GEN_15; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_12 = re_handler_queue_12_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_17 = 5'hc == beat_counter_reg[4:0] ? state_vec_12 : _GEN_16; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_13 = re_handler_queue_13_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_18 = 5'hd == beat_counter_reg[4:0] ? state_vec_13 : _GEN_17; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_14 = re_handler_queue_14_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_19 = 5'he == beat_counter_reg[4:0] ? state_vec_14 : _GEN_18; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_15 = re_handler_queue_15_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_20 = 5'hf == beat_counter_reg[4:0] ? state_vec_15 : _GEN_19; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_16 = re_handler_queue_16_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_21 = 5'h10 == beat_counter_reg[4:0] ? state_vec_16 : _GEN_20; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_17 = re_handler_queue_17_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_22 = 5'h11 == beat_counter_reg[4:0] ? state_vec_17 : _GEN_21; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_18 = re_handler_queue_18_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_23 = 5'h12 == beat_counter_reg[4:0] ? state_vec_18 : _GEN_22; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_19 = re_handler_queue_19_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_24 = 5'h13 == beat_counter_reg[4:0] ? state_vec_19 : _GEN_23; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_20 = re_handler_queue_20_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_25 = 5'h14 == beat_counter_reg[4:0] ? state_vec_20 : _GEN_24; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_21 = re_handler_queue_21_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_26 = 5'h15 == beat_counter_reg[4:0] ? state_vec_21 : _GEN_25; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_22 = re_handler_queue_22_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_27 = 5'h16 == beat_counter_reg[4:0] ? state_vec_22 : _GEN_26; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_23 = re_handler_queue_23_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_28 = 5'h17 == beat_counter_reg[4:0] ? state_vec_23 : _GEN_27; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_24 = re_handler_queue_24_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_29 = 5'h18 == beat_counter_reg[4:0] ? state_vec_24 : _GEN_28; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_25 = re_handler_queue_25_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_30 = 5'h19 == beat_counter_reg[4:0] ? state_vec_25 : _GEN_29; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_26 = re_handler_queue_26_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_31 = 5'h1a == beat_counter_reg[4:0] ? state_vec_26 : _GEN_30; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_27 = re_handler_queue_27_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_32 = 5'h1b == beat_counter_reg[4:0] ? state_vec_27 : _GEN_31; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_28 = re_handler_queue_28_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_33 = 5'h1c == beat_counter_reg[4:0] ? state_vec_28 : _GEN_32; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_29 = re_handler_queue_29_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_34 = 5'h1d == beat_counter_reg[4:0] ? state_vec_29 : _GEN_33; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_30 = re_handler_queue_30_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_35 = 5'h1e == beat_counter_reg[4:0] ? state_vec_30 : _GEN_34; // @[RxRESearcher.scala 79:{21,21}]
  wire [3:0] state_vec_31 = re_handler_queue_31_io_out_state; // @[RxRESearcher.scala 64:23 68:18]
  wire [3:0] _GEN_36 = 5'h1f == beat_counter_reg[4:0] ? state_vec_31 : _GEN_35; // @[RxRESearcher.scala 79:{21,21}]
  wire [7:0] _beat_counter_reg_T_1 = beat_counter_reg + 8'h1; // @[RxRESearcher.scala 90:46]
  wire  _GEN_40 = beat_counter_reg == 8'h1f | done_reg; // @[RxRESearcher.scala 87:52 88:18 59:25]
  wire [5:0] _io_out_rx_info_qid_T = match_found_reg ? 6'h1 : in_reg_rx_info_qid; // @[RxRESearcher.scala 103:30]
  REHandler re_handler_queue_0 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_0_clock),
    .reset(re_handler_queue_0_reset),
    .io_in_char(re_handler_queue_0_io_in_char),
    .io_in_state(re_handler_queue_0_io_in_state),
    .io_in_rule_0(re_handler_queue_0_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_0_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_0_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_0_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_0_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_0_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_0_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_0_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_0_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_0_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_0_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_0_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_0_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_0_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_0_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_0_io_in_rule_15),
    .io_out_state(re_handler_queue_0_io_out_state)
  );
  REHandler re_handler_queue_1 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_1_clock),
    .reset(re_handler_queue_1_reset),
    .io_in_char(re_handler_queue_1_io_in_char),
    .io_in_state(re_handler_queue_1_io_in_state),
    .io_in_rule_0(re_handler_queue_1_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_1_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_1_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_1_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_1_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_1_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_1_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_1_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_1_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_1_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_1_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_1_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_1_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_1_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_1_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_1_io_in_rule_15),
    .io_out_state(re_handler_queue_1_io_out_state)
  );
  REHandler re_handler_queue_2 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_2_clock),
    .reset(re_handler_queue_2_reset),
    .io_in_char(re_handler_queue_2_io_in_char),
    .io_in_state(re_handler_queue_2_io_in_state),
    .io_in_rule_0(re_handler_queue_2_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_2_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_2_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_2_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_2_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_2_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_2_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_2_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_2_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_2_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_2_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_2_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_2_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_2_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_2_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_2_io_in_rule_15),
    .io_out_state(re_handler_queue_2_io_out_state)
  );
  REHandler re_handler_queue_3 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_3_clock),
    .reset(re_handler_queue_3_reset),
    .io_in_char(re_handler_queue_3_io_in_char),
    .io_in_state(re_handler_queue_3_io_in_state),
    .io_in_rule_0(re_handler_queue_3_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_3_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_3_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_3_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_3_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_3_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_3_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_3_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_3_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_3_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_3_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_3_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_3_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_3_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_3_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_3_io_in_rule_15),
    .io_out_state(re_handler_queue_3_io_out_state)
  );
  REHandler re_handler_queue_4 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_4_clock),
    .reset(re_handler_queue_4_reset),
    .io_in_char(re_handler_queue_4_io_in_char),
    .io_in_state(re_handler_queue_4_io_in_state),
    .io_in_rule_0(re_handler_queue_4_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_4_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_4_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_4_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_4_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_4_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_4_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_4_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_4_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_4_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_4_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_4_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_4_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_4_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_4_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_4_io_in_rule_15),
    .io_out_state(re_handler_queue_4_io_out_state)
  );
  REHandler re_handler_queue_5 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_5_clock),
    .reset(re_handler_queue_5_reset),
    .io_in_char(re_handler_queue_5_io_in_char),
    .io_in_state(re_handler_queue_5_io_in_state),
    .io_in_rule_0(re_handler_queue_5_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_5_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_5_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_5_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_5_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_5_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_5_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_5_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_5_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_5_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_5_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_5_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_5_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_5_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_5_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_5_io_in_rule_15),
    .io_out_state(re_handler_queue_5_io_out_state)
  );
  REHandler re_handler_queue_6 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_6_clock),
    .reset(re_handler_queue_6_reset),
    .io_in_char(re_handler_queue_6_io_in_char),
    .io_in_state(re_handler_queue_6_io_in_state),
    .io_in_rule_0(re_handler_queue_6_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_6_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_6_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_6_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_6_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_6_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_6_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_6_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_6_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_6_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_6_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_6_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_6_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_6_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_6_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_6_io_in_rule_15),
    .io_out_state(re_handler_queue_6_io_out_state)
  );
  REHandler re_handler_queue_7 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_7_clock),
    .reset(re_handler_queue_7_reset),
    .io_in_char(re_handler_queue_7_io_in_char),
    .io_in_state(re_handler_queue_7_io_in_state),
    .io_in_rule_0(re_handler_queue_7_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_7_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_7_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_7_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_7_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_7_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_7_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_7_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_7_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_7_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_7_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_7_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_7_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_7_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_7_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_7_io_in_rule_15),
    .io_out_state(re_handler_queue_7_io_out_state)
  );
  REHandler re_handler_queue_8 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_8_clock),
    .reset(re_handler_queue_8_reset),
    .io_in_char(re_handler_queue_8_io_in_char),
    .io_in_state(re_handler_queue_8_io_in_state),
    .io_in_rule_0(re_handler_queue_8_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_8_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_8_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_8_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_8_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_8_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_8_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_8_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_8_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_8_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_8_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_8_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_8_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_8_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_8_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_8_io_in_rule_15),
    .io_out_state(re_handler_queue_8_io_out_state)
  );
  REHandler re_handler_queue_9 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_9_clock),
    .reset(re_handler_queue_9_reset),
    .io_in_char(re_handler_queue_9_io_in_char),
    .io_in_state(re_handler_queue_9_io_in_state),
    .io_in_rule_0(re_handler_queue_9_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_9_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_9_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_9_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_9_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_9_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_9_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_9_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_9_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_9_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_9_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_9_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_9_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_9_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_9_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_9_io_in_rule_15),
    .io_out_state(re_handler_queue_9_io_out_state)
  );
  REHandler re_handler_queue_10 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_10_clock),
    .reset(re_handler_queue_10_reset),
    .io_in_char(re_handler_queue_10_io_in_char),
    .io_in_state(re_handler_queue_10_io_in_state),
    .io_in_rule_0(re_handler_queue_10_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_10_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_10_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_10_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_10_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_10_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_10_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_10_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_10_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_10_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_10_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_10_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_10_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_10_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_10_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_10_io_in_rule_15),
    .io_out_state(re_handler_queue_10_io_out_state)
  );
  REHandler re_handler_queue_11 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_11_clock),
    .reset(re_handler_queue_11_reset),
    .io_in_char(re_handler_queue_11_io_in_char),
    .io_in_state(re_handler_queue_11_io_in_state),
    .io_in_rule_0(re_handler_queue_11_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_11_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_11_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_11_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_11_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_11_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_11_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_11_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_11_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_11_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_11_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_11_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_11_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_11_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_11_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_11_io_in_rule_15),
    .io_out_state(re_handler_queue_11_io_out_state)
  );
  REHandler re_handler_queue_12 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_12_clock),
    .reset(re_handler_queue_12_reset),
    .io_in_char(re_handler_queue_12_io_in_char),
    .io_in_state(re_handler_queue_12_io_in_state),
    .io_in_rule_0(re_handler_queue_12_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_12_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_12_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_12_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_12_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_12_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_12_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_12_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_12_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_12_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_12_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_12_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_12_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_12_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_12_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_12_io_in_rule_15),
    .io_out_state(re_handler_queue_12_io_out_state)
  );
  REHandler re_handler_queue_13 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_13_clock),
    .reset(re_handler_queue_13_reset),
    .io_in_char(re_handler_queue_13_io_in_char),
    .io_in_state(re_handler_queue_13_io_in_state),
    .io_in_rule_0(re_handler_queue_13_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_13_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_13_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_13_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_13_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_13_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_13_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_13_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_13_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_13_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_13_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_13_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_13_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_13_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_13_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_13_io_in_rule_15),
    .io_out_state(re_handler_queue_13_io_out_state)
  );
  REHandler re_handler_queue_14 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_14_clock),
    .reset(re_handler_queue_14_reset),
    .io_in_char(re_handler_queue_14_io_in_char),
    .io_in_state(re_handler_queue_14_io_in_state),
    .io_in_rule_0(re_handler_queue_14_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_14_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_14_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_14_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_14_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_14_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_14_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_14_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_14_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_14_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_14_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_14_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_14_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_14_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_14_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_14_io_in_rule_15),
    .io_out_state(re_handler_queue_14_io_out_state)
  );
  REHandler re_handler_queue_15 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_15_clock),
    .reset(re_handler_queue_15_reset),
    .io_in_char(re_handler_queue_15_io_in_char),
    .io_in_state(re_handler_queue_15_io_in_state),
    .io_in_rule_0(re_handler_queue_15_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_15_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_15_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_15_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_15_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_15_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_15_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_15_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_15_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_15_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_15_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_15_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_15_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_15_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_15_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_15_io_in_rule_15),
    .io_out_state(re_handler_queue_15_io_out_state)
  );
  REHandler re_handler_queue_16 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_16_clock),
    .reset(re_handler_queue_16_reset),
    .io_in_char(re_handler_queue_16_io_in_char),
    .io_in_state(re_handler_queue_16_io_in_state),
    .io_in_rule_0(re_handler_queue_16_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_16_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_16_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_16_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_16_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_16_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_16_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_16_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_16_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_16_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_16_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_16_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_16_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_16_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_16_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_16_io_in_rule_15),
    .io_out_state(re_handler_queue_16_io_out_state)
  );
  REHandler re_handler_queue_17 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_17_clock),
    .reset(re_handler_queue_17_reset),
    .io_in_char(re_handler_queue_17_io_in_char),
    .io_in_state(re_handler_queue_17_io_in_state),
    .io_in_rule_0(re_handler_queue_17_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_17_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_17_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_17_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_17_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_17_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_17_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_17_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_17_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_17_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_17_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_17_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_17_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_17_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_17_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_17_io_in_rule_15),
    .io_out_state(re_handler_queue_17_io_out_state)
  );
  REHandler re_handler_queue_18 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_18_clock),
    .reset(re_handler_queue_18_reset),
    .io_in_char(re_handler_queue_18_io_in_char),
    .io_in_state(re_handler_queue_18_io_in_state),
    .io_in_rule_0(re_handler_queue_18_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_18_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_18_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_18_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_18_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_18_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_18_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_18_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_18_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_18_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_18_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_18_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_18_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_18_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_18_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_18_io_in_rule_15),
    .io_out_state(re_handler_queue_18_io_out_state)
  );
  REHandler re_handler_queue_19 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_19_clock),
    .reset(re_handler_queue_19_reset),
    .io_in_char(re_handler_queue_19_io_in_char),
    .io_in_state(re_handler_queue_19_io_in_state),
    .io_in_rule_0(re_handler_queue_19_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_19_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_19_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_19_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_19_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_19_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_19_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_19_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_19_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_19_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_19_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_19_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_19_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_19_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_19_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_19_io_in_rule_15),
    .io_out_state(re_handler_queue_19_io_out_state)
  );
  REHandler re_handler_queue_20 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_20_clock),
    .reset(re_handler_queue_20_reset),
    .io_in_char(re_handler_queue_20_io_in_char),
    .io_in_state(re_handler_queue_20_io_in_state),
    .io_in_rule_0(re_handler_queue_20_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_20_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_20_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_20_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_20_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_20_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_20_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_20_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_20_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_20_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_20_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_20_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_20_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_20_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_20_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_20_io_in_rule_15),
    .io_out_state(re_handler_queue_20_io_out_state)
  );
  REHandler re_handler_queue_21 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_21_clock),
    .reset(re_handler_queue_21_reset),
    .io_in_char(re_handler_queue_21_io_in_char),
    .io_in_state(re_handler_queue_21_io_in_state),
    .io_in_rule_0(re_handler_queue_21_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_21_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_21_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_21_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_21_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_21_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_21_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_21_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_21_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_21_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_21_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_21_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_21_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_21_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_21_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_21_io_in_rule_15),
    .io_out_state(re_handler_queue_21_io_out_state)
  );
  REHandler re_handler_queue_22 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_22_clock),
    .reset(re_handler_queue_22_reset),
    .io_in_char(re_handler_queue_22_io_in_char),
    .io_in_state(re_handler_queue_22_io_in_state),
    .io_in_rule_0(re_handler_queue_22_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_22_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_22_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_22_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_22_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_22_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_22_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_22_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_22_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_22_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_22_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_22_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_22_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_22_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_22_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_22_io_in_rule_15),
    .io_out_state(re_handler_queue_22_io_out_state)
  );
  REHandler re_handler_queue_23 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_23_clock),
    .reset(re_handler_queue_23_reset),
    .io_in_char(re_handler_queue_23_io_in_char),
    .io_in_state(re_handler_queue_23_io_in_state),
    .io_in_rule_0(re_handler_queue_23_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_23_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_23_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_23_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_23_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_23_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_23_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_23_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_23_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_23_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_23_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_23_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_23_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_23_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_23_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_23_io_in_rule_15),
    .io_out_state(re_handler_queue_23_io_out_state)
  );
  REHandler re_handler_queue_24 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_24_clock),
    .reset(re_handler_queue_24_reset),
    .io_in_char(re_handler_queue_24_io_in_char),
    .io_in_state(re_handler_queue_24_io_in_state),
    .io_in_rule_0(re_handler_queue_24_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_24_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_24_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_24_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_24_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_24_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_24_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_24_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_24_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_24_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_24_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_24_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_24_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_24_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_24_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_24_io_in_rule_15),
    .io_out_state(re_handler_queue_24_io_out_state)
  );
  REHandler re_handler_queue_25 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_25_clock),
    .reset(re_handler_queue_25_reset),
    .io_in_char(re_handler_queue_25_io_in_char),
    .io_in_state(re_handler_queue_25_io_in_state),
    .io_in_rule_0(re_handler_queue_25_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_25_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_25_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_25_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_25_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_25_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_25_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_25_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_25_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_25_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_25_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_25_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_25_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_25_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_25_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_25_io_in_rule_15),
    .io_out_state(re_handler_queue_25_io_out_state)
  );
  REHandler re_handler_queue_26 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_26_clock),
    .reset(re_handler_queue_26_reset),
    .io_in_char(re_handler_queue_26_io_in_char),
    .io_in_state(re_handler_queue_26_io_in_state),
    .io_in_rule_0(re_handler_queue_26_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_26_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_26_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_26_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_26_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_26_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_26_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_26_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_26_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_26_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_26_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_26_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_26_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_26_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_26_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_26_io_in_rule_15),
    .io_out_state(re_handler_queue_26_io_out_state)
  );
  REHandler re_handler_queue_27 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_27_clock),
    .reset(re_handler_queue_27_reset),
    .io_in_char(re_handler_queue_27_io_in_char),
    .io_in_state(re_handler_queue_27_io_in_state),
    .io_in_rule_0(re_handler_queue_27_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_27_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_27_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_27_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_27_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_27_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_27_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_27_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_27_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_27_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_27_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_27_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_27_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_27_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_27_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_27_io_in_rule_15),
    .io_out_state(re_handler_queue_27_io_out_state)
  );
  REHandler re_handler_queue_28 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_28_clock),
    .reset(re_handler_queue_28_reset),
    .io_in_char(re_handler_queue_28_io_in_char),
    .io_in_state(re_handler_queue_28_io_in_state),
    .io_in_rule_0(re_handler_queue_28_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_28_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_28_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_28_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_28_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_28_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_28_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_28_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_28_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_28_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_28_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_28_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_28_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_28_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_28_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_28_io_in_rule_15),
    .io_out_state(re_handler_queue_28_io_out_state)
  );
  REHandler re_handler_queue_29 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_29_clock),
    .reset(re_handler_queue_29_reset),
    .io_in_char(re_handler_queue_29_io_in_char),
    .io_in_state(re_handler_queue_29_io_in_state),
    .io_in_rule_0(re_handler_queue_29_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_29_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_29_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_29_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_29_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_29_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_29_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_29_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_29_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_29_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_29_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_29_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_29_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_29_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_29_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_29_io_in_rule_15),
    .io_out_state(re_handler_queue_29_io_out_state)
  );
  REHandler re_handler_queue_30 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_30_clock),
    .reset(re_handler_queue_30_reset),
    .io_in_char(re_handler_queue_30_io_in_char),
    .io_in_state(re_handler_queue_30_io_in_state),
    .io_in_rule_0(re_handler_queue_30_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_30_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_30_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_30_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_30_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_30_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_30_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_30_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_30_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_30_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_30_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_30_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_30_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_30_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_30_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_30_io_in_rule_15),
    .io_out_state(re_handler_queue_30_io_out_state)
  );
  REHandler re_handler_queue_31 ( // @[RxRESearcher.scala 63:54]
    .clock(re_handler_queue_31_clock),
    .reset(re_handler_queue_31_reset),
    .io_in_char(re_handler_queue_31_io_in_char),
    .io_in_state(re_handler_queue_31_io_in_state),
    .io_in_rule_0(re_handler_queue_31_io_in_rule_0),
    .io_in_rule_1(re_handler_queue_31_io_in_rule_1),
    .io_in_rule_2(re_handler_queue_31_io_in_rule_2),
    .io_in_rule_3(re_handler_queue_31_io_in_rule_3),
    .io_in_rule_4(re_handler_queue_31_io_in_rule_4),
    .io_in_rule_5(re_handler_queue_31_io_in_rule_5),
    .io_in_rule_6(re_handler_queue_31_io_in_rule_6),
    .io_in_rule_7(re_handler_queue_31_io_in_rule_7),
    .io_in_rule_8(re_handler_queue_31_io_in_rule_8),
    .io_in_rule_9(re_handler_queue_31_io_in_rule_9),
    .io_in_rule_10(re_handler_queue_31_io_in_rule_10),
    .io_in_rule_11(re_handler_queue_31_io_in_rule_11),
    .io_in_rule_12(re_handler_queue_31_io_in_rule_12),
    .io_in_rule_13(re_handler_queue_31_io_in_rule_13),
    .io_in_rule_14(re_handler_queue_31_io_in_rule_14),
    .io_in_rule_15(re_handler_queue_31_io_in_rule_15),
    .io_out_state(re_handler_queue_31_io_out_state)
  );
  assign io_in_tready = out_shake_hand | _io_in_tready_T; // @[RxRESearcher.scala 106:34]
  assign io_out_tdata = in_reg_r[513:2]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_tvalid = _io_out_tvalid_T & (done_reg | match_found_reg); // @[RxRESearcher.scala 107:52]
  assign io_out_tlast = in_reg_r[0]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_tuser = in_reg_r[514]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_tlen = in_reg_r[600:585]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_qid = extern_config_reg_c2h_match_op[7] ? _io_out_rx_info_qid_T : in_reg_rx_info_qid; // @[RxRESearcher.scala 102:43 103:24 RxPipelineHandler.scala 29:18]
  assign io_out_rx_info_ip_chksum = in_reg_r[578:547]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_rx_info_tcp_chksum = in_reg_r[546:515]; // @[RxPipelineHandler.scala 14:128]
  assign io_out_extern_config_c2h_match_op = extern_config_reg_r[263:256]; // @[RxPipelineHandler.scala 15:91]
  assign re_handler_queue_0_clock = clock;
  assign re_handler_queue_0_reset = reset;
  assign re_handler_queue_0_io_in_char = in_reg_tdata[15:0]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_0_io_in_state = cur_state_reg; // @[RxRESearcher.scala 71:49]
  assign re_handler_queue_0_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_0_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_clock = clock;
  assign re_handler_queue_1_reset = reset;
  assign re_handler_queue_1_io_in_char = in_reg_tdata[31:16]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_1_io_in_state = re_handler_queue_0_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_1_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_1_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_clock = clock;
  assign re_handler_queue_2_reset = reset;
  assign re_handler_queue_2_io_in_char = in_reg_tdata[47:32]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_2_io_in_state = re_handler_queue_1_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_2_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_2_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_clock = clock;
  assign re_handler_queue_3_reset = reset;
  assign re_handler_queue_3_io_in_char = in_reg_tdata[63:48]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_3_io_in_state = re_handler_queue_2_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_3_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_3_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_clock = clock;
  assign re_handler_queue_4_reset = reset;
  assign re_handler_queue_4_io_in_char = in_reg_tdata[79:64]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_4_io_in_state = re_handler_queue_3_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_4_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_4_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_clock = clock;
  assign re_handler_queue_5_reset = reset;
  assign re_handler_queue_5_io_in_char = in_reg_tdata[95:80]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_5_io_in_state = re_handler_queue_4_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_5_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_5_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_clock = clock;
  assign re_handler_queue_6_reset = reset;
  assign re_handler_queue_6_io_in_char = in_reg_tdata[111:96]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_6_io_in_state = re_handler_queue_5_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_6_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_6_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_clock = clock;
  assign re_handler_queue_7_reset = reset;
  assign re_handler_queue_7_io_in_char = in_reg_tdata[127:112]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_7_io_in_state = re_handler_queue_6_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_7_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_7_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_clock = clock;
  assign re_handler_queue_8_reset = reset;
  assign re_handler_queue_8_io_in_char = in_reg_tdata[143:128]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_8_io_in_state = re_handler_queue_7_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_8_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_8_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_clock = clock;
  assign re_handler_queue_9_reset = reset;
  assign re_handler_queue_9_io_in_char = in_reg_tdata[159:144]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_9_io_in_state = re_handler_queue_8_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_9_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_9_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_clock = clock;
  assign re_handler_queue_10_reset = reset;
  assign re_handler_queue_10_io_in_char = in_reg_tdata[175:160]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_10_io_in_state = re_handler_queue_9_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_10_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_10_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_clock = clock;
  assign re_handler_queue_11_reset = reset;
  assign re_handler_queue_11_io_in_char = in_reg_tdata[191:176]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_11_io_in_state = re_handler_queue_10_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_11_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_11_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_clock = clock;
  assign re_handler_queue_12_reset = reset;
  assign re_handler_queue_12_io_in_char = in_reg_tdata[207:192]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_12_io_in_state = re_handler_queue_11_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_12_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_12_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_clock = clock;
  assign re_handler_queue_13_reset = reset;
  assign re_handler_queue_13_io_in_char = in_reg_tdata[223:208]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_13_io_in_state = re_handler_queue_12_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_13_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_13_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_clock = clock;
  assign re_handler_queue_14_reset = reset;
  assign re_handler_queue_14_io_in_char = in_reg_tdata[239:224]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_14_io_in_state = re_handler_queue_13_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_14_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_14_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_clock = clock;
  assign re_handler_queue_15_reset = reset;
  assign re_handler_queue_15_io_in_char = in_reg_tdata[255:240]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_15_io_in_state = re_handler_queue_14_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_15_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_15_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_clock = clock;
  assign re_handler_queue_16_reset = reset;
  assign re_handler_queue_16_io_in_char = in_reg_tdata[271:256]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_16_io_in_state = re_handler_queue_15_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_16_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_16_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_clock = clock;
  assign re_handler_queue_17_reset = reset;
  assign re_handler_queue_17_io_in_char = in_reg_tdata[287:272]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_17_io_in_state = re_handler_queue_16_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_17_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_17_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_clock = clock;
  assign re_handler_queue_18_reset = reset;
  assign re_handler_queue_18_io_in_char = in_reg_tdata[303:288]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_18_io_in_state = re_handler_queue_17_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_18_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_18_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_clock = clock;
  assign re_handler_queue_19_reset = reset;
  assign re_handler_queue_19_io_in_char = in_reg_tdata[319:304]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_19_io_in_state = re_handler_queue_18_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_19_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_19_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_clock = clock;
  assign re_handler_queue_20_reset = reset;
  assign re_handler_queue_20_io_in_char = in_reg_tdata[335:320]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_20_io_in_state = re_handler_queue_19_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_20_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_20_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_clock = clock;
  assign re_handler_queue_21_reset = reset;
  assign re_handler_queue_21_io_in_char = in_reg_tdata[351:336]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_21_io_in_state = re_handler_queue_20_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_21_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_21_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_clock = clock;
  assign re_handler_queue_22_reset = reset;
  assign re_handler_queue_22_io_in_char = in_reg_tdata[367:352]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_22_io_in_state = re_handler_queue_21_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_22_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_22_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_clock = clock;
  assign re_handler_queue_23_reset = reset;
  assign re_handler_queue_23_io_in_char = in_reg_tdata[383:368]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_23_io_in_state = re_handler_queue_22_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_23_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_23_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_clock = clock;
  assign re_handler_queue_24_reset = reset;
  assign re_handler_queue_24_io_in_char = in_reg_tdata[399:384]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_24_io_in_state = re_handler_queue_23_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_24_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_24_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_clock = clock;
  assign re_handler_queue_25_reset = reset;
  assign re_handler_queue_25_io_in_char = in_reg_tdata[415:400]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_25_io_in_state = re_handler_queue_24_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_25_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_25_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_clock = clock;
  assign re_handler_queue_26_reset = reset;
  assign re_handler_queue_26_io_in_char = in_reg_tdata[431:416]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_26_io_in_state = re_handler_queue_25_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_26_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_26_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_clock = clock;
  assign re_handler_queue_27_reset = reset;
  assign re_handler_queue_27_io_in_char = in_reg_tdata[447:432]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_27_io_in_state = re_handler_queue_26_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_27_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_27_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_clock = clock;
  assign re_handler_queue_28_reset = reset;
  assign re_handler_queue_28_io_in_char = in_reg_tdata[463:448]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_28_io_in_state = re_handler_queue_27_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_28_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_28_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_clock = clock;
  assign re_handler_queue_29_reset = reset;
  assign re_handler_queue_29_io_in_char = in_reg_tdata[479:464]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_29_io_in_state = re_handler_queue_28_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_29_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_29_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_clock = clock;
  assign re_handler_queue_30_reset = reset;
  assign re_handler_queue_30_io_in_char = in_reg_tdata[495:480]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_30_io_in_state = re_handler_queue_29_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_30_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_30_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_clock = clock;
  assign re_handler_queue_31_reset = reset;
  assign re_handler_queue_31_io_in_char = in_reg_tdata[511:496]; // @[RxRESearcher.scala 70:51]
  assign re_handler_queue_31_io_in_state = re_handler_queue_30_io_out_state; // @[RxRESearcher.scala 72:42]
  assign re_handler_queue_31_io_in_rule_0 = _input_rule_T[15:0]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_1 = _input_rule_T[31:16]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_2 = _input_rule_T[47:32]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_3 = _input_rule_T[63:48]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_4 = _input_rule_T[79:64]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_5 = _input_rule_T[95:80]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_6 = _input_rule_T[111:96]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_7 = _input_rule_T[127:112]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_8 = _input_rule_T[143:128]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_9 = _input_rule_T[159:144]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_10 = _input_rule_T[175:160]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_11 = _input_rule_T[191:176]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_12 = _input_rule_T[207:192]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_13 = _input_rule_T[223:208]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_14 = _input_rule_T[239:224]; // @[RxRESearcher.scala 62:60]
  assign re_handler_queue_31_io_in_rule_15 = _input_rule_T[255:240]; // @[RxRESearcher.scala 62:60]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 28:20]
      in_reg_r <= 605'h1; // @[Reg.scala 28:20]
    end else if (in_shake_hand) begin // @[Reg.scala 29:18]
      in_reg_r <= _in_reg_T_1; // @[Reg.scala 29:22]
    end
    if (reset) begin // @[Reg.scala 28:20]
      extern_config_reg_r <= 264'h0; // @[Reg.scala 28:20]
    end else if (in_shake_hand) begin // @[Reg.scala 29:18]
      extern_config_reg_r <= _extern_config_reg_T; // @[Reg.scala 29:22]
    end
    if (reset) begin // @[RxPipelineHandler.scala 18:32]
      in_reg_used_reg <= 1'h0; // @[RxPipelineHandler.scala 18:32]
    end else begin
      in_reg_used_reg <= _GEN_4;
    end
    if (reset) begin // @[RxRESearcher.scala 58:33]
      beat_counter_reg <= 8'h0; // @[RxRESearcher.scala 58:33]
    end else if (in_shake_hand) begin // @[RxRESearcher.scala 83:24]
      beat_counter_reg <= 8'h0; // @[RxRESearcher.scala 84:22]
    end else if (beat_counter_reg < 8'h20) begin // @[RxRESearcher.scala 86:48]
      if (!(beat_counter_reg == 8'h1f)) begin // @[RxRESearcher.scala 87:52]
        beat_counter_reg <= _beat_counter_reg_T_1; // @[RxRESearcher.scala 90:26]
      end
    end
    if (reset) begin // @[RxRESearcher.scala 59:25]
      done_reg <= 1'h0; // @[RxRESearcher.scala 59:25]
    end else if (in_shake_hand) begin // @[RxRESearcher.scala 83:24]
      done_reg <= 1'h0; // @[RxRESearcher.scala 85:14]
    end else if (beat_counter_reg < 8'h20) begin // @[RxRESearcher.scala 86:48]
      done_reg <= _GEN_40;
    end
    if (reset) begin // @[RxRESearcher.scala 60:30]
      cur_state_reg <= 4'h0; // @[RxRESearcher.scala 60:30]
    end else if (in_shake_hand) begin // @[RxRESearcher.scala 75:24]
      if (in_reg_tlast) begin // @[RxRESearcher.scala 76:25]
        cur_state_reg <= 4'h0; // @[RxRESearcher.scala 77:21]
      end else if (cur_state_reg != 4'hf) begin // @[RxRESearcher.scala 78:39]
        cur_state_reg <= _GEN_36; // @[RxRESearcher.scala 79:21]
      end
    end
    if (reset) begin // @[RxRESearcher.scala 66:32]
      match_found_reg <= 1'h0; // @[RxRESearcher.scala 66:32]
    end else if (in_shake_hand) begin // @[RxRESearcher.scala 94:23]
      if (in_reg_tlast) begin // @[RxRESearcher.scala 95:24]
        match_found_reg <= 1'h0; // @[RxRESearcher.scala 96:23]
      end
    end else if (~match_found_reg) begin // @[RxRESearcher.scala 98:32]
      match_found_reg <= _GEN_36 == 4'hf; // @[RxRESearcher.scala 99:21]
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
  in_reg_r = _RAND_0[604:0];
  _RAND_1 = {9{`RANDOM}};
  extern_config_reg_r = _RAND_1[263:0];
  _RAND_2 = {1{`RANDOM}};
  in_reg_used_reg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  beat_counter_reg = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  done_reg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  cur_state_reg = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  match_found_reg = _RAND_6[0:0];
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
  wire [7:0] rx_re_searcher_io_in_extern_config_c2h_match_op; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 33:30]
  wire [31:0] rx_re_searcher_io_in_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 33:30]
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
  RxRESearcher rx_re_searcher ( // @[RxPipeline.scala 33:30]
    .clock(rx_re_searcher_clock),
    .reset(rx_re_searcher_reset),
    .io_in_tdata(rx_re_searcher_io_in_tdata),
    .io_in_tvalid(rx_re_searcher_io_in_tvalid),
    .io_in_tready(rx_re_searcher_io_in_tready),
    .io_in_tlast(rx_re_searcher_io_in_tlast),
    .io_in_tuser(rx_re_searcher_io_in_tuser),
    .io_in_rx_info_tlen(rx_re_searcher_io_in_rx_info_tlen),
    .io_in_extern_config_c2h_match_op(rx_re_searcher_io_in_extern_config_c2h_match_op),
    .io_in_extern_config_c2h_match_arg_0(rx_re_searcher_io_in_extern_config_c2h_match_arg_0),
    .io_in_extern_config_c2h_match_arg_1(rx_re_searcher_io_in_extern_config_c2h_match_arg_1),
    .io_in_extern_config_c2h_match_arg_2(rx_re_searcher_io_in_extern_config_c2h_match_arg_2),
    .io_in_extern_config_c2h_match_arg_3(rx_re_searcher_io_in_extern_config_c2h_match_arg_3),
    .io_in_extern_config_c2h_match_arg_4(rx_re_searcher_io_in_extern_config_c2h_match_arg_4),
    .io_in_extern_config_c2h_match_arg_5(rx_re_searcher_io_in_extern_config_c2h_match_arg_5),
    .io_in_extern_config_c2h_match_arg_6(rx_re_searcher_io_in_extern_config_c2h_match_arg_6),
    .io_in_extern_config_c2h_match_arg_7(rx_re_searcher_io_in_extern_config_c2h_match_arg_7),
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
  assign io_in_tready = rx_re_searcher_io_in_tready; // @[RxPipeline.scala 34:9]
  assign io_out_tdata = rx_re_searcher_io_out_tdata; // @[RxPipeline.scala 35:25]
  assign io_out_tvalid = rx_re_searcher_io_out_tvalid; // @[RxPipeline.scala 35:25]
  assign io_out_tlast = rx_re_searcher_io_out_tlast; // @[RxPipeline.scala 35:25]
  assign io_out_tuser = rx_re_searcher_io_out_tuser; // @[RxPipeline.scala 35:25]
  assign io_out_rx_info_tlen = rx_re_searcher_io_out_rx_info_tlen; // @[RxPipeline.scala 35:25]
  assign io_out_rx_info_qid = rx_re_searcher_io_out_rx_info_qid; // @[RxPipeline.scala 35:25]
  assign io_out_rx_info_ip_chksum = rx_re_searcher_io_out_rx_info_ip_chksum; // @[RxPipeline.scala 35:25]
  assign io_out_rx_info_tcp_chksum = rx_re_searcher_io_out_rx_info_tcp_chksum; // @[RxPipeline.scala 35:25]
  assign io_out_extern_config_c2h_match_op = rx_re_searcher_io_out_extern_config_c2h_match_op; // @[RxPipeline.scala 35:25]
  assign rx_re_searcher_clock = clock;
  assign rx_re_searcher_reset = reset;
  assign rx_re_searcher_io_in_tdata = io_in_tdata; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_tvalid = io_in_tvalid; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_tlast = io_in_tlast; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_tuser = io_in_tuser; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_rx_info_tlen = io_in_rx_info_tlen; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_extern_config_c2h_match_op = io_in_extern_config_c2h_match_op; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_0 = io_in_extern_config_c2h_match_arg_0; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_1 = io_in_extern_config_c2h_match_arg_1; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_2 = io_in_extern_config_c2h_match_arg_2; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_3 = io_in_extern_config_c2h_match_arg_3; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_4 = io_in_extern_config_c2h_match_arg_4; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_5 = io_in_extern_config_c2h_match_arg_5; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_6 = io_in_extern_config_c2h_match_arg_6; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_in_extern_config_c2h_match_arg_7 = io_in_extern_config_c2h_match_arg_7; // @[RxPipeline.scala 34:9]
  assign rx_re_searcher_io_out_tready = io_out_tready; // @[RxPipeline.scala 35:25]
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
  input  [31:0]  io_extern_config_c2h_match_arg_7
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
  wire [7:0] rx_converter_io_extern_config_c2h_match_op; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_0; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_1; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_2; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_3; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_4; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_5; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_6; // @[RxHandler.scala 38:28]
  wire [31:0] rx_converter_io_extern_config_c2h_match_arg_7; // @[RxHandler.scala 38:28]
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
    .io_extern_config_c2h_match_op(rx_converter_io_extern_config_c2h_match_op),
    .io_extern_config_c2h_match_arg_0(rx_converter_io_extern_config_c2h_match_arg_0),
    .io_extern_config_c2h_match_arg_1(rx_converter_io_extern_config_c2h_match_arg_1),
    .io_extern_config_c2h_match_arg_2(rx_converter_io_extern_config_c2h_match_arg_2),
    .io_extern_config_c2h_match_arg_3(rx_converter_io_extern_config_c2h_match_arg_3),
    .io_extern_config_c2h_match_arg_4(rx_converter_io_extern_config_c2h_match_arg_4),
    .io_extern_config_c2h_match_arg_5(rx_converter_io_extern_config_c2h_match_arg_5),
    .io_extern_config_c2h_match_arg_6(rx_converter_io_extern_config_c2h_match_arg_6),
    .io_extern_config_c2h_match_arg_7(rx_converter_io_extern_config_c2h_match_arg_7)
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
    .io_extern_config_c2h_match_op(tx_handler_io_extern_config_c2h_match_op)
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
    .io_extern_config_c2h_match_arg_7(rx_handler_io_extern_config_c2h_match_arg_7)
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
endmodule
