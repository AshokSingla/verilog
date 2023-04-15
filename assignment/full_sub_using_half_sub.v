// Desgin a full subtractor using two half subtractors and OR gate.

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