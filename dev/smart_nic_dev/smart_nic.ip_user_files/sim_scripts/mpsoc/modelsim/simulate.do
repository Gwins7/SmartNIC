onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xilinx_vip -L xpm -L axis_infrastructure_v1_1_0 -L axis_data_fifo_v2_0_3 -L xil_defaultlib -L xlconstant_v1_1_7 -L gtwizard_ultrascale_v1_7_8 -L cmac_usplus_v3_1_0 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_7 -L zynq_ultra_ps_e_vip_v1_0_7 -L qdma_v4_0_0 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.mpsoc xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {mpsoc.udo}

run -all

quit -force
