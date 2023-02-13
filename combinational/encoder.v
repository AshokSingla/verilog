module encoder_2to1 (
    output out, input [1:0]in
);

assign out = in[1];   // priority to in[1] over in[0]

endmodule






module encoder_4to2 (output [1:0]out, input [3:0]in);

assign out[1] = in[3] | in[2];
assign out[0] = in[3] | in[1];

endmodule


// module encoder_4to2 (
//     output [1:0]out, output valid, input [3:0]in
// );

// wire [1:0]o, v;
// encoder_2to1 e0(o[0], v[0], in[1:0]);
// encoder_2to1 e1(o[1], v[1], in[3:2]);
// assign valid = v[1]|v[0];
// assign t = (v[1])?o[1]:o[0];
// assign o = {v[1],t};
    
// endmodule




module encoder_8to3 (output [2:0]out, input [7:0]in);

assign out[2] = |in[7:4];  // in[7] | in[6] | in[5] | in[4];
assign out[1] = in[7] | in[6] | in[3] | in[2];
assign out[0] = in[7] | in[5] | in[3] | in[1];

endmodule



module decimal_to_binary (output [3:0]out, input[9:0]in);

assign out[3] = in[8] | in[9];
assign out[2] = in[7] | in[6] | in[5] | in[4];
assign out[1] = in[7] | in[6] | in[3] | in[2];
assign out[0] = in[9] | in[7] | in[5] | in[3] | in[1];

endmodule