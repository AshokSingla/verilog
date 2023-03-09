module t_ff(q,t,clk,reset);
input t,clk,reset;
output reg q;

always @(posedge clk or negedge reset)
begin
    if (!reset)
    q <= 0;
    else
    begin
        if (t)
        q <= ~q;
        else
        q <= q;
    end
end
endmodule

module mod6_gray_counter_tff(out,clk,reset);
input clk,reset;
output [2:0]out;

wire t2 = ~out[2]&out[1]&~out[0] | out[2]&out[0];
wire t1 = ~out[1]&out[0] | out[2]&out[0];
wire t0 = out[2] | ~out[1]&~out[0] | out[1]&out[0];

t_ff f2(out[2],t2,clk,reset);
t_ff f0(out[1],t1,clk,reset);
t_ff f1(out[0],t0,clk,reset);

// always @(posedge clk)
// $display($time, " t2 = %b,t1 = %b,t0 = %b",t2,t1,t0);

endmodule