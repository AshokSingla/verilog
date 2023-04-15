// Desgin a 8 to 1 MUX using suitable number of 2 to 1 multiplexers.

module mux_2to1(out, in, sel);
input [1:0] in;
input sel;
output out;
wire selb, t2, t1;

not G1 (selb,sel);
and G2 (t1,in[0],selb);
and G3 (t2,in[1],sel);
or G4 (out,t1,t2);
endmodule

module mux_4to1(out, in, sel);
input [3:0]in;
input [1:0] sel;
output out;

wire [1:0] t;
mux_2to1 m0(t[0],in[1:0],sel[0]);
mux_2to1 m1(t[1],in[3:2],sel[0]);
mux_2to1 m2(out,t[1:0],sel[1]);

endmodule


module mux_8to1(out, in, sel);
input [7:0] in;
input [2:0] sel;
output out;

wire [1:0] to;

mux_4to1 m0(to[0], in[3:0], sel[1:0]);
mux_4to1 m1(to[1], in[7:4], sel[1:0]);
mux_2to1 m2(out, to, sel[2]);

endmodule