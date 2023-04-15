// Design a 4 to 16 decoder with active low enable.

module decoder_4to16_active_low_enable(output [15:0] out,
                     input [3:0] in,
                     input enable);

assign out[14] =  in[3]  &   in[2]  &   in[1]  & (~in[0]) & (~enable);
assign out[13] =  in[3]  &   in[2]  & (~in[1]) &   in[0]  & (~enable);
assign out[12] =  in[3]  &   in[2]  & (~in[1]) & (~in[0]) & (~enable);
assign out[11] =  in[3]  & (~in[2]) &   in[1]  &   in[0]  & (~enable);
assign out[10] =  in[3]  & (~in[2]) &   in[1]  & (~in[0]) & (~enable);
assign out[9] =   in[3]  & (~in[2]) & (~in[1]) &   in[0]  & (~enable);
assign out[8] =   in[3]  & (~in[2]) & (~in[1]) & (~in[0]) & (~enable);
assign out[7] = (~in[3]) &   in[2]  &   in[1]  &   in[0]  & (~enable);
assign out[6] = (~in[3]) &   in[2]  &   in[1]  & (~in[0]) & (~enable);
assign out[5] = (~in[3]) &   in[2]  & (~in[1]) &   in[0]  & (~enable);
assign out[4] = (~in[3]) &   in[2]  & (~in[1]) & (~in[0]) & (~enable);
assign out[3] = (~in[3]) & (~in[2]) &   in[1]  &   in[0]  & (~enable);
assign out[2] = (~in[3]) & (~in[2]) &   in[1]  & (~in[0]) & (~enable);
assign out[1] = (~in[3]) & (~in[2]) & (~in[1]) &   in[0]  & (~enable);
assign out[0] = (~in[3]) & (~in[2]) & (~in[1]) & (~in[0]) & (~enable);
assign out[15] =  in[3]  &   in[2]  &   in[1]  &   in[0]  & (~enable);

endmodule