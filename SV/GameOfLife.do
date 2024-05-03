onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog GameOfLife.sv GameOfLife_tb.sv flopr.sv mux.sv datapath.sv lfsr.sv

# start and run simulation
vsim -voptargs=+acc work.tb

view list
view wave

-- display input and output signals as hexidecimal values
# Diplays All Signals recursively
add wave -hex -r /tb/*
add wave -hex /tb/dut/*
add wave -hex /tb/dut/dut/*
add wave -hex /tb/dut/dut1/*
add wave -hex /tb/dut/dut2/*
add wave -hex /tb/dut/dut3/*
add wave -hex /tb/dut/dut4/*

-- Set Wave Output Items 
TreeUpdate [SetDefaultTree]
WaveRestoreZoom {0 ps} {75 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2

-- Run the Simulation
run 250 ns