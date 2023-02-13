module compare_1bit (output less, equal, greater, input a,b);
assign less = ~a&b;
assign equal = (a&b) | ((~a)&(~b)); // could have used xnor directly
assign greater = a&(~b);

endmodule



module compare_2bit (output less,equal, greater, input [1:0]a,b);

assign less = ((~a[1])&b[1]) | ((a[1]~^b[1])&((~a[0])&b[0]));
assign equal = (a[1]~^b[1])&(a[0]~^b[0]);
assign greater = (a[1]&(~b[1])) | ((a[1]~^b[1])&(a[0]&(~b[0])));

endmodule



module compare_3bit (output less,equal,greater, input [2:0]a,b);

assign less = ((~a[2])&b[2]) | (a[2]~^b[2])&(~a[1])&b[1] | (a[2]~^b[2])&(a[1]~^b[1])&(~a[0])&b[0];
assign equal = (a[2]~^b[2])&(a[1]~^b[1])&(a[0]~^b[0]);
assign greater = (a[2]&(~b[2])) | (a[2]~^b[2])&a[1]&(~b[1]) | (a[2]~^b[2])&(a[1]~^b[1])&a[0]&(~b[0]);

endmodule