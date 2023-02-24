`timescale 1 ps / 1 ps
`include "qdma_stm_defines.svh"

// attention for clk's posedge and negedge! 
// ONLY THE SIGNALS IN CLK'S NEG PERIOD ARE VALID
module smartnic_sim();
    localparam pkt_burst_len = 16;
    
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
    wire QDMA_c2h_cmpt_tready;
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

    wire [7:0] c2h_match_op;
    wire [31:0] c2h_match_arg0;
    wire [31:0] c2h_match_arg1;
    wire [31:0] c2h_match_arg2;
    wire [31:0] c2h_match_arg3;
    wire [31:0] c2h_match_arg4;
    wire [31:0] c2h_match_arg5;
    wire [31:0] c2h_match_arg6;
    wire [31:0] c2h_match_arg7;

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

    c2h_match_op,
    c2h_match_arg0,
    c2h_match_arg1,
    c2h_match_arg2,
    c2h_match_arg3,
    c2h_match_arg4,
    c2h_match_arg5,
    c2h_match_arg6,
    c2h_match_arg7,
    !QDMA_axi_aresetn
    );

reg [7:0] beat_counter; 
reg send_pattern;
reg [15:0] wait_timer;
reg wait_status;

// reg QDMA_c2h_cmpt_tready;

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
    if (!QDMA_axi_aresetn) begin
        beat_counter = 8'd15;
        wait_timer = 16'd0;
        wait_status = 1'b0;
        send_pattern = 1'b0;
//        QDMA_c2h_cmpt_tready = 1'b0;
    end
    else begin
        if (h2c_shake_hand & QDMA_h2c_tlast) send_pattern = !send_pattern;
        
        // if (c2h_cmpt_shake_hand) QDMA_c2h_cmpt_tready = 1'b0;
        // else if (c2h_shake_hand & QDMA_c2h_tlast) QDMA_c2h_cmpt_tready = 1'b1;

        if (QDMA_h2c_tready) begin
            if (beat_counter == pkt_burst_len-1) begin
                beat_counter = 8'd0;
                wait_timer = 16'd0;
                wait_status = 1'b1;
            end
            else if (!wait_status) beat_counter = beat_counter + 8'd1; 
            else begin
                wait_timer = wait_timer + 16'd1;
                if (wait_timer == 16'd64) wait_status = 1'b0;
            end
        end
    end
end



assign QDMA_h2c_err = 1'b0;
assign QDMA_h2c_mdata = 32'h20000000;
assign QDMA_h2c_mty = 6'h0;
assign QDMA_h2c_port_id = 3'h0;
assign QDMA_h2c_qid = 10'h0;
assign QDMA_h2c_zero_byte = 1'b0;

//646c726f776f6c6c6568

assign QDMA_h2c_tdata = (beat_counter == 0)?(
(!send_pattern)?512'h726f776f_6c6c6568_00000000_00000839_02500000_00000000_00005000_e8030101_0f0f0002_0f0f0000_06400040_0001f203_00450008_a7a73b00_5452eefe_2e1f61e8:
512'h00000000_00000000_00000000_00000839_02500000_00000000_00005000_e8030101_0f0f0002_0f0f0000_06400040_0001f203_00450008_a7a73b00_5452eefe_2e1f61e8):
((beat_counter == 1)?((!send_pattern)?512'h656c:512'h0):512'h0);

assign QDMA_h2c_tlast = (beat_counter == pkt_burst_len-1);
assign QDMA_h2c_tvalid = QDMA_axi_aresetn & !wait_status;
assign QDMA_c2h_cmpt_tready = c2h_shake_hand & QDMA_c2h_tlast;
assign QDMA_c2h_tready = 1'b1;

// 8 bit op:
// op = 00000000: do nothing
// op(3) : RxStrMatcher -> op(2,0): function(<(4),>(2),=(1),!=(0))
// op(4) : RxStrSearcher
// op(5) : RxRSSHasher
// op(6) : ChksumGenerator / ChksumVerifier (control in Tx/RxBufferFifo)
// op(7) : RxRESearcher

// example test:
// 1. 0x60(01100000) 0x6d5a6d5a 0x1 0x0 (RSS)
// 2. 0x4b(01001011) 0x0f0f0208 0xffffffff 0x1a (Matcher, ip >= 15.15.2.8)
// 3. 0x50(01010000) 0x0f0f0208 0xffffffff (Searcher)

// RxStrMatcher:    arg1:content;   arg2:mask;      arg3:place
// RxStrSearcher:   arg1:content;   arg2:mask
// RxRSSHasher: arg1:hash_seed; arg2:hash_mask

assign c2h_match_op   = 8'b10000000;
assign c2h_match_arg0 = 32'h1068_2165;
assign c2h_match_arg1 = 32'h326c_436c;
assign c2h_match_arg2 = 32'h546f_6577;
assign c2h_match_arg3 = 32'h766f_8772;
assign c2h_match_arg4 = 32'h986c_f964;
assign c2h_match_arg5 = 32'h0000_0000;
assign c2h_match_arg6 = 32'h0000_0000;
assign c2h_match_arg7 = 32'h0000_0000;
endmodule