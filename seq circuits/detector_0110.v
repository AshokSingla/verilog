module detector_0110(out,current,in,clk,reset);
// mealy machine
// x   s0
// 0   s1
// 01  s2
// 011 s3

// to make moore, we need 5 states. which means 3 bits will be used to show the states.
// in that case s0 - s3 will be same as above with s4 representing 0110.
// also then the second always block can be made to start at change in current state and independent of in.
// Another example is made to show moore machine.

input in,clk,reset;
output reg out;
parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b11, s3 = 2'b10;

output reg [1:0] current;

always @(negedge clk) begin
    if (reset)
    begin
        out = 1'b0;
        current = s0;
    end
    else
    case (current)
        s0: current = in? s0:s1; 
        s1: current = in? s2:s1;
        s2: current = in? s3:s1;
        s3: current = in? s0:s1;
        default: current = s0;
    endcase
end

always @(in) begin
    if (reset)
    begin
        out = 1'b0;
        current = s0;
    end
    else
    out = (~in)&(current == s3);
end

endmodule