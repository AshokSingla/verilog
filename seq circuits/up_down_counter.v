// external code must provide the clock signal

module up_down_counter(count, d, clr,load,clk,mode);
parameter n = 7;
input clr,load, clk, mode;
input [n:0] d;
output reg [n:0] count;

always @(posedge clk) begin
    if (clr)
    count <= 0;
    else if (load)
    count <= d;
    else if (mode)
    count <= count + 1;
    else // mode == 0
    count <= count -1;
end
endmodule
