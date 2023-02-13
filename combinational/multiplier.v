`include "adder.v"

module multiplier_2x2 (output [3:0] out , input [1:0] a,b);

//                     a[1] a[0]
//                     b[1] b[0]
// -------------------------------
//            a[1]b[0]   a[0]b[0]
// a[1]b[1]   a[0]b[1]   X
// -------------------------------

wire tc;
assign out[0] = a[0]&b[0];
halfadder h1(out[1],tc, (a[1]&b[0]) , (a[0]&b[1]) );
halfadder h2(out[2],out[3], (a[1]&b[1]) , tc);

endmodule





module multiplier_3x2 (output [4:0] out, input [2:0] a, input [1:0] b);
wire c1,c2;
assign out[0] = a[0]&b[0];
halfadder h1(out[1],c1, (a[1]&b[0]), (a[0]&b[1]));
fulladder h2(out[2],c2, (a[2]&b[0]), (a[1]&b[1]), c1);
halfadder h3(out[3],out[4], (a[2]&b[1]), c2);

endmodule