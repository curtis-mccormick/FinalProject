`timescale 1ns / 1ps
module out_tb();

   integer handle3;
   integer desc3;

   logic clk;
   logic a [63:0];
   logic y [63:0];

   datapath run1(a, y);

   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end

    initial
        begin
                // Gives output file name
            handle3 = $fopen("grid_evolve.out");
                // Tells when to finish simulation
            #500 $finish;		
        end
        
    always 
        begin
            desc3 = handle3;
            #10 desc3 = handle3;
        end

    initial 
        begin
            #0 a = 64'h0412_6424_0034_3C28;
            #15 a = y
        end
endmodule