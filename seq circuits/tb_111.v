module tb_111();
reg in;
reg clk,clear;
wire out;
wire [1:0] state;
detector_111 d(out,state,in,clk,clear);

initial begin
    $monitor($time, " in = %b, clear = %b",in,clear);
    clk = 1'b0;
    in = 1'b0;
    clear = 1'b1;

    #1 clear <= 1'b0;

    #9 in = 1'b1;

    repeat(4)
    begin
        #10 in = 1'b1;
    end

    repeat(2)
    begin
        #10 in = 1'b0;
    end
    
    #10 in = 1'b1;
    #10 in = 1'b0;

    repeat(5)
    begin
    #10 in = 1'b1;
    end

    #10 in = 1'b0;

end

initial begin
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    forever begin
        $display($time, " out = %b, state = %b, in = %b, clear = %b",out,state,in,clear);
        #10 ;
    end
end

initial
#200 $finish;
endmodule