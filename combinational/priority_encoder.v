module priority_encoder(output [1:0]out, output valid, input [3:0]in);

assign out[1] = in[3] + in[2];
assign out[0] = in[3] | (~in[2]&in[1]);
assign valid = |in;

endmodule