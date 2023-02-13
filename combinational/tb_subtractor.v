module tb_subtractor ;
reg a,b,c;
wire diff, borrow;

fs_using_hs A(diff,borrow,a,b,c);

initial begin
    $monitor($time, " diff = %b, borrow = %b, a,b,c = %b %b %b", diff,borrow,a,b,c);
    {a,b,c} = 3'b000;
    repeat (7)
    begin
        #1;
        {a,b,c} = {a,b,c} + 1'b1;
        
    end
end
endmodule