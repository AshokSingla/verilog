module binary_to_gray (output [3:0]out, input [3:0]in);

assign out[3] = in[3];
assign out[2] = in[3]^in[2];
assign out[1] = in[2]^in[1];
assign out[0] = in[1]^in[0];

endmodule




module gray_to_binary (output [3:0]out, input [3:0]in);

assign out[3] = in[3];
assign out[2] = in[3]^in[2];
assign out[1] = in[3]^in[2]^in[1];
assign out[1] = in[3]^in[2]^in[1]^in[0];

endmodule