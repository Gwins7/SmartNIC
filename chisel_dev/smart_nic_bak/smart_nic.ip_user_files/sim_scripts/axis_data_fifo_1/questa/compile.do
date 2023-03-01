vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axis_infrastructure_v1_1_0
vlib questa_lib/msim/axis_data_fifo_v2_0_3
vlib questa_lib/msim/xil_defaultlib

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axis_infrastructure_v1_1_0 questa_lib/msim/axis_infrastructure_v1_1_0
vmap axis_data_fifo_v2_0_3 questa_lib/msim/axis_data_fifo_v2_0_3
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xilinx_vip -64 -sv -L cmac_usplus_v3_1_0 -L qdma_v4_0_0 -L axi_vip_v1_1_7 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -sv -L cmac_usplus_v3_1_0 -L qdma_v4_0_0 -L axi_vip_v1_1_7 -L zynq_ultra_ps_e_vip_v1_0_7 -L xilinx_vip "+incdir+../../../ipstatic/hdl" "+incdir+../../../../doce_nf.gen/sources_1/ip/axis_data_fifo_1/hdl" "+incdir+/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/home/huangtianyi/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axis_infrastructure_v1_1_0 -64 "+incdir+../../../ipstatic/hdl" "+incdir+../../../../doce_nf.gen/sources_1/ip/axis_data_fifo_1/hdl" "+incdir+/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_data_fifo_v2_0_3 -64 "+incdir+../../../ipstatic/hdl" "+incdir+../../../../doce_nf.gen/sources_1/ip/axis_data_fifo_1/hdl" "+incdir+/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/axis_data_fifo_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../ipstatic/hdl" "+incdir+../../../../doce_nf.gen/sources_1/ip/axis_data_fifo_1/hdl" "+incdir+/home/huangtianyi/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.gen/sources_1/ip/axis_data_fifo_1/sim/axis_data_fifo_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

