// Design a full-subtractor using suitable multiplexer.

/*
Truth Table
a,b,bin:diff,borrow
0,0,0  : 0  , 0
0,0,1  : 1  , 1
0,1,0  : 1  , 1
0,1,1  : 0  , 1
1,0,0  : 1  , 0
1,0,1  : 0  , 0
1,1,0  : 0  , 0
1,1,1  : 1  , 1

*/
module mux_8(output out,
             input [7:0] in,
             input [2:0] sel);

assign out = in[sel];
endmodule

module full_subtractor(output difference, borrow,
                       input a, b, bin);

mux_8 m0(difference,{1'b0,1'b1,1'b1,1'b0,1'b1,1'b0,1'b0,1'b1},{a,b,bin});
mux_8 m1(borrow,{1'b0,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b1},{a,b,bin});

endmodule