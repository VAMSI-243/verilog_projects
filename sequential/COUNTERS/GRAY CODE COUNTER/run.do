vlib work
vlog gray.v
vlog tb.v
vsim tb
add wave *
force -freeze sim:/tb/dut/dut2/Q 0
force -freeze sim:/tb/dut/dut1/Q 0
force -freeze sim:/tb/dut/dut0/Q 0
run 10 ns
noforce sim:/tb/dut/dut2/Q
noforce sim:/tb/dut/dut1/Q
noforce sim:/tb/dut/dut0/Q
run -all
