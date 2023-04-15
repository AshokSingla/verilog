// Design a 8-bit register to perform parallel-in and parallel-out opeartion.

module pipo_reg_8(output reg [7:0] out,
                  input [7:0] in,
                  input clk, reset);

always @ (negedge clk or posedge reset)
begin
    if (reset)
    out <= 8'b0;
    else
    out <= in;
end

endmodule