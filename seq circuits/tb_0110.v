module tb_detector_0110;
reg clk,reset,in;
wire out;
wire [1:0] current;

detector_0110 d(out,current,in,clk,reset);

initial begin
    $monitor($time, " out = %b, current = %b, in = %b",out,current,in);
    // #1;
    clk = 1'b0;
    in = 1'b1;

    #10 in = 1'b1;
    #10 in = 1'b0;
    #10 in = 1'b1;
    #10 in = 1'b1;
    #10 in = 1'b0;
    #10 in = 1'b1;
    #10 in = 1'b1;
    #10 in = 1'b0;
    #10 in = 1'b0;

end

initial begin
    #100 $finish;
end

initial begin
    forever begin
        #5 clk = ~clk;
    end
end

endmodule