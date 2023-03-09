module d_ff(out, in, clk, reset);
input in, clk, reset;
output reg out;

always @(posedge clk or negedge reset) begin
    out = reset ? (in):1'b0;
end
endmodule


module universal_shift_register(out, in, in_r, in_l, clk, reset, sel1, sel0);
// sel1, sel0 act as mode changers for the universal shift register
// 00 means memory
// 01 means shift left
// 10 means shift right
// 11 means parallel input
input clk,reset,sel1,sel0, in_r, in_l;
input [3:0]in;
output [3:0]out;

wire [3:0]d;

mux_4to1 m0(d[0],{in[0],in_l,out[0+1],out[0]},sel1,sel0);
mux_4to1 m1(d[1],{in[1],out[0],out[0+1],out[1]},sel1,sel0);
mux_4to1 m2(d[2],{in[2],out[1],out[0+1],out[2]},sel1,sel0);
mux_4to1 m3(d[3],{in[3],out[2],in_r,out[3]},sel1,sel0);

d_ff f3(out[3],d[3],clk,reset);
d_ff f2(out[2],d[2],clk,reset);
d_ff f1(out[1],d[1],clk,reset);
d_ff f0(out[0],d[0],clk,reset);

endmodule


module mux_4to1(q,i,s1,s0);
input s1, s0;
input [3:0]i;
output reg q;

always @(*) begin
    case ({s1,s0})
        2'b00: q = i[0];
        2'b01: q = i[1];
        2'b10: q = i[2];
        2'b11: q = i[3];
    endcase
end
endmodule
