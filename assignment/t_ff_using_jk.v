// Design a T filp-flop using JK flip-flop.

module t_ff(output out,
            input in, clk, reset);

jk_ff f0(out, in, in, clk, reset);

endmodule

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