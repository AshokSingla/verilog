// Design a divide-by-32 binary down counter.

module t_ff(output reg q,
            input in, clk, reset);
always @(negedge clk)
begin
    if (reset)
    q <= 1'b0;
    else
    q <= in ? ~q : q;
end
endmodule


module counter_32(output [4:0]q,
                  input clk, reset);

t_ff f0(q[0],1'b1,clk,reset);
t_ff f1(q[1],1'b1,~q[0],reset);
t_ff f2(q[2],1'b1,~q[1],reset);
t_ff f3(q[3],1'b1,~q[2],reset);
t_ff f4(q[4],1'b1,~q[3],reset);
endmodule