`timescale 1ns / 1ps
module tbf ();
 
    logic [63:0] seed_in;
    logic [63:0] seed_out;
    logic        clk;
    logic        reset;
    logic        enable;
    logic [63:0] random;
    
    integer 	   handle3;
    integer 	   desc3;
    
    RunIt dut(clk, reset, enable, seed_in, seed_out, random);

 
    initial 
      begin	
 	    clk = 1'b1;
 	    forever #10 clk = ~clk;
      end
 
    initial
      begin
 	      #0  reset = 1'b1;
 	      #0  seed_in = 64'h0000_00e0_0000_0000;
          #50 reset = 1'b0;
          #0  enable = 1'b1;
      end
      
    initial
      begin
	       handle3 = $fopen("GOL.out");	
	       desc3 = handle3;
      end
    
    always @(posedge clk)
      begin
        $fdisplay(desc3, "%b\n%b\n%b\n%b\n%b\n%b\n%b\n%b\n\n",
        random[7:0], random[15:8], random[23:16], random[31:24],
        random[39:32], random[47:40], random[55:48], random[63:56]);
      end
   
endmodule