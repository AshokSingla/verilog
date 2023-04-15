// Design a 5-bit binary up-down counter.

// mode = 0 Down counter
// mode = 1 Up counter

/* mode = 1
00000  c1 = 0 c2 = 0
10000  c1 = 1 c2 = 0
01000  c1 = 0 c2 = 1
11000
*/

// This module does not use ffs
module counter_32_up_down(output reg [4:0] out,
                          input clk, mode, reset);

// Here we assume that the change is happening at the neg edge of the clk

wire clear = &out;      // to jump from 15 to 0
wire preset = ~|out;    // to jump from 0 to 15

always @(posedge reset or negedge clk)
begin
    if (reset)
    out <= 5'b00000;
    else if (clear)
    out <= 5'b00000;
    else if (preset)
    out <= 5'b11111;
    else if (mode)
    out <= out + 1'b1;
    else if (~mode)
    out <= out - 1'b1;
end
endmodule


// This module uses ffs
module counter_32_ud_ff(output [4:0] out,
                        input clk, mode, reset);
wire c1 = mode ~^ out[0];
wire c2 = mode ~^ out[1];
wire c3 = mode ~^ out[2];
wire c4 = mode ~^ out[3];

t_ff f0(out[0],1'b1,clk,reset);
t_ff f1(out[1],1'b1,c1,reset);
t_ff f2(out[2],1'b1,c2,reset);
t_ff f3(out[3],1'b1,c3,reset);
t_ff f4(out[4],1'b1,c4,reset);

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