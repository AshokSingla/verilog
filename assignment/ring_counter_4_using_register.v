// Desgin a 4-bit ring counter using 4-bit shift register.

module d_ff(output reg out,
            input in, clk, reset, preset);

always @(negedge clk) begin
    if (reset)
    out <= 1'b0;
    else if (preset)
    out <= 1'b1;
    else
    out <= in;
end

endmodule

module register_4(output [3:0] out,
                       input in, clk, 
                       input [3:0] reset, preset);

d_ff f0(out[0], in, clk, reset[0], preset[0]);
d_ff f1(out[1], in, clk, reset[1], preset[1]);
d_ff f2(out[2], in, clk, reset[2], preset[2]);
d_ff f3(out[3], in, clk, reset[3], preset[3]);

endmodule

module ring_counter(output [3:0] out,
                    input in, clk, set);
                    
wire [3:0] reset, preset;
assign reset = set ? (4'b1110) : 4'b0;
assign preset = set ? (4'b1) : 4'b0;

register_4 R(out,in,clk,reset,preset);
endmodule