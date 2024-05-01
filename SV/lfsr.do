onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog lfsr.sv lfsr_tb.sv

# start and run simulation
vsim -voptargs=+acc work.tblf

view list
view wave

-- display input and output signals as hexidecimal values
# Diplays All Signals recursively
add wave -hex -r /tblf/*add wave -noupdate -divider -height 32 "Testbench"
add wave -hex /tblf/*
add wave -noupdate -divider -height 32 "FSM"
add wave -hex /tblf/yachty/*
add wave -noupdate -divider -height 32 "datapath"
add wave -hex /tblf/dut/*
add wave -noupdate -divider -height 32 "flopr"
add wave -hex /tblf/dut/hold/*

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