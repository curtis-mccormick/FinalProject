// testbench to prove maximal LFSR
module tblf();

    logic [63:0]  seed_in;
    logic [63:0]  seed_out;
    logic         clk;
    logic         reset;
    logic [999:0] cycles;
    
    integer 	    handle3;
    integer 	    desc3;

    lfsr64 dut(seed_in, clk, reset, seed_out);

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
	    #0   seed_in = 8'h7A;
	    #20  reset = 1'b0;
      end
	     
    always @(posedge clk)
      begin
        $fdisplay(desc3, "%h || %h || %b", seed_in, seed_out, (seed_in==seed_out));
      end
    always @(negedge clk) begin
      if (reset)
        cycles = 0;
      else begin
            cycles = cycles + 1; 
            if (cycles == 1) begin
            end
            else begin
              if (seed_out == seed_in) begin 
                $fdisplay(desc3, "%h || %h || %b", 
		            seed_in, seed_out, (seed_in==seed_out));
                $fdisplay(desc3, "\nFound the repeat at cycle = %d\n", cycles);
                $finish;
              end
            end
      end
    end
   
endmodule // tb

