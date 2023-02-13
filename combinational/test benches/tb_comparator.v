module tb_comparator;
reg [2:0] a,b;
wire l,e,g;

compare_3bit c(l,e,g,a,b);

initial begin
    $monitor("l e g = %b %b %b, a = %b, b = %b", l,e,g,a,b);

    {a,b} = 6'b000000;

    repeat (63)
    begin
        #1;
        {a,b} = {a,b} + 1'b1;
    end
end
endmodule