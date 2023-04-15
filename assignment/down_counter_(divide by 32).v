// Design a divide-by-32 binary down counter with synchronous reset. 

// divide by 32 counter is basically a counter that counts to 32. The MSB of output is the signal wwith frequency 32 times slower than the original clock.

// To design a 32 counter, we need to have a minimum of log 32 (base 2) = 5 flip flops.

module t_ff(output reg q,
            input in, clk, reset);
always @(posedge clk)
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
t_ff f1(q[1],1'b1,q[0],reset);
t_ff f2(q[2],1'b1,q[1],reset);
t_ff f3(q[3],1'b1,q[2],reset);
t_ff f4(q[4],1'b1,q[3],reset);
endmodule