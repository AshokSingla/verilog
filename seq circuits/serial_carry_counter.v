module serial_carry_counter(out,clk,reset);
input clk, reset;
output [3:0] out;

wire t1 = out[0];
wire t2 = out[1]&t1;
wire t3 = out[2]&t2;

t_ff f0(out[0],1'b1,clk,reset);
t_ff f1(out[1],t1,clk,reset);
t_ff f2(out[2],t2,clk,reset);
t_ff f3(out[3],t3,clk,reset);

endmodule


module t_ff(out,in,clk,reset);
input in,clk,reset;
output reg out;

always @(negedge clk or posedge reset)
begin
    out = reset ? 1'b0:(in?~out:out);
end

endmodule