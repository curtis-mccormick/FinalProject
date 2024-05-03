module GameOfLife(input logic clk, reset, enable, random, input logic [63:0] seed_in, output logic [63:0] seed_out);

    logic go, lfsr_go;
    logic [63:0] game_in, game_out, new_seed_in, random_seed; 

    fsm dut(clk, reset, enable, random, go, lfsr_go);

    lfsr64 dut4(seed_in, clk, lfsr_go, random_seed);

    mux2 #(64) dut3(new_seed_in,random_seed, go, seed_out);

    datapath dut1(seed_out, game_out);

    flopr #(64) dut2(clk, reset, enable, seed_out, game_out, new_seed_in);

endmodule

module fsm(input logic clk, reset, enable, randomizer, output logic go, lfsr_go);

    typedef enum logic [3:0] {S0, S1, S2} statetype;
    statetype state, nextstate;
   
    always_ff @(posedge clk, posedge reset)
       if (reset) state <= S0;
       else       state <= nextstate;

    always_comb
    case(state)
        S0:begin //idle
	        go = 1'b1;
            lfsr_go = 1'b0;
            if(randomizer) begin
                nextstate <= S1;
            end else if(enable) begin
                nextstate <= S2;
            end else begin
                nextstate <= S0;
            end
        end
        S1:begin //random
            go = 1'b1;
            lfsr_go = 1'b1;
            if(reset) begin
                nextstate <= S0;
            end else if(enable) begin
                nextstate <= S2;
            end else begin
                nextstate <= S1;
            end
        end
        S2:begin //play
            go = 1'b0;
            if(~enable)
            nextstate <= S0;
            else nextstate <= S2;
        end
        
    endcase

endmodule