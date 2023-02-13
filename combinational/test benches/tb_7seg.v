module tb_7seg();
reg [3:0]inp;
wire [6:0]out;

segment_7_display d(out,inp);

initial begin
    $monitor($time, " out = %b, in = %b", out, inp);
    #1;
    inp = 4'b0000;
    repeat(15)
    begin
        #2;
        inp = inp + 4'b1;
        // $display("%b, %b",inp,out);
    end
end
endmodule