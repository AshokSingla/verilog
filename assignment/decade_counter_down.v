// Design a decade down counter with synchronous reset.

module decade_counter_down(out, clk, reset);    // initial state 0
input clk ,reset;
output [3:0] out;

assign rp = reset | ~|out;

t_ff f0(out[0],1'b1,clk,rp);
t_ff f1(out[1],1'b1,(out[1]&out[0]) | (out[3]&~out[0]) | (out[2]&~out[1]&~out[0]),rp);
t_ff f2(out[2],1'b1,(out[3]&~out[1]&~out[0]) | (out[2]&out[0]) | (out[2]&out[1]),rp);
t_ff f3(out[3],1'b1,(~|out) | (out[0]&out[3]),rp);

endmodule



module t_ff(out,in,clk,reset);
input in,clk,reset;
output reg out;

always @(negedge clk)
begin
    out = reset ? 1'b0:(in?~out:out);
end

endmodule