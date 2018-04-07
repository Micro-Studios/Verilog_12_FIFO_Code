onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+fifo_test -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L fifo_generator_v13_1_0 -O5 xil_defaultlib.fifo_test xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {fifo_test.udo}

run -all

endsim

quit -force
