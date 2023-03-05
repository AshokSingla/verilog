module ripple_counter(out, clk, reset);

output [3:0] out;
input clk, reset;

tff f1(out[0], clk,    reset);
tff f2(out[1], out[0], reset);
tff f3(out[2], out[1], reset);
tff f4(out[3], out[2], reset);

endmodule


primitive tff (out, clk, reset);
output out;
reg out;
input clk, reset;

initial
    out = 0;

table
//  clk  reset : prev : out
    ?      1   :  ?   :  0;
    ?      (10):  ?   :  -;
    (10)   0   :  0   :  1;
    (10)   0   :  1   :  0;
    (0?)   0   :  ?   :  -;

endtable

endprimitive