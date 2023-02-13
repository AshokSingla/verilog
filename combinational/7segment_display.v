`include "decoders.v"

module segment_7_display (
    output [6:0]out, input [3:0]in
);
wire [15:0] temp;
decoder_4to16 d(temp, in, 1'b1);
or a(out[6],temp[0],temp[2],temp[3],temp[5],temp[6],temp[7],temp[8],temp[9]);
or b(out[5],temp[0],temp[1],temp[2],temp[3],temp[4],temp[7],temp[8],temp[9]);
or c(out[4],temp[0],temp[1],temp[3],temp[4],temp[5],temp[6],temp[7],temp[8],temp[9]);
or d(out[3],temp[0],temp[2],temp[3],temp[5],temp[6],temp[8],temp[9]);
or e(out[2],temp[0],temp[2],temp[6],temp[8]);
or f(out[1],temp[0],temp[4],temp[5],temp[6],temp[8],temp[9]);
or g(out[0],temp[2],temp[3],temp[4],temp[5],temp[6],temp[8],temp[9]);
    
endmodule