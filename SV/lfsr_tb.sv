// testbench to prove maximal LFSR
module tblf();

    logic [63:0]  seed_in;
    logic [63:0]  seed_out;
    logic         clk;
    logic         reset;
    
    integer 	    handle3;
    integer 	    desc3;

    lfsr dut(seed_in, clk, reset, seed_out);

    always     
      begin
	      clk = 1; #1; clk = 0; #1;
      end
     
    initial
      begin
	       handle3 = $fopen("lfsr.out");	
	       desc3 = handle3;
    end
    
    initial
      begin
	    #0   reset = 1'b1;	
	    #0   seed_in = 64'h0100;
	    #20  reset = 1'b0;
      end
	     
    always @(posedge clk)
      begin
        $fdisplay(desc3, "%h || %h || %b", seed_in, seed_out, (seed_in==seed_out));
      end
  
endmodule // tb
