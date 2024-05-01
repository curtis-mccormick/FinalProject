module lfsr(input logic [15:0] seed, input logic clk, reset, output logic shift_seed);

always_ff @(posedge clk or posedge reset) begin
    shift_seed = {seed[14:0], seed[15] ~^ seed[14] ~^ seed[12] ~^ seed[3]};
end

endmodule

module lfsr64 (input logic [63:0] seed, input logic clk, reset, output logic [63:0] shift_seed);

always_ff @(posedge clk or posedge reset) begin
    shift_seed = {seed[62:0], seed[63] ~^ seed[62] ~^ seed[60] ~^ seed[59]};
end

endmodule