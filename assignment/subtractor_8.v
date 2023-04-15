// Design a 8-bit ripple carry subtractor circuit.

module half_subtractor(output difference, borrow,
                       input a, b);

assign difference = a^b;
assign borrow = ~a & b;
endmodule

module full_subtractor(output difference, borrow,
                       input a, b, bin);

wire t_diff;
wire [1:0]t_borrow;

half_subtractor S1(t_diff, t_borrow[0], a, b);
half_subtractor S2(difference, t_borrow[1], t_diff, bin);

or (borrow, t_borrow[0], t_borrow[1]);

endmodule

module subtrator_8(output [7:0] difference,
                   output borrow,
                   input [7:0] a, b, 
                   input b_in);

wire [6:0] t_b;

full_subtractor s0(difference[0],t_b[0],a[0],b[0],b_in);
full_subtractor s1(difference[1],t_b[1],a[1],b[1],t_b[0]);
full_subtractor s2(difference[2],t_b[2],a[2],b[2],t_b[1]);
full_subtractor s3(difference[3],t_b[3],a[3],b[3],t_b[2]);
full_subtractor s4(difference[4],t_b[4],a[4],b[4],t_b[3]);
full_subtractor s5(difference[5],t_b[5],a[5],b[5],t_b[4]);
full_subtractor s6(difference[6],t_b[6],a[6],b[6],t_b[5]);
full_subtractor s7(difference[7],borrow,a[7],b[7],t_b[6]);

endmodule