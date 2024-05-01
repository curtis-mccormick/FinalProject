module GameOfLife(input logic clk, reset, enable, input logic [63:0] seed_in, output logic [63:0] seed_out);

    logic go, restart;
    logic [63:0] game_in, game_out;

    fsm dut(clk, reset, enable, go, restart);

    datapath dut1(game_in, game_out);

    flopr #(64) dut2(clk, restart, seed_in, game_out, game_in);

    mux2 #(64) du3(seed_in, game_in, go, seed_out);

endmodule

module fsm(input logic clk, reset, enable, output logic go, restart);

    typedef enum logic [3:0] {S0, S1} statetype;
    statetype state, nextstate;
   
    always_ff @(posedge clk, posedge reset)
       if (reset) state <= S0;
       else       state <= nextstate;

    always_comb
    case(state)
        S0:begin
	        go = 1'b0;
            restart = 1'b1;
            if(enable) begin
                nextstate <= S1;
            end else begin
                nextstate <= S0;
            end
            
        end
        S1:begin
            go = 1'b1;
            restart = 1'b0;
            if(reset) begin
                nextstate <= S0;
            end else begin
                nextstate <= S1;
            end
        end
    endcase

endmodule