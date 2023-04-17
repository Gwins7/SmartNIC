onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib BufferFifoIP_128_opt

do {wave.do}

view wave
view structure
view signals

do {BufferFifoIP_128.udo}

run -all

quit -force
