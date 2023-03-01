vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axis_infrastructure_v1_1_0
vlib riviera/axis_data_fifo_v2_0_3
vlib riviera/xil_defaultlib
vlib riviera/xlconstant_v1_1_7
vlib riviera/gtwizard_ultrascale_v1_7_8
vlib riviera/cmac_usplus_v3_1_0
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_7
vlib riviera/zynq_ultra_ps_e_vip_v1_0_7
vlib riviera/qdma_v4_0_0

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axis_infrastructure_v1_1_0 riviera/axis_infrastructure_v1_1_0
vmap axis_data_fifo_v2_0_3 riviera/axis_data_fifo_v2_0_3
vmap xil_defaultlib riviera/xil_defaultlib
vmap xlconstant_v1_1_7 riviera/xlconstant_v1_1_7
vmap gtwizard_ultrascale_v1_7_8 riviera/gtwizard_ultrascale_v1_7_8
vmap cmac_usplus_v3_1_0 riviera/cmac_usplus_v3_1_0
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_7 riviera/axi_vip_v1_1_7
vmap zynq_ultra_ps_e_vip_v1_0_7 riviera/zynq_ultra_ps_e_vip_v1_0_7
vmap qdma_v4_0_0 riviera/qdma_v4_0_0

vlog -work xilinx_vip  -sv2k12 "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axis_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_data_fifo_v2_0_3  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/50d0/hdl/axis_data_fifo_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_axis_data_fifo_0_0_1/sim/mpsoc_axis_data_fifo_0_0.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_axis_data_fifo_1_0_1/sim/mpsoc_axis_data_fifo_1_0.v" \

vlog -work xlconstant_v1_1_7  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_const_0_0_1/sim/mpsoc_cmac_const_0_0.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_const_1_0_1/sim/mpsoc_cmac_const_1_0.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_const_gt_loopback_in_0_1/sim/mpsoc_cmac_const_gt_loopback_in_0.v" \

vlog -work gtwizard_ultrascale_v1_7_8  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_bit_sync.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gte4_drp_arb.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gthe4_delay_powergood.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gtye4_delay_powergood.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gthe3_cpll_cal.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gthe3_cal_freqcnt.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_rx.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_tx.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gthe4_cal_freqcnt.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_rx.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_tx.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gtye4_cal_freqcnt.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_rx.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_tx.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gtwiz_reset.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_rx.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_tx.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_rx.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_tx.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_reset_sync.v" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/420f/hdl/gtwizard_ultrascale_v1_7_reset_inv_sync.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/ip_0/sim/gtwizard_ultrascale_v1_7_gtye4_channel.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/ip_0/sim/mpsoc_cmac_usplus_0_0_gt_gtye4_channel_wrapper.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/ip_0/sim/gtwizard_ultrascale_v1_7_gtye4_common.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/ip_0/sim/mpsoc_cmac_usplus_0_0_gt_gtye4_common_wrapper.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/ip_0/sim/mpsoc_cmac_usplus_0_0_gt_gtwizard_gtye4.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/ip_0/sim/mpsoc_cmac_usplus_0_0_gt_gtwizard_top.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/ip_0/sim/mpsoc_cmac_usplus_0_0_gt.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/cmac_usplus_v3_1_0/mpsoc_cmac_usplus_0_0_wrapper.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/cmac_usplus_v3_1_0/mpsoc_cmac_usplus_0_0_ultrascale_tx_userclk.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/cmac_usplus_v3_1_0/mpsoc_cmac_usplus_0_0_ultrascale_rx_userclk.v" \

vlog -work cmac_usplus_v3_1_0  -sv2k12 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/35be/hdl/cmac_usplus_v3_1_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/mpsoc_cmac_usplus_0_0/example_design/mpsoc_cmac_usplus_0_0_axis2lbus_segmented_top.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/mpsoc_cmac_usplus_0_0/example_design/mpsoc_cmac_usplus_0_0_lbus2axis_segmented_top.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_cmac_usplus_0_0_1/mpsoc_cmac_usplus_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_pl_clk_sys_reset_0_1/sim/mpsoc_pl_clk_sys_reset_0.vhd" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_rx_reset_0_1/sim/mpsoc_rx_reset_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/mpsoc/ipshared/cc40/rx_reset_cnt.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_rx_reset_cnt_0_0_1/sim/mpsoc_rx_reset_cnt_0_0.v" \
"../../../bd/mpsoc/ipshared/07af/padding.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_tx_padding_0_0_1/sim/mpsoc_tx_padding_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_tx_reset_0_1/sim/mpsoc_tx_reset_0.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_7  -sv2k12 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_7  -sv2k12 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_zynq_mpsoc_0_1/sim/mpsoc_zynq_mpsoc_0_vip_wrapper.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/ip_0/sim/gtwizard_ultrascale_v1_7_gthe4_channel.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/ip_0/sim/mpsoc_qdma_0_0_pcie4_ip_gt_gthe4_channel_wrapper.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/ip_0/sim/gtwizard_ultrascale_v1_7_gthe4_common.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/ip_0/sim/mpsoc_qdma_0_0_pcie4_ip_gt_gthe4_common_wrapper.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/ip_0/sim/mpsoc_qdma_0_0_pcie4_ip_gt_gtwizard_gthe4.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/ip_0/sim/mpsoc_qdma_0_0_pcie4_ip_gt_gtwizard_top.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/ip_0/sim/mpsoc_qdma_0_0_pcie4_ip_gt.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_gtwizard_top.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_phy_ff_chain.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_phy_pipeline.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_512b_async_fifo.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_512b_cc_intfc.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_512b_cc_output_mux.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_512b_cq_intfc.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_512b_cq_output_mux.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_512b_intfc_int.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_512b_intfc.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_512b_rc_intfc.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_512b_rc_output_mux.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_512b_rq_intfc.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_512b_rq_output_mux.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_512b_sync_fifo.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_bram_16k_int.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_bram_16k.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_bram_32k.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_bram_4k_int.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_bram_msix.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_bram_rep_int.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_bram_rep.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_bram_tph.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_bram.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_gt_gt_channel.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_gt_gt_common.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_gt_phy_clk.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_gt_phy_rst.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_gt_phy_rxeq.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_gt_phy_txeq.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_sync_cell.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_sync.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_gt_cdr_ctrl_on_eidle.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_gt_receiver_detect_rxterm.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_gt_phy_wrapper.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_init_ctrl.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_pl_eq.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_vf_decode.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_pipe.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_phy_top.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_seqnum_fifo.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_sys_clk_gen_ps.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source/mpsoc_qdma_0_0_pcie4_ip_pcie4_uscale_core_top.v" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/sim/mpsoc_qdma_0_0_pcie4_ip.v" \

vlog -work qdma_v4_0_0  -sv2k12 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/qdma_v4_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/mpsoc_qdma_0_0hdl/verilog/mpsoc_qdma_0_0_core_top.sv" \
"../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/sim/mpsoc_qdma_0_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/mpsoc/ip/mpsoc_system_ila_0_0/bd_0/sim/bd_3194.v" \
"../../../bd/mpsoc/ip/mpsoc_system_ila_0_0/bd_0/ip/ip_0/sim/bd_3194_ila_lib_0.v" \
"../../../bd/mpsoc/ip/mpsoc_system_ila_0_0/sim/mpsoc_system_ila_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/mpsoc/ip/mpsoc_rx_datapath_reset_0/sim/mpsoc_rx_datapath_reset_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/8713/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/ec67/hdl" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/e257/hdl" "+incdir+../../../../doce_nf.gen/sources_1/bd/mpsoc/ip/mpsoc_qdma_0_0_1/ip_0/source" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/a4b7/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/1b7e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/122e/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/b205/hdl/verilog" "+incdir+../../../../doce_nf.srcs/sources_1/bd/mpsoc/ipshared/c968/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/mpsoc/ip/mpsoc_xlconstant_0_0/sim/mpsoc_xlconstant_0_0.v" \
"../../../bd/mpsoc/sim/mpsoc.v" \

vlog -work xil_defaultlib \
"glbl.v"

