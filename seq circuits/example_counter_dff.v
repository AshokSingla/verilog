// counter will go 0 -> 3 -> 5 -> 6 -> 0

module d_ff(q,in,clk,reset);
input in,clk,reset;
output reg q;

always @(posedge clk or negedge reset)
begin
if (!reset)
q <= 1'b0;
else
q <= in;
end
endmodule


module counter_eg(out,clk,reset);
input clk,reset;
output [2:0] out;

wire d2 = out[0];
wire d1 = ~out[1];
wire d0 = ~out[2];

d_ff f2(out[2],d2,clk,reset);
d_ff f1(out[1],d1,clk,reset);
d_ff f0(out[0],d0,clk,reset);

endmodule