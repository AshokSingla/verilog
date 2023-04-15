// Desgin a mod-8 binary counter using suitable number of JK Flip flops.

module jk_ff(output reg out,
             input j, k , clk, reset);

always @(posedge reset or negedge clk)
begin
    if (reset)
    out <= 1'b0;
    else
    begin
    case ({j,k})
        2'b00: out <= out;
        2'b01: out <= 1'b0;
        2'b10: out <= 1'b1;
        2'b11: out <= ~out;
    endcase
    end
end

endmodule

module counter_8(output [2:0]out,
                 input clk, reset);

jk_ff f0(out[0], 1'b1, 1'b1, clk, reset);
jk_ff f1(out[1], 1'b1, 1'b1, out[0], reset);
jk_ff f2(out[2], 1'b1, 1'b1, out[1], reset);


endmodule