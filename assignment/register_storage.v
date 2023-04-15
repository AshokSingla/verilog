// Design a register to store 16-bit data using suitable number of D flip flops.

module register(output [15:0] out,
            input [15:0] in,
            input clk, clear);

d_ff d0(out[0],in[0],clk,clear);
d_ff d1(out[1],in[1],clk,clear);
d_ff d2(out[2],in[2],clk,clear);
d_ff d3(out[3],in[3],clk,clear);
d_ff d4(out[4],in[4],clk,clear);
d_ff d5(out[5],in[5],clk,clear);
d_ff d6(out[6],in[6],clk,clear);
d_ff d7(out[7],in[7],clk,clear);
d_ff d8(out[8],in[8],clk,clear);
d_ff d9(out[9],in[9],clk,clear);
d_ff d10(out[10],in[10],clk,clear);
d_ff d11(out[11],in[11],clk,clear);
d_ff d12(out[12],in[12],clk,clear);
d_ff d13(out[13],in[13],clk,clear);
d_ff d14(out[14],in[14],clk,clear);
d_ff d15(out[15],in[15],clk,clear);

endmodule

module d_ff(output reg out,
            input in, clk, clear);

always @ (posedge clear or negedge clk)
begin
    if (clear)
    out <= 1'b0;
    else
    out <= in;
end

endmodule