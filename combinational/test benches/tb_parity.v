module tb_parity;

reg [3:0] in;
wire [4:0] even, odd;

odd_parity_gen o(odd,in);
even_parity_gen e(even,in);

initial begin
    $monitor("odd = %b, even = %b, input = %b",odd,even,in);

    in = 4'b0000;
    repeat(15)
    begin
        #1;
        in = in +1'b1;
    end
end

endmodule