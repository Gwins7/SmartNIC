
`timescale 1 ps / 1 ps
`include "qdma_stm_defines.svh"

module cmac_fifo(
    input QDMA_axis_aclk,
    input CMAC_axis_aclk,
    input tx_fifo_aresetn,
    input rx_fifo_aresetn,
// in
    input [511:0] CMAC_in_tdata,
    input [63:0] CMAC_in_tkeep,
    input CMAC_in_tlast,
    output CMAC_in_tready,
    input CMAC_in_tvalid,

    output [511:0] tx_axis_tdata,
    output [63:0] tx_axis_tkeep,
    output tx_axis_tlast,
    input tx_axis_tready,
    output tx_axis_tvalid,

    input [511:0] rx_axis_tdata,
    input [63:0] rx_axis_tkeep,
    input rx_axis_tlast,
    input rx_axis_tvalid,
    input rx_axis_tuser,
    // output rx_axis_tready, 
    

    // out
    output [511:0] CMAC_out_tdata,
    output [63:0] CMAC_out_tkeep,
    output CMAC_out_tlast,
    input CMAC_out_tready,
    output CMAC_out_tvalid,
    output CMAC_out_tuser,

    input reset_counter
);

    wire [511:0] rx_axis_uram_tdata;
    wire [63:0] rx_axis_uram_tkeep;
    wire rx_axis_uram_tlast;
    wire rx_axis_uram_tvalid;
    wire rx_axis_uram_tuser;
    wire rx_axis_uram_tready;

    wire rx_prog_full;
    wire rx_axis_tready;
    reg drop_cur_packet;
    (* mark_debug = "true" *)reg [31:0] drop_packet_num;
    (* mark_debug = "true" *)reg [31:0] rx_tuser_num;
    always @ (posedge CMAC_axis_aclk) begin
        if (!rx_fifo_aresetn) begin
            drop_cur_packet <= 1'b0;
            drop_packet_num <= 32'b0;
            rx_tuser_num <= 32'b0;
        end
        else begin
            if (rx_axis_tlast & rx_axis_tvalid) begin
            drop_cur_packet <= rx_prog_full;
            drop_packet_num <= drop_packet_num + rx_prog_full;
            end
            if (rx_axis_tuser) rx_tuser_num <= rx_tuser_num + 1;
        end
    end

axis_data_fifo_0 cmac_tx_fifo(
    .s_axis_aclk(QDMA_axis_aclk),
    .m_axis_aclk(CMAC_axis_aclk),
    .s_axis_aresetn(tx_fifo_aresetn),
    
    .s_axis_tdata(CMAC_in_tdata),
    .s_axis_tkeep(CMAC_in_tkeep),
    .s_axis_tlast(CMAC_in_tlast),
    .s_axis_tready(CMAC_in_tready),
    .s_axis_tvalid(CMAC_in_tvalid),
    .s_axis_tuser(1'b0),
    .m_axis_tdata(tx_axis_tdata),
    .m_axis_tkeep(tx_axis_tkeep),
    .m_axis_tlast(tx_axis_tlast),
    .m_axis_tready(tx_axis_tready),
    .m_axis_tvalid(tx_axis_tvalid),
    .m_axis_tuser()
);

axis_data_fifo_1 cmac_rx_uram_fifo(
    .s_axis_aclk(CMAC_axis_aclk),
    .s_axis_aresetn(rx_fifo_aresetn),
    
    .s_axis_tdata(rx_axis_tdata),
    .s_axis_tkeep(rx_axis_tkeep),
    .s_axis_tlast(rx_axis_tlast),
    .s_axis_tready(rx_axis_tready),
    .s_axis_tvalid(rx_axis_tvalid & !drop_cur_packet),
    .s_axis_tuser(rx_axis_tuser),

    .m_axis_tdata(rx_axis_uram_tdata),
    .m_axis_tkeep(rx_axis_uram_tkeep),
    .m_axis_tlast(rx_axis_uram_tlast),
    .m_axis_tready(rx_axis_uram_tready),
    .m_axis_tvalid(rx_axis_uram_tvalid),
    .m_axis_tuser(rx_axis_uram_tuser),

    .prog_full(rx_prog_full) // 2016/2048
);

axis_data_fifo_0 cmac_rx_fifo(
    .s_axis_aclk(CMAC_axis_aclk),
    .m_axis_aclk(QDMA_axis_aclk),
    .s_axis_aresetn(rx_fifo_aresetn),
    
    .s_axis_tdata(rx_axis_uram_tdata),
    .s_axis_tkeep(rx_axis_uram_tkeep),
    .s_axis_tlast(rx_axis_uram_tlast),
    .s_axis_tready(rx_axis_uram_tready),
    .s_axis_tvalid(rx_axis_uram_tvalid),
    .s_axis_tuser(rx_axis_uram_tuser),

    .m_axis_tdata(CMAC_out_tdata),
    .m_axis_tkeep(CMAC_out_tkeep),
    .m_axis_tlast(CMAC_out_tlast),
    .m_axis_tready(CMAC_out_tready),
    .m_axis_tvalid(CMAC_out_tvalid),
    .m_axis_tuser(CMAC_out_tuser)
);

endmodule