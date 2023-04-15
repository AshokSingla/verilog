// Design a 1 to 16 DEMUX with active high enable.

module demux_1to16(output [15:0] out,
                   input [3:0] s,
                   input enable);
assign out[15] =  s[3]  &   s[2]  &   s[1]  &   s[0]  & (enable);
assign out[14] =  s[3]  &   s[2]  &   s[1]  & (~s[0]) & (enable);
assign out[13] =  s[3]  &   s[2]  & (~s[1]) &   s[0]  & (enable);
assign out[12] =  s[3]  &   s[2]  & (~s[1]) & (~s[0]) & (enable);
assign out[11] =  s[3]  & (~s[2]) &   s[1]  &   s[0]  & (enable);
assign out[10] =  s[3]  & (~s[2]) &   s[1]  & (~s[0]) & (enable);
assign out[9] =   s[3]  & (~s[2]) & (~s[1]) &   s[0]  & (enable);
assign out[8] =   s[3]  & (~s[2]) & (~s[1]) & (~s[0]) & (enable);
assign out[7] = (~s[3]) &   s[2]  &   s[1]  &   s[0]  & (enable);
assign out[6] = (~s[3]) &   s[2]  &   s[1]  & (~s[0]) & (enable);
assign out[5] = (~s[3]) &   s[2]  & (~s[1]) &   s[0]  & (enable);
assign out[4] = (~s[3]) &   s[2]  & (~s[1]) & (~s[0]) & (enable);
assign out[3] = (~s[3]) & (~s[2]) &   s[1]  &   s[0]  & (enable);
assign out[2] = (~s[3]) & (~s[2]) &   s[1]  & (~s[0]) & (enable);
assign out[1] = (~s[3]) & (~s[2]) & (~s[1]) &   s[0]  & (enable);
assign out[0] = (~s[3]) & (~s[2]) & (~s[1]) & (~s[0]) & (enable);

endmodule