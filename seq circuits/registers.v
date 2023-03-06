module siso_register(out,in,clk,reset);
parameter N = 3;    // for n bit register N= n-1
input clk, reset, in;
output reg out;
reg [N:1]memory;

always @(posedge clk or negedge reset) begin
    if (!reset)
    {memory,out} <= 0;
    else
    begin
        out <= memory[1];
        memory[N-2:1] <= memory[N-1:2];
        memory[N-1] <= in;
    end
end

endmodule

module sipo_register(out, in, clk, reset);
parameter N = 3;

input clk, reset, in;
output reg [N:0] out;

always @(posedge clk or negedge reset)
begin
    if(!reset)
    out = 0;
    else
    begin
    out[N] <= in;
    out[N-1:0] <= out[N:1];
    end
end

endmodule

module pipo_register(out,in,clk,reset);
parameter N = 3;
input clk, reset;
input [N:0] in;
output reg [N:0] out;

always @(posedge clk or negedge reset)
begin
    if (!reset)
    out <= 0;
    else
    out <= in;
end
endmodule

module buffer_register(out,in,clk,reset,load);   // almost like pipo, just provided the functionality of load i.e. storing over long time
parameter N = 3;
input clk, reset,load;
input [N:0] in;
output reg [N:0] out;

wire  [N:0] t_in;

genvar i;
generate
    for ( i=0 ;i<=N ;i = i+1 ) begin
        assign t_in[i] = in[i]&load | out[i]&~load;
    end
endgenerate 

always @(posedge clk or negedge reset)
begin
    if (!reset)
    out <= 0;
    else
    out <= t_in;
end
endmodule


module piso_register(out,in,clk,reset,load); // to store load = 1 else load = 0 for shifting
parameter N = 3;
input clk,reset,load;
input [N:0] in;

output reg out;
reg [N:1] mem;

always @(posedge clk or negedge reset)
begin
    if (!reset)
    {mem,out} <= 0;
    else
    begin       // this load thing could have been written in a way similar to the one in the buffer rgister using generate statement
        if (load)   // store from in
        begin
            out <= in[0];
            mem <= in[N:1];
        end
        else        // pass the value
        begin
            out <= mem[1];
            mem <= {1'bx,mem[N:2]}; // assuming that after the value is passed on, it is a dont care.
        end
    end
end
endmodule