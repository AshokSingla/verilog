module shift_register(out, in , clk, clr);
parameter n = 3;
output reg out;
input clk, clr;
input in;
reg [n:1] mem;

always @(posedge clk) begin
    if (clr)
    {mem,out} = 0;
    else
    {mem,out} = {in,mem};
end

endmodule