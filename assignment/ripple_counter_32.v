// Design a 5-bit ripple carry counter using suitable number of T flip flops.

module t_ff(output reg out,
            input in, clk, reset);

always @(posedge reset or negedge clk) begin
    if (reset)
    out <= 1'b0;
    else
    out <= in ? ~out : out;
end

endmodule


module counter_32(output [4:0]out,
                  input clk, reset);

t_ff f0(out[0], 1'b1, clk, reset);
t_ff f1(out[1], 1'b1, out[0], reset);
t_ff f2(out[2], 1'b1, out[1], reset);
t_ff f3(out[3], 1'b1, out[2], reset);
t_ff f4(out[4], 1'b1, out[3], reset);
endmodule