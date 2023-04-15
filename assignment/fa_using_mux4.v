// Design a full-adder using suitable multiplexer.

module fa_using_mux4 (output sum,
                      output carry,
                      input a, b,
                      input cin);

/*
Truth table
    a,b,cin : sum,carry
    0,0,0   :   0,0
    0,0,1   :   1,0
    0,1,0   :   1,0
    0,1,1   :   0,1
    1,0,0   :   1,0
    1,0,1   :   0,1
    1,1,0   :   0,1
    1,1,1   :   1,1
*/

// Could have used a 8:1 mux by making cin as another select line

// To implement using 4:1 mux, cbar is made to use

// taking a, b as select line
wire cin_b;         // inverted cin
not (cin_b, cin);
mux4 M1(sum, a,b, cin, cin_b, cin_b, cin);
mux4 M2(carry, a,b, 1'b0, cin, cin, 1'b1);

endmodule

module mux4(output out,
            input s1,s0,
            input in0, in1, in2, in3);

// A typical mux with output out represented in the form of and or configuration.

/*

Truth table
    s1, s0 : out
    0   0  : in0
    0   1  : in1
    1   0  : in2
    1   1  : in3
    each output is simply rewritten as in_ & 1 where 1 comes from combination of s1,s0.

*/

assign out = (in0 & ~s1 & ~s0) | 
             (in1 & ~s1 & s0) | 
             (in2 & s1 & ~s0) | 
             (in3 & s1 & s0);

endmodule