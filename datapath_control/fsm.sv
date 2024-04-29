module fsm (input logic clk, reset, input logic [63:0] in, output logic [63:0] out);

   typedef enum logic {S0, S1} statetype;
   statetype state, nextstate;
   
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
    
   always_comb
     case (state)
       S0: begin
            out <= in;  
            if (reset) nextstate <= S0;
            else nextstate <= S1;
           end
       S1: begin
            lfsr64 cycle(in, clk, reset, out);
            nextstate <= S0;
           end
       default: begin
            out <= in;    
            nextstate <= S0;
           end
     endcase
   
endmodule