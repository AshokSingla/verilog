// Design a 32 to 1 MUX with active high enable.

// 32 inputs means we have 5 input select lines.
// Direct assignment can be done but here we will go with hierarchy flow/ mux tree formation.
// The direct assignment one can be seen in the file named mux_32_direct.v

module mux_32to1(out, in ,sel, enable);
output out;
input [31:0] in;
input [4:0] sel;
input enable;

wire [1:0]temp_out;

mux_16 m0(temp_out[0], in[15:0], sel[3:0], enable);
mux_16 m1(temp_out[1], in[31:16], sel[3:0], enable);

mux_2 m2(out, temp_out[1:0], sel[4],enable);

endmodule

module mux_16(out,in,sel,enable);
input [15:0] in;
input [3:0] sel;
input enable;
output out;

wire [3:0]t;
mux_4 m3(t[3],in[15:12], sel[1:0],enable);
mux_4 m2(t[2],in[11:8], sel[1:0],enable);
mux_4 m1(t[1],in[7:4], sel[1:0],enable);
mux_4 m0(t[0],in[3:0], sel[1:0],enable);
mux_4 m4(out,t[3:0], sel[3:2],enable);

endmodule

module mux_4(out, in, sel,enable);
input [3:0]in;
input [1:0] sel;
input enable;
output out;

wire [1:0] t;
mux_2 m0(t[0],in[1:0],sel[0],enable);
mux_2 m1(t[1],in[3:2],sel[0],enable);
mux_2 m2(out,t[1:0],sel[1],enable);

endmodule

module mux_2 (out, in, sel,enable);
input [1:0] in;
input sel;
input enable;
output out;
wire selb, t2, t1;

not G1 (selb,sel);
and G2 (t1,in[0],selb,enable);
and G3 (t2,in[1],sel,enable);
or G4 (out,t1,t2);
endmodule