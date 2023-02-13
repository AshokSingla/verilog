// equal corresponds to the condition when the count of ones and zeroes is same. equals will be 1 when the same happens and 
// output out is set to zero in that case.

module majority_detector_3 (output out, equal, input a,b,c);
assign out = (a&b)|(b&c)|(a&c);
assign equal = 1'b0;
endmodule

module majority_detector_4 (output out, equal, input a,b,c,d);
wand out;
assign out = ~equal;
assign out = (a&d)|(a&c)|(b&d)|(b&c);
assign equal = ((~a)&(~b)&c&d)|((~a)&b&(~c)&d)|((~a)&b&c&(~d))|(a&(~b)&(~c)&d)|(a&(~b)&c&(~d))|(a&b&(~c)&(~d));
endmodule

// minority detector can be made by simply complementing the output out when equal is low.