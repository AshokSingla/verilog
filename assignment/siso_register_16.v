// Desgin a 16-bit shift register to perform to serial-in and serail-out operation.

module siso_register_16(output out,
                       input in, clk, reset);

wire [14:0] t_in;

d_ff f0(t_in[0], in, clk, reset);
d_ff f1(t_in[1], t_in[0], clk, reset);
d_ff f2(t_in[2], t_in[1], clk, reset);
d_ff f3(t_in[3], t_in[2], clk, reset);
d_ff f4(t_in[4], t_in[3], clk, reset);
d_ff f5(t_in[5], t_in[4], clk, reset);
d_ff f6(t_in[6], t_in[5], clk, reset);
d_ff f7(t_in[7], t_in[6], clk, reset);
d_ff f8(t_in[8], t_in[7], clk, reset);
d_ff f9(t_in[9], t_in[8], clk, reset);
d_ff f10(t_in[10], t_in[9], clk, reset);
d_ff f11(t_in[11], t_in[10], clk, reset);
d_ff f12(t_in[12], t_in[11], clk, reset);
d_ff f13(t_in[13], t_in[12], clk, reset);
d_ff f14(t_in[14], t_in[13], clk, reset);
d_ff f15(out, t_in[14], clk, reset);

endmodule


module d_ff(output reg out,
            input in, clk, reset);

always @ (posedge reset or negedge clk)
begin
    if (reset)
    out <= 1'b0;
    else
    out <= in;
end

endmodule