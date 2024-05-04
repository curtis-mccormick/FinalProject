// testbench to prove maximal LFSR
module tblf();

    logic [15:0]  seed_in;
    logic [15:0]  seed_out;
    logic         clk;
    logic         lfsr_go;
    
    integer 	    handle3;
    integer 	    desc3;

    lfsr dut(seed_in, clk, lfsr_go, seed_out);

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
	    #0   lfsr_go = 1'b0;	
	    #0   seed_in = 64'h0000_00e0;
	    #20  lfsr_go = 1'b1;
      end
	     
    always @(posedge clk)
      begin
        $fdisplay(desc3, "%h || %h || %b", seed_in, seed_out, (seed_in==seed_out));
      end
  
endmodule // tb
