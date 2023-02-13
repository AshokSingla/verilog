module fulladder (output out, carry, input a,b,c);
assign out = a^b^c;
assign carry = (a&b)|(b&c)|(a&c);
endmodule



module ripple_carry_adder (output [3:0]out, output carry, input [3:0] a, b, input c);
wire c1,c2,c3;

fulladder f1(out[0],c1,a[0],b[0],c);
fulladder f2(out[1],c2,a[1],b[1],c1);
fulladder f3(out[2],c3,a[2],b[2],c2);
fulladder f4(out[3],carry,a[3],b[3],c3);

endmodule



module carry_lookahead_adder (output [3:0]out, output carry, input [3:0] a, b, input c);
wire p0,p1,p2,p3;
wire g0,g1,g2,g3;
wire c1,c2,c3;

// c = g +p.ci

assign g0 = a[0]&b[0];
assign g1 = a[1]&b[1];
assign g2 = a[2]&b[2];
assign g3 = a[3]&b[3];

assign p0 = a[0]^b[0];
assign p1 = a[1]^b[1];
assign p2 = a[2]^b[2];
assign p3 = a[3]^b[3];

// assign c1 = g0|(p0&c);
// assign c2 = g1|(p1&(g0|(p0&c)));
// assign c3 = g2|(p2&(g1|(p1&(g0|(p0&c)))));

// assign carry = g3|(p3&(g2|(p2&(g1|(p1&(g0|(p0&c)))))));

assign carry = g3 | p3&g2 | p3&p2&g1 | p3&p2&p1&g0 | p3&p2&p1&p0&c;

// assign out[0] = p0^c;
// assign out[1] = p1^(g0|(p0&c));
// assign out[2] = p2^(g1|(p1&(g0|(p0&c))));
// assign out[3] = p3^(g2|(p2&(g1|(p1&(g0|(p0&c))))));

assign out[0] = p0^c;
assign out[1] = (p1^g0) | (p1^(p0&c));
assign out[2] = (p2^g1) | (p2^(p1&g0)) | (p2^(p1&p0&c));
assign out[3] = (p3^g2) | (p3^(p2&g1)) | (p3^(p2&p1&g0)) | (p3^(p2&p1&p0&c));

endmodule