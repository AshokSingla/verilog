module johnson_counter(out, clk, reset);
parameter N = 3;
output reg [N:0] out;
input clk, reset;

always @(posedge clk or negedge reset)
begin
    if (!reset)
    begin
    out[N:0] <= 'b0;
    end
    else
    begin
        out[N] <= ~out[0];
        out[N-1:0] <= out[N:1];
    end

end
endmodule