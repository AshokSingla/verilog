// Design a 16:4 Priority encoder using casex statement.

module priority_encoder_16to4(output reg [3:0] out,
                              input [15:0] in);

always @(*) begin
    casex (in)
        16'b1xxx_xxxx_xxxx_xxxx: out = 4'hf;
        16'b01xx_xxxx_xxxx_xxxx: out = 4'he;
        16'b001x_xxxx_xxxx_xxxx: out = 4'hd;
        16'b0001_xxxx_xxxx_xxxx: out = 4'hc;
        16'b0000_1xxx_xxxx_xxxx: out = 4'hb;
        16'b0000_01xx_xxxx_xxxx: out = 4'ha;
        16'b0000_001x_xxxx_xxxx: out = 4'h9;
        16'b0000_0001_xxxx_xxxx: out = 4'h8;
        16'b0000_0000_1xxx_xxxx: out = 4'h7;
        16'b0000_0000_01xx_xxxx: out = 4'h6;
        16'b0000_0000_001x_xxxx: out = 4'h5;
        16'b0000_0000_0001_xxxx: out = 4'h4;
        16'b0000_0000_0000_1xxx: out = 4'h3;
        16'b0000_0000_0000_01xx: out = 4'h2;
        16'b0000_0000_0000_001x: out = 4'h1;
        16'b0000_0000_0000_0001: out = 4'h0; 
    endcase
end

endmodule