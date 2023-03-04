// external code must provide the clock signal

module ring_counter(out, clk, reset);
// reset makes the msb (so called) 1 and others 0
parameter n = 7;
input clk, reset;
output reg [n:0] out;

always @(posedge clk) begin
    if (reset)
    begin
        out = 0;
        out[n] = 1'b1;
    end
    else if (out[0] != 1'b1)
    out = out >> 1;
    else 
    begin
        out = 0;
        out[n] = 1'b1;
    end

    //to remove the last else if and else in 1 statement use non blocking assignment as below
    // out <= out >> 1;
    // out[n] <= out[0];
    
        // another solution
        // out = {out[0],out[n:1]};
end
endmodule