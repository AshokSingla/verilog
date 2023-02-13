module decoder_1to2 (
    output reg [1:0]out, input sel0, enable
);

always @(*) begin
    if (enable == 0)
    out = 2'b0;
    else
    begin
        case (sel0)
            1'b0: out = 2'b01;
            1'b1: out = 2'b10;
        endcase
    end
end
    
endmodule


module decoder_2to4 (output [3:0]out, input [1:0]sel, input enable);

wire [1:0]o;

decoder_1to2 d0(o,sel[1],enable);
decoder_1to2 d1(out[1:0],sel[0],o[0]);
decoder_1to2 d2(out[3:2],sel[0],o[1]);

endmodule

module decoder_3to8 (
    output [7:0]out, input [2:0]sel, input enable
);
    wire [1:0]o;
    // decoder_1to2 d0(o,sel[2],enable);

    wire [1:0]temp; // needed to make assignment continuous for the output in case of 2to4 decoder

    decoder_2to4 d0({temp,o},{1'b0,sel[2]},enable);
    decoder_2to4 d1(out[3:0],sel[1:0],o[0]);
    decoder_2to4 d2(out[7:4],sel[1:0],o[1]);

endmodule


module decoder_4to16 (
    output [15:0]out, input [3:0]sel, input enable
);
    wire [3:0]o;

decoder_2to4 d0(o,sel[3:2],enable);
decoder_2to4 d1(out[3:0],sel[1:0],o[0]);
decoder_2to4 d2(out[7:4],sel[1:0],o[1]);
decoder_2to4 d3(out[11:8],sel[1:0],o[2]);
decoder_2to4 d4(out[15:12],sel[1:0],o[3]);

endmodule