module RunIt(input logic clk, reset, enable input logic [63:0] seed_in, output logic [63:0] seed_out);

    logic go, restart;
    logic [63:0] random;

    fsm dut(clk, reset, enable, go, restart);

    if(go) lfsr64 dut1(seed_in, clk, reset, random);
    else   lfsr64 dut2(seed_in, clk, reset, seed_out);

    GameOfLife dut3(clk, reset, enable, random, seed_out);

endmodule