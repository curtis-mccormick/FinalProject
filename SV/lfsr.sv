module lfsr(input logic [15:0] seed, input logic clk, reset, output logic shift_seed);
//inputs and outputs for a smaller implementation
//perhaps 8 or 16 bits
    shift_seed = seed[15] ~^ seed[14] ~^ seed[12] ~^ seed[3];
//your implementation of the LFSR.  Remember that this 
//implementation has memory so it should be done 
//with some form of a flip-flop based register

endmodule

module lfsr64 (input logic [63:0] seed, input logic clk, reset, output logic [63:0] shift_seed);
//inputs and outputs for the full seed size (64 bits)
    logic [15:0] back;
    lfsr last(seed[63:47], clk, reset, back);
    shift_seed = {seed[62:0], back};
//either build a 64 bit version using your smaller implementation above
//or use the same methods from the xilinx document to build a full
//64 bit version

endmodule