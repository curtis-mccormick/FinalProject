module lfsr(input logic [15:0] seed, input logic clk, reset, output logic [15:0] shift_seed);

always_ff @(posedge clk or posedge reset) begin
    if (reset) shift_seed = seed;
    else shift_seed = {shift_seed[14:0], shift_seed[15] ~^ shift_seed[14] ~^ shift_seed[12] ~^ shift_seed[3]};
end

endmodule

module lfsr64 (input logic [63:0] seed, input logic clk, lfsr_go, output logic [63:0] shift_seed);

always_ff @(posedge clk or posedge lfsr_go) begin
    if(lfsr_go) shift_seed = {shift_seed[62:0], shift_seed[63] ~^ shift_seed[62] ~^ shift_seed[60] ~^ shift_seed[59]};
    else shift_seed = seed;
end
 
endmodule