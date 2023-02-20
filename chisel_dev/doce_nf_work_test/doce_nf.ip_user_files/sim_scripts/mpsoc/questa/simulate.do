onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib mpsoc_opt

do {wave.do}

view wave
view structure
view signals

do {mpsoc.udo}

run -all

quit -force
