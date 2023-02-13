module tb_adder ;
reg a,b,c;
wire sum,carry;

fa_using_ha A(sum,carry,a,b,c);

initial begin
    $monitor($time, " sum = %b, carry = %b, a,b,c = %b %b %b", sum,carry,a,b,c);
    {a,b,c} = 3'b000;
    repeat (7)
    begin
        #1;
        {a,b,c} = {a,b,c} + 1'b1;
        
    end
end
endmodule