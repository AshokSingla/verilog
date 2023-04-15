// Design a counter to count the sequence 5,9,4,7,1,0,… and repeat.

// Make a state table and for non listed values assume dont care.
// Then using ffs implement the table.
// Kmaps to be used for minimizing the equations.

module counter(output [3:0] out,
               input clk, reset);

wire [3:0] in;
assign in[0] = ~out[0] | out[2];
assign in[1] = out[2] & ~out[0];
assign in[2] = out[3] | ~out[0];
assign in[3] = out[2]&out[0]&(~out[1]);

d_ff f0(out[0],in[0],clk,reset);
d_ff f1(out[1],in[1],clk,reset);
d_ff f2(out[2],in[2],clk,reset);
d_ff f3(out[3],in[3],clk,reset);

endmodule

module d_ff(output reg out,
            input in, clk, reset);

always @ (posedge reset or negedge clk)
begin
    if (reset)
    out <= 1'b0;
    else
    out <= in;
end

endmodule