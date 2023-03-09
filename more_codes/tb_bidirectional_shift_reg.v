module tb_bidirectional;
reg clk, reset, mode, in;
wire [3:0] out;

bidirectional_shift_reg bsr(out, in, mode, clk, reset);

initial begin
    $monitor($time, " out = %b, in = %b, mode = %b, reset = %b, clk = %b",out,in,mode,reset, clk);

    reset = 1'b1;
    clk = 1'b0;
    mode = 1'b1;
    in = 1'b1;
    #1 reset = 1'b0;
    #1 reset = 1'b1;
    in = 1'b1;
    #4 in = 1'b0;
    #4 in = 1'b1;
    #1 mode = 1'b0;
    #4 in = 1'b0;
    #4 in = 1'b1;
end

initial begin
    forever begin
        #1 clk = ~clk;
    end
end

initial begin
    #40 $finish;
end
endmodule