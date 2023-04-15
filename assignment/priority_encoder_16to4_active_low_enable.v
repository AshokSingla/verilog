// Design a 16:4 Priority Encoder with active low enable.

module priority_encoder_16to4_active_low_enable(output [3:0]out,
                              input [15:0]in,
                              input enable);

assign out[3] = ~enable & (| in[15:8]);

assign out[2] = ~enable & (in[15] | 
~in[15] & in[14] |
~|in[15:14] & in[13] |
~|in[15:13] & in[12] |
~|in[15:8] & in[7] |
~|in[15:7] & in[6] |
~|in[15:6] & in[5] |
~|in[15:5] & in[4] );

assign out[1] = ~enable & (in[15] |
~in[15] &in[14] |
~|in[15:12] &in[11] |
~|in[15:11] &in[10] |
~|in[15:8] &in[7] |
~|in[15:7] &in[6] |
~|in[15:4] &in[3] |
~|in[15:3] &in[2] );

assign out[0] = ~enable & (in[15] | 
~|in[15:14] & in[13] |
~|in[15:12] & in[11] |
~|in[15:10] & in[9] |
~|in[15:8] & in[7] |
~|in[15:6] & in[5] |
~|in[15:4] & in[3] |
~|in[15:2] & in[1] );

endmodule