// Design a mod-20 binary counter with synchronuos reset.

module counter_20 (output reg [4:0] out, 
                   input reset, 
                   input clk);

wire clr = out[4] & ~out[3] & ~out[2] & out[1] & out[0];

always @(posedge clk)       // posedge of clock is taken (assumption).
begin                       // if statements are used to access statements conditionally.
    if (reset)              // if reset is high, the ouput is made 0.
    begin
        out <= 5'b0;
    end

    else if (clr)           // This is made to jump to 0 when counter has reached to 19
    begin
        out <= 5'b0;
    end

    else                    // counter count increases by 1
    begin
        out <= out + 1'b1;
    end
end

endmodule