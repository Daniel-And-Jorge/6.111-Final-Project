onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+xadc_wiz_0 -L secureip -L xil_defaultlib -O5 xil_defaultlib.xadc_wiz_0

do {wave.do}

view wave
view structure
view signals

do {xadc_wiz_0.udo}

run -all

endsim

quit -force
