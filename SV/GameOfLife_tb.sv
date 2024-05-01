`timescale 1ns / 1ps
module tb ();
 
    logic [63:0] seed_in;
    logic [63:0] seed_out;
    logic        clk;
    logic        reset;
    logic        enable;
    
    GameOfLife dut(clk, reset, enable, seed_in, seed_out);
 
    initial 
      begin	
 	    clk = 1'b1;
 	    forever #10 clk = ~clk;
      end
 
    initial
      begin
 	    #0  reset = 1'b1;
 	    #0  seed_in = 64'h0412_6424_0034_3C28;
        #20 reset = 1'b0;
        #20 enable = 1'b1;
      end

   
endmodule