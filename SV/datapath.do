onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog datapath.sv flop.sv flopen.sv flopenl.sv flopenr.sv flopenrc.sv flopens.sv flopr.sv floprc.sv lfsr_tb.sv lfsr.sv mux.sv ourfunction.sv out_tb.sv 

# start and run simulation
vsim -voptargs=+acc work.out_tb

view list
view wave

-- display input and output signals as hexidecimal values
# Diplays All Signals recursively
# add wave -hex -r /out_tb/*

-- Run the Simulation
run 200 ns