// Design a 1 to 32 DEMUX with active low enable.

module demux_1to32(output [31:0] out,
                   input [4:0] s,
                   input enable);
assign out[31] =   s[4]  &   s[3]  &   s[2]  &   s[1]  &   s[0]  & (~enable);
assign out[30] =   s[4]  &   s[3]  &   s[2]  &   s[1]  & (~s[0]) & (~enable);
assign out[29] =   s[4]  &   s[3]  &   s[2]  & (~s[1]) &   s[0]  & (~enable);
assign out[28] =   s[4]  &   s[3]  &   s[2]  & (~s[1]) & (~s[0]) & (~enable);
assign out[27] =   s[4]  &   s[3]  & (~s[2]) &   s[1]  &   s[0]  & (~enable);
assign out[26] =   s[4]  &   s[3]  & (~s[2]) &   s[1]  & (~s[0]) & (~enable);
assign out[25] =   s[4]  &   s[3]  & (~s[2]) & (~s[1]) &   s[0]  & (~enable);
assign out[24] =   s[4]  &   s[3]  & (~s[2]) & (~s[1]) & (~s[0]) & (~enable);
assign out[23] =   s[4]  & (~s[3]) &   s[2]  &   s[1]  &   s[0]  & (~enable);
assign out[22] =   s[4]  & (~s[3]) &   s[2]  &   s[1]  & (~s[0]) & (~enable);
assign out[21] =   s[4]  & (~s[3]) &   s[2]  & (~s[1]) &   s[0]  & (~enable);
assign out[20] =   s[4]  & (~s[3]) &   s[2]  & (~s[1]) & (~s[0]) & (~enable);
assign out[19] =   s[4]  & (~s[3]) & (~s[2]) &   s[1]  &   s[0]  & (~enable);
assign out[18] =   s[4]  & (~s[3]) & (~s[2]) &   s[1]  & (~s[0]) & (~enable);
assign out[17] =   s[4]  & (~s[3]) & (~s[2]) & (~s[1]) &   s[0]  & (~enable);
assign out[16] =   s[4]  & (~s[3]) & (~s[2]) & (~s[1]) & (~s[0]) & (~enable);
assign out[15] = (~s[4]) &   s[3]  &   s[2]  &   s[1]  &   s[0]  & (~enable);
assign out[14] = (~s[4]) &   s[3]  &   s[2]  &   s[1]  & (~s[0]) & (~enable);
assign out[13] = (~s[4]) &   s[3]  &   s[2]  & (~s[1]) &   s[0]  & (~enable);
assign out[12] = (~s[4]) &   s[3]  &   s[2]  & (~s[1]) & (~s[0]) & (~enable);
assign out[11] = (~s[4]) &   s[3]  & (~s[2]) &   s[1]  &   s[0]  & (~enable);
assign out[10] = (~s[4]) &   s[3]  & (~s[2]) &   s[1]  & (~s[0]) & (~enable);
assign out[9] =  (~s[4]) &   s[3]  & (~s[2]) & (~s[1]) &   s[0]  & (~enable);
assign out[8] =  (~s[4]) &   s[3]  & (~s[2]) & (~s[1]) & (~s[0]) & (~enable);
assign out[7] =  (~s[4]) & (~s[3]) &   s[2]  &   s[1]  &   s[0]  & (~enable);
assign out[6] =  (~s[4]) & (~s[3]) &   s[2]  &   s[1]  & (~s[0]) & (~enable);
assign out[5] =  (~s[4]) & (~s[3]) &   s[2]  & (~s[1]) &   s[0]  & (~enable);
assign out[4] =  (~s[4]) & (~s[3]) &   s[2]  & (~s[1]) & (~s[0]) & (~enable);
assign out[3] =  (~s[4]) & (~s[3]) & (~s[2]) &   s[1]  &   s[0]  & (~enable);
assign out[2] =  (~s[4]) & (~s[3]) & (~s[2]) &   s[1]  & (~s[0]) & (~enable);
assign out[1] =  (~s[4]) & (~s[3]) & (~s[2]) & (~s[1]) &   s[0]  & (~enable);
assign out[0] =  (~s[4]) & (~s[3]) & (~s[2]) & (~s[1]) & (~s[0]) & (~enable);

endmodule