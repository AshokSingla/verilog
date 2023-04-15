// Design a mod-16 binary counter with asynchronous reset.

// We are not using the flip flops in the design code module named counter_16.
// For the code using flip flops, refer to module named counter_16_ff.v

// For mod 16 we need log 16 (base2) = 4 output bits

module counter_16(output reg [3:0] out,
                  input clk, reset);

wire clear = &out;

always @(negedge clk or posedge reset)
begin
    if (reset | clear)
    out <= 4'b0000;
    else
    out <= out + 1'b1;
end
endmodule



module counter_16_ff(output [3:0] out,
                     input clk, reset);

t_ff f0(out[0],1'b1,clk,reset);
t_ff f1(out[1],1'b1,out[0],reset);
t_ff f2(out[2],1'b1,out[1],reset);
t_ff f3(out[3],1'b1,out[2],reset);

endmodule

module t_ff(output reg out,
            input in, clk, reset);

always @ (negedge clk or posedge reset)
begin
    if (reset)
    out <= 1'b0;
    else
    out <= in ? (~out) : (out);
end
endmodule