// Design a 8-bit register to perform serial-in and parallel-out opeartion.

module sipo_reg_8(output reg [7:0] out,
                  input in, clk, reset);

always @ (posedge reset or negedge clk)
begin
    if (reset)
    out <= 8'b0;
    else
    out <= {in,out[7:1]};
end

endmodule