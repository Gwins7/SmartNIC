onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib axis_data_fifo_1_opt

do {wave.do}

view wave
view structure
view signals

do {axis_data_fifo_1.udo}

run -all

quit -force
