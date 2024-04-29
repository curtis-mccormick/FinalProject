module top (input logic  [63:0] C_seed, 
	         input logic         clk, reset,
	         output logic [63:0] N_seed);

   logic [63:0] 		       dpIn;
   logic [63:0] 		       dpOut;

   assign dpIn = reset ? C_seed : N_seed;
   datapath nextphase(dpIn, dpOut);
   flop hold(clk, dpOut, N_seed);
   

endmodule // top

