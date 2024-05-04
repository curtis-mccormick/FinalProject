`timescale 1ns / 1ps
module tb ();
 
    logic [63:0] seed_in;
    logic [63:0] seed_out;
    logic        clk;
    logic        reset;
    logic        enable;
    logic        random;
    
    integer 	   handle3;
    integer 	   desc3;
    
    GameOfLife dut(clk, reset, enable, random, seed_in, seed_out);

 
    initial 
      begin	
 	    clk = 1'b1;
 	    forever #10 clk = ~clk;
      end
 
    initial
      begin
        #0  seed_in = 64'h0c00_00e0_0a00_0600;
        #0  random = 1'b0;
        #0  enable = 1'b0;
 	      #0  reset = 1'b1;

        #20 reset = 1'b0;
        #0 enable = 1'b1;

        #100 enable = 1'b0;

      end
      
    initial
      begin
	       handle3 = $fopen("GOL.out");	
	       desc3 = handle3;
      end
    
    always @(posedge clk)
      begin
        $fdisplay(desc3, "%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n\n",
        seed_out[7:0], seed_out[15:8], seed_out[23:16], seed_out[31:24],
        seed_out[39:32], seed_out[47:40], seed_out[55:48], seed_out[63:56]);
      end
   
endmodule