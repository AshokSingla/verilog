module alu(z,x,y, sign, zero, parity, carry, overflow);
input [15:0] x,y;
output [15:0] z;
output sign, carry, overflow, zero, parity;

// assign {carry,z} = x+y; // generates carry if present
wire [3:1] c;
adder_4 A0(z[3:0],c[1],x[3:0],y[3:0],1'b0);
adder_4 A1(z[7:4],c[2],x[7:4],y[7:4],c[1]);
adder_4 A2(z[11:8],c[3],x[11:8],y[11:8],c[2]);
adder_4 A3(z[15:12],carry,x[15:12],y[15:12],c[3]);

assign parity = ~^z;    // assuming odd parity, for even parity, take xor in place of xnor
assign sign = z[15];    // msb is sign bit
assign zero = ~|z;      // if any bit is 1, means the value is non zero meaning the zero value must be 0
assign overflow = (x[15] & y[15] & ~z[15]) | (~x[15] & ~y[15] & z[15]);

endmodule


// module adder_4 (sum,carry, x,y,cin);
// input [3:0]x,y;
// input cin;
// output [3:0] sum;
// output carry;

// // assign {carry,sum} = x+y+cin;
// wire [2:0]c;
// fulladder f0 (sum[0],c[0],x[0],y[0],cin);
// fulladder f1 (sum[1],c[1],x[1],y[1],c[0]);
// fulladder f2 (sum[2],c[2],x[2],y[2],c[1]);
// fulladder f3 (sum[3],carry,x[3],y[3],c[2]);

// endmodule

module adder_4(sum,carry,x,y,cin);
input [3:0]x,y;
input cin;
output [3:0] sum;
output carry;

wire [3:0]g,p;

assign g[0] = x[0]&y[0];
assign g[1] = x[1]&y[1];
assign g[2] = x[2]&y[2];
assign g[3] = x[3]&y[3];

assign p[0] = x[0]^y[0];
assign p[1] = x[1]^y[1];
assign p[2] = x[2]^y[2];
assign p[3] = x[3]^y[3];

wire [3:1]c;
assign c[1] = g[0] | p[0]&cin;
assign c[2] = g[1] | p[1]&g[0] | p[1]&p[0]&cin;
assign c[3] = g[2] | p[2]&g[1] | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&cin;
assign carry = g[3] | p[3]&g[2] | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&cin;

assign sum[0] = p[0]^cin;
assign sum[1] = p[1]^c[1];
assign sum[2] = p[2]^c[2];
assign sum[3] = p[3]^c[3];

endmodule


module fulladder(sum,carry,x,y,cin);
input x,y,cin;
output sum, carry;

wire tsum, tc1, tc2;
xor x1(tsum,x,y);
xor x2(sum,tsum,cin);
and a1(tc1,x,y);
and a2(tc2,tsum,cin);
or o1(carry,tc1,tc2);
endmodule


// module fulladder(sum,carry,x,y,cin);
// input x,y,cin;
// output sum,carry;

// assign {carry,sum} = x+y+cin;

// endmodule