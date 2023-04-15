// Design a 8-bit Johnson Counter.

module johnson_counter_8(out, clk, reset);
output reg [7:0] out;
input clk, reset;

always @(negedge clk or posedge reset)
begin
    if (reset)
    begin
    out[7:0] <= 'b0;
    end
    else
    begin
        out[0] <= ~out[7];
        out[7:1] <= out[6:0];
    end

end
endmodule