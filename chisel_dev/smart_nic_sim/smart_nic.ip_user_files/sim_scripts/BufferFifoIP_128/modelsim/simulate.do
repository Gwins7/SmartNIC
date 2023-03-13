onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xpm -L axis_infrastructure_v1_1_0 -L axis_data_fifo_v2_0_3 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.BufferFifoIP_128 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {BufferFifoIP_128.udo}

run -all

quit -force
