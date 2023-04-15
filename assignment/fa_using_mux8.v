// Design a full-adder using suitable multiplexer.

/*
Truth Table
a,b,bin:sum,carry
0,0,0  : 0 , 0
0,0,1  : 1 , 0
0,1,0  : 1 , 0
0,1,1  : 0 , 1
1,0,0  : 1 , 0
1,0,1  : 0 , 1
1,1,0  : 0 , 1
1,1,1  : 1 , 1

*/
module mux_8(output out,
             input [7:0] in,
             input [2:0] sel);

assign out = in[sel];
endmodule

module fulladder(output sum, carry,
                 input a,b,cin);

mux_8 m0(sum, {1'b0,1'b1,1'b1,1'b0,1'b1,1'b0,1'b0,1'b1}, {a,b,cin});
mux_8 m1(carry, {1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b1,1'b1}, {a,b,cin});

endmodule