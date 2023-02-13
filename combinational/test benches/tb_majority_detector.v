module tb_md ();

reg a,b,c,d;
wire out,equal;

// majority_detector_3 m(out,equal,a,b,c);
majority_detector_4 m(out,equal,a,b,c,d);

initial begin
    $monitor($time, " out = %b, equal = %b, a,b,c,d = %b %b %b %b",out,equal,a,b,c,d);
    {a,b,c,d} = 4'b0000;
    repeat (15)
    begin
        {a,b,c,d} = {a,b,c,d} + 1'b1;
        #1;
    end

end

endmodule