module halfsubtrator (
    output diff, borrow, input a, b
);

assign diff = a^b;
assign borrow = (~a)&b;
    
endmodule

module hs_using_nand (output diff, borrow, input a, b);

wire w1,w2,w3;

nand (w1,a,b),
     (w2,w1,a),
     (w3,w1,b),
     (diff, w2,w3), // xor complete
     (borrow,w3,w3);// not gate

endmodule

module hs_using_nor (output diff, borrow, input a, b);

wire w1,w2,w3;

nor (w1,a,b),
    (borrow,w1,a),
    (w2,w1,b),
    (w3,borrow,w2), // xnor complete
    (diff,w3,w3);   // not gate

endmodule

module fullsubtractor (output diff, borrow, input a, b, bi);

assign diff = a^b^c;
assign borrow = (~a&b)|(~a&bi)|(b&bi);

endmodule

module fs_using_hs (output diff, borrow, input a, b, bi);
wor borrow;
wire tempd, tempb;

halfsubtrator s1(tempd,tempb,a,b);
halfsubtrator s2(diff,borrow,tempd,bi);

assign borrow = tempb;

endmodule