module bidirectional_shift_reg(out,in, mode, clk, reset);   // the input will automatically switch between 
                                                            // left and right depending on the mode
// mode = 1 means shift right or divide by 2
// mode = 0 means shift left or multiply by 2
input clk, reset,mode, in;
output [3:0]out;

assign d3 = (in & mode) | (out[2] & ~mode);
assign d2 = (out[3] & mode) | (out[1] & ~mode);
assign d1 = (out[2] & mode) | (out[0] & ~mode);
assign d0 = (out[1] & mode) | (in & ~mode);

d_ff f3(out[3],d3,clk,reset);
d_ff f2(out[2],d2,clk,reset);
d_ff f1(out[1],d1,clk,reset);
d_ff f0(out[0],d0,clk,reset);

endmodule


module d_ff(out, in, clk, reset);
input in, clk, reset;
output reg out;

always @(negedge clk or negedge reset) begin
    out = reset ? (in):1'b0;
end
endmodule