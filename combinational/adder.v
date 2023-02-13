module halfadder (output sum, carry, input a,b);
assign sum = a^b;
assign carry = a&b;
endmodule




module ha_using_nand (output sum, carry, input a,b);
wire w1,w2,w3;

nand (w1,a,b),
     (w2,w1,a),
     (w3,w1,b),
     (sum,w2,w3),   // this and above basically form the xor gate.
     (carry,w1,w1); // last corresponds to not function

endmodule




module ha_using_nor (output sum, carry, input a,b);

// (AB' + A'B)
// (A'B + A) (A'B + B')
// (A + B) (A' + B')
// (A + B)'' (AB)'
// ( (A + B)' + (AB) )'

wire w1,w2,w3;

nor (w1,a,b),
    (w2,a,a),
    (w3,b,b),
    (carry,w2,w3),
    (sum,carry,w1);

endmodule





module fulladder (output sum,carry, input a,b,c);
assign sum = a^b^c;
assign carry = (a&b)|(b&c)|(a&c);
endmodule





module fa_using_ha (output sum, carry, input a,b,c);
wire temps,tempc;
wor carry;
halfadder h1(temps,tempc,a,b);
halfadder h2(sum,carry,temps,c);
assign carry = tempc;
endmodule




module fa_using_nand (output sum,carry, input a,b,c);
wire w1,w2,w3,w4,w5,w6,w7;

nand (w1,a,b),
     (w2,w1,a),
     (w3,w1,b),
     (w4,w2,w3), // completed xor 1
     (w5,w4,c),
     (w6,w5,w4),
     (w7,w5,c),
     (sum,w6,w7),// completed xor 2
     (carry,w1,w5);
// for odd number of inputs, xnor and xor are the same in truth table.
// hence to realize fa using nor gates, we realize the xnor functionality.
// thus the number of gates remain the same i.e. 9

endmodule