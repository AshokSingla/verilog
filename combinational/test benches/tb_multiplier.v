module tb_multiplier;

reg [2:0] a;
reg [1:0] b;
wire [4:0] out;

multiplier_3x2 m(out,a,b);

initial begin
    $monitor("out = %b, a = %b, b = %b",out,a,b);
    a = 3'b11;
    b = 2'b10;
    #2;

    a = 3'b100;

    #2;

    a = 3'b111;
    b = 2'b11;

    
end

endmodule