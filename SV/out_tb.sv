`timescale 1ns / 1ps
module stimulus ();
   integer handle3;
   integer desc3;
   logic y [63:0];
   datapath run1( 64'h0412_6424_0034_3C28, y );
    initial
        begin
                // Gives output file name
            handle3 = $fopen("grid_evolve.out");
            desc3 = handle3;
                // Tells when to finish simulation
            #500 $finish;		
            $fdisplay(desc3, "%h ", y);
        end
endmodule