// Design a 8-bit carry lookahead adder.

module carry_lookahead_adder_8 (output [7:0]out, output carry, input [7:0] a, b, input c);
wire p0,p1,p2,p3,p4,p5,p6,p7;
wire g0,g1,g2,g3,g4,g5,g6,g7;
wire c1,c2,c3,c4,c5,c6,c7;

// c = g +p.ci

assign g0 = a[0]&b[0];
assign g1 = a[1]&b[1];
assign g2 = a[2]&b[2];
assign g3 = a[3]&b[3];
assign g4 = a[4]&b[4];
assign g5 = a[5]&b[5];
assign g6 = a[6]&b[6];
assign g7 = a[7]&b[7];

assign p0 = a[0]^b[0];
assign p1 = a[1]^b[1];
assign p2 = a[2]^b[2];
assign p3 = a[3]^b[3];
assign p4 = a[4]^b[4];
assign p5 = a[5]^b[5];
assign p6 = a[6]^b[6];
assign p7 = a[7]^b[7];

// assign c1 = g0|(p0&c);
// assign c2 = g1|(p1&(g0|(p0&c)));
// assign c3 = g2|(p2&(g1|(p1&(g0|(p0&c)))));
// ...

// assign out[0] = p0^c;
// assign out[1] = p1^(g0|(p0&c));
// assign out[2] = p2^(g1|(p1&(g0|(p0&c))));
// assign out[3] = p3^(g2|(p2&(g1|(p1&(g0|(p0&c))))));
// ....

assign out[0] = p0^c;
assign out[1] = (p1^g0) | (p1^(p0&c));
assign out[2] = (p2^g1) | (p2^(p1&g0)) | (p2^(p1&p0&c));
assign out[3] = (p3^g2) | (p3^(p2&g1)) | (p3^(p2&p1&g0)) | (p3^(p2&p1&p0&c));
assign out[4] = (p4^g3) | (p4^(p3&g2)) | (p4^(p3&p2&g1)) | (p4^(p3&p2&p1&g0)) | (p4^(p3&p2&p1&p0&c));
assign out[5] = (p5^g4) | (p5^(p4&g3)) | (p5^(p4&p3&g2)) | (p5^(p4&p3&p2&g1)) | (p5^(p4&p3&p2&p1&g0)) | (p5^(p4&p3&p2&p1&p0&c));
assign out[6] = (p6^g5) | (p6^(p5&g4)) | (p6^(p5&p4&g3)) | (p6^(p5&p4&p3&g2)) | (p6^(p5&p4&p3&p2&g1)) | (p6^(p5&p4&p3&p2&p1&g0)) | (p6^(p5&p4&p3&p2&p1&p0&c));
assign out[7] = (p7^g6) | (p7^(p6&g5)) | (p7^(p6&p5&g4)) | (p7^(p6&p5&p4&g3)) | (p7^(p6&p5&p4&p3&g2)) | (p7^(p6&p5&p4&p3&p2&g1)) | (p7^(p6&p5&p4&p3&p2&p1&g0)) | (p7^(p6&p5&p4&p3&p2&p1&p0&c));

assign carry = g7 | p7&g6 | p7&p6&g5 | p7&p6&p5&g4 | p7&p6&p5&p4&g3 | p7&p6&p5&p4&p3&g2 | p7&p6&p5&p4&p3&p2&g1 | p7&p6&p5&p4&p3&p2&p1&p0&c;

endmodule