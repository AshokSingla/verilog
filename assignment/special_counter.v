// Design a counter to count the sequence 35,28,21,14,7,0,… and repeat.

// Assumptions :
/*
    1. The changes occur at each negative clock edge.
    2. The reset signal is asynchronous
    3. Max number = 35 needs minimum of 6 bits so the number of ffs used is 6.
    4. ffs used are d ffs.
*/

module counter(output [5:0] out,
               input clk, reset);

wire [5:0] in;

assign in[0] = (~out[5] & out[4] & out[3] & out[2] & ~out[1] & ~out[0]) |       // 28
               (~out[5] & ~out[4] & out[3] & out[2] & out[1] & ~out[0]) |       // 14
               (~out[5] & ~out[4] & ~out[3] & ~out[2] & ~out[1] & ~out[0]);     // 0

assign in[1] = (~out[5] & out[4] & ~out[3] & out[2] & ~out[1] & out[0]) |       // 21
               (~out[5] & ~out[4] & out[3] & out[2] & out[1] & ~out[0]) |       // 14
               (~out[5] & ~out[4] & ~out[3] & ~out[2] & ~out[1] & ~out[0]);     // 0

assign in[2] = (out[5] & ~out[4] & ~out[3] & ~out[2] & out[1] & out[0]) |       // 35
               (~out[5] & out[4] & out[3] & out[2] & ~out[1] & ~out[0]) |       // 28
               (~out[5] & ~out[4] & out[3] & out[2] & out[1] & ~out[0]) |       // 14
               (~out[5] & out[4] & ~out[3] & out[2] & ~out[1] & out[0]);        // 21

assign in[3] = (out[5] & ~out[4] & ~out[3] & ~out[2] & out[1] & out[0]) |       // 35
               (~out[5] & out[4] & ~out[3] & out[2] & ~out[1] & out[0]);        // 21

assign in[4] = (out[5] & ~out[4] & ~out[3] & ~out[2] & out[1] & out[0]) |       // 35
               (~out[5] & out[4] & out[3] & out[2] & ~out[1] & ~out[0]);        // 28

assign in[5] = (~out[5] & ~out[4] & ~out[3] & ~out[2] & ~out[1] & ~out[0]);     // 0

d_ff f0(out[0], in[0], clk, reset);
d_ff f1(out[1], in[1], clk, reset);
d_ff f2(out[2], in[2], clk, reset);
d_ff f3(out[3], in[3], clk, reset);
d_ff f4(out[4], in[4], clk, reset);
d_ff f5(out[5], in[5], clk, reset);

endmodule

module d_ff(output reg out,
            input in, clk, reset);

always @(posedge reset or negedge clk) begin
    if (reset)
    out <= 1'b0;
    else
    out <= in;
end

endmodule