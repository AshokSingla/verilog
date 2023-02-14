module priority_encoder_4to2(output [1:0]out, output valid, input [3:0]in);

assign out[1] = in[3] + in[2];
assign out[0] = in[3] | (~in[2]&in[1]);
assign valid = |in;

endmodule



module priority_encoder_dectobin(output [3:0]out, output valid, input [9:0]in);

assign valid = |in;
assign out[3] = in[9] | in[8];
assign out[2] = (~in[9]&(~in[8])) &( in[7] | in[6] | in[5] | in[4]);
assign out[1] = (~in[9]&(~in[8]))&((in[7] | in[6]) | (~in[5]&(~in[4])) &(in[3] | in[2]));
assign out[0] = in[9] | 
                (~in[9]&(~in[8])&(in[7] | 
                (~in[7]&(~in[6])&(in[5] |
                (~in[5]&(~in[4])&(in[3] |
                (~in[3]&(~in[2])&(in[1]))
                ))))));

endmodule
