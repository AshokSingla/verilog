// Design a 8-bit shift register to perform serial-in and serial-out opeartion.

module siso_register_8(output reg out,
                       input in, clk, reset);

parameter N = 7;    // for n bit register N= n-1
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