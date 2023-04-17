`timescale 1 ps / 1 ps
`include "qdma_stm_defines.svh"

// attention for clk's posedge and negedge! 
// ONLY THE SIGNALS IN CLK'S NEG PERIOD ARE VALID
module smartnic_sim();
    localparam pkt_burst_len = 1;
    localparam wait_time = 50;
    localparam send_pattern_num = 4;
    reg QDMA_axi_aclk;
    reg QDMA_axi_aresetn;

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
    //wire QDMA_c2h_cmpt_tready;
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
    wire QDMA_c2h_tready;
    wire QDMA_c2h_tvalid;

    wire [31:0] QDMA_h2c_pack_counter;
    wire [31:0] QDMA_h2c_err_counter;
    wire [31:0]  QDMA_c2h_pack_counter;
    wire [31:0]  QDMA_c2h_err_counter;

    wire [15:0] op;
    wire [31:0] arg0;
    wire [31:0] arg1;
    wire [31:0] arg2;
    wire [31:0] arg3;
    wire [31:0] arg4;
    wire [31:0] arg5;
    wire [31:0] arg6;
    wire [31:0] arg7;
    wire [31:0] arg8;
    wire [31:0] arg9;
    wire [31:0] arg10;
    wire [31:0] arg11;
    wire [31:0] arg12;
    wire [31:0] arg13;
    wire [31:0] arg14;
    wire [31:0] arg15;

mpsoc_wrapper mpsoc_wrapper_sim
   (
   QDMA_axi_aclk,
   QDMA_axi_aresetn,
   
   QDMA_h2c_err,
   QDMA_h2c_mdata,
   QDMA_h2c_mty,
   QDMA_h2c_port_id,
   QDMA_h2c_qid,
   QDMA_h2c_tdata,
   QDMA_h2c_tlast,
   QDMA_h2c_tready,
   QDMA_h2c_tvalid,
   QDMA_h2c_zero_byte,

   QDMA_c2h_cmpt_cmpt_type,
   QDMA_c2h_cmpt_col_idx,
   QDMA_c2h_cmpt_data,
   QDMA_c2h_cmpt_dpar,
   QDMA_c2h_cmpt_err_idx,
   QDMA_c2h_cmpt_marker,
   QDMA_c2h_cmpt_qid,
   QDMA_c2h_cmpt_size,
   QDMA_c2h_cmpt_tready,
   QDMA_c2h_cmpt_tvalid,
   QDMA_c2h_cmpt_user_trig,
   QDMA_c2h_cmpt_wait_pld_pkt_id,
    
   QDMA_c2h_ctrl_has_cmpt,
   QDMA_c2h_ctrl_len,
   QDMA_c2h_ctrl_marker,
   QDMA_c2h_ctrl_qid,

   QDMA_c2h_mty,
   QDMA_c2h_tdata,
   QDMA_c2h_tlast,
   QDMA_c2h_tready,
   QDMA_c2h_tvalid,

    QDMA_h2c_pack_counter,
    QDMA_h2c_err_counter,
    QDMA_c2h_pack_counter,
    QDMA_c2h_err_counter,

    op,
    arg0,
    arg1,
    arg2,
    arg3,
    arg4,
    arg5,
    arg6,
    arg7,
    arg8,
    arg9,
    arg10,
    arg11,
    arg12,
    arg13,
    arg14,
    arg15,
    !QDMA_axi_aresetn
    );

reg [7:0] beat_counter; 
reg [3:0] send_pattern;
reg [15:0] wait_timer;
//reg wait_status;

 reg QDMA_c2h_cmpt_tready;

wire h2c_shake_hand = QDMA_h2c_tvalid & QDMA_h2c_tready;
wire c2h_shake_hand = QDMA_c2h_tvalid & QDMA_c2h_tready;
wire c2h_cmpt_shake_hand = QDMA_c2h_cmpt_tvalid & QDMA_c2h_cmpt_tready;

initial begin
    QDMA_axi_aclk = 1'b1;
    forever #1 QDMA_axi_aclk = ~QDMA_axi_aclk;
end

initial begin
    QDMA_axi_aresetn = 1'b0;
    #100 QDMA_axi_aresetn = 1'b1;
end

always @ (posedge QDMA_axi_aclk) begin
    if (!QDMA_axi_aresetn || wait_timer == wait_time) wait_timer = 1'b0;
    else wait_timer = wait_timer + 1;
end

always @ (posedge QDMA_axi_aclk) begin
    if (!QDMA_axi_aresetn) begin
        beat_counter = pkt_burst_len-1;
        send_pattern = 1'b0;
//        QDMA_c2h_cmpt_tready = 1'b0;
    end
    else begin
        QDMA_c2h_cmpt_tready = c2h_shake_hand & QDMA_c2h_tlast;
        if (h2c_shake_hand & QDMA_h2c_tlast) begin
            if (send_pattern == send_pattern_num - 1) send_pattern = 1'b0;
            else send_pattern = send_pattern + 1'b1;
        end
        if (QDMA_h2c_tready) begin
            if (beat_counter == pkt_burst_len-1) begin
                beat_counter = 8'd0;
            end
            else beat_counter = beat_counter + 8'd1; 
        end
    end
end

assign QDMA_h2c_err = 1'b0;
assign QDMA_h2c_mdata = 32'h002a0000;
assign QDMA_h2c_mty = 6'h0;
assign QDMA_h2c_port_id = 3'h0;
assign QDMA_h2c_qid = 10'h0;
assign QDMA_h2c_zero_byte = 1'b0;

//646c726f776f6c6c6568

assign QDMA_h2c_tdata = 
beat_counter == 0 ? 512'haaaaaaaaaaaa00000000000000000839025000000000000000005000e8030100a8c00000a8c0b4b4064000400001f20300450008ffeeddccbbaa982216bae290:
//beat_counter == 1 ? 512'ha605e3637f2bbf47d0ac882830b81bbbecb15455ff8c7d418ef794315ab29e4385b8a4385a12bfa87cd00c74cc6a6797b2c8d7bdfe86ad5d9de193172de69f4d:
//beat_counter == 2 ? 512'h0b01359121b4cec2d9104661d1f5a8da749c6c1cbfb6df9eec53d278c692817ae081c35fdbbe7c783e51b9f7800c6e58dcb63d21c98ccc748d40f74bb200b781:
//beat_counter == 3 ? 512'ha48ab65ea753ab7afbf9833468413b99d85210d03a7c71fd5dae2c59ab113546e363b32c58b2f7c79142f9cf69e9890717945f3d1fc3d103031b24652ed193b6:
//beat_counter == 4 ? 512'h2492ed00e114781cdf7a0d092351df4790aeee03e5d6b1b696b19826ebf62823b1d988c534fe0fd657bc2adcc131598dc818522f40001e6fc5a2fec8454f9beb:
//beat_counter == 5 ? 512'hd62bed5be2d569afe10968ed8a367228e372d29995ce2fff597257e89b85277b4918f233f46046f37e327b6253005549dd046a9674bca871d7d2c0203c0f8815:
//beat_counter == 6 ? 512'h0de8ea71c39d86b226c68f0be84059bad3b0f4539264459bb7aa77a3a321bf9c254deb1076c0231bdd4eb22e6da9c6801e900df6ad9b24130656e407fc72b014:
//beat_counter == 7 ? 512'h1122d314080a20964f150f05cc24413660432fa82d6949d2759a6ad57e677afd1ac9f371bb0b874a48eac496c4fe07b815c65f5bf3ae67a01c035b814cb109a9:
//beat_counter == 8 ? 512'h97133a9e1cac2e722fe19cc69cd17dee544a4edde3d3a6b2b9b3b146ed191df9f78e6fa97d4dd66945cb48ae7c339f77677b36301af30172c69829f4228f894d:
//beat_counter == 9 ? 512'h69b55d1e4815003264f5565106266d8a256aaaea039b2c8be0b96103280acc4a6d481e16b10bdc13ef30e47c0103e03b660fbd78ba732add905637de9d842c57:
//beat_counter == 10 ? 512'h19f7d2291e72f86f7b7c1ea248e2ca460ae89a840c146bbab3bc123c1105f1f0d86031aff77c51d8343cd802d7e2ac86dc86195261afa877ab0d4a202c91bf29:
//beat_counter == 11 ? 512'hf0c5178d1a722732e6b71c84667819854f2bc1c884e00c2409385db670abcf62aba566e88b6f166251a46ae129eec386a6e1bc60d7d4c652c8b2e70eff2afcc3:
//beat_counter == 12 ? 512'h34a5cf611040ff62a162ca8fdfa5a58e667259aba59c095e2e93d888a132efd3958f62ae9f9d97118325ea513f3335bbccbda1476e7686a5f2a699ce9d6070e6:
//beat_counter == 13 ? 512'hdea1a6fcd9d8f2cf3f8d9507389ace4641f71e77ff9b52957e9f840c910fa3e2c8ce0a0999653a3854fa39f259d728caf883256a1db311720d7568af47d5d7be:
//beat_counter == 14 ? 512'h0f53b0cdb74a3b65c34aba3932e7a0ea539536c6c21d0735453fc6e476f2d5429c65925287f1ab8a18d39848940bb38dd319bf8dd8c86f61c9d40f345670b04a:
//beat_counter == 15 ? 512'habcdefadad30ed7ebc4aff165fcaacda598c0e219e2a8a9b9887cecd471e083bb483f62f73a27fa6eb346a857120cb38ede497039102cdcb40afc40b6a854585:
512'h0;

assign QDMA_h2c_tlast = (beat_counter == pkt_burst_len-1);
assign QDMA_h2c_tvalid = QDMA_axi_aresetn /*&& wait_timer == 0*//* & !wait_status*/;
// assign QDMA_c2h_cmpt_tready = c2h_shake_hand & QDMA_c2h_tlast;
assign QDMA_c2h_tready = 1'b1;



// 8 bit op:
// op = 00000000: do nothing
// op(3) : RxStrMatcher -> op(2,0): function(<(4),>(2),=(1),!=(0))
// op(4) : RxStrSearcher
// op(5) : RxRSSHasher
// op(6) : ChksumGenerator / ChksumVerifier (control in Tx/RxBufferFifo)
// op(7) : RxRESearcher

// example test:
// 1. 0x60(01100000) 0x6d5a6d5a 0x6d5a6d5a 0x6d5a6d5a 0x6d5a6d5a 0x01234567 0x89abcdef (RSS)
// 2. 0x4b(01001011) 0x0f0f0208 0xffffffff 0x1a (Matcher, ip >= 15.15.2.8)
// 3. 0x50(01010000) 0x0f0f0208 0xffffffff (Searcher)
// 4. 0x80(10000000) 0x10006868 0x21006565 0x32006c6c 0x43006c6c
//                   0x54006f6f 0x65007777 0x76006f6f 0x87007272
//                   0x98006c6c 0xf9006464 0x00000000(x6) (helloworld) (RESearcher)

// RxStrMatcher:    arg0:content;   arg1:mask;      arg2:place
// RxStrSearcher:   arg0:content;   arg1:mask
// RxRSSHasher: arg0~3:hash_seed; arg4~5:jump_table
// RxRESearcher: arg0-15:DFA rule
assign op   = 16'h60;
assign arg0 = 32'h6d5a6d5a;
assign arg1 = 32'h6d5a6d5a;
assign arg2 = 32'h6d5a6d5a;
assign arg3 = 32'h6d5a6d5a;
assign arg4 = 32'h01234567;
assign arg5 = 32'h89abcdef;
assign arg6 = 32'h0;
assign arg7 = 32'h0;
assign arg8 = 32'h0;
assign arg9 = 32'h0;
assign arg10 = 32'h0;
assign arg11 = 32'h0;
assign arg12 = 32'h0;
assign arg13 = 32'h0;
assign arg14 = 32'h0;
assign arg15 = 32'h0;

endmodule