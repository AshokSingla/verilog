module odd_parity_gen(output [4:0]out, input [3:0]in);

assign out[3:0] = in;
assign out[4] = ~^in;

endmodule



module even_parity_gen(output [4:0]out, input [3:0]in);

assign out[3:0] = in;
assign out[4] = ^in;

endmodule



module odd_parity_check(output out, input [4:0]in);

assign out = ^in;

endmodule



module even_parity_check(output out, input [4:0]in);

assign out = ~^in;

endmodule