module tb_ripple_counter;
reg clr, clk;
wire [3:0] out;
ripple_counter r(out, clk,clr);

initial begin
    #1;
    $monitor($time, "  out = %b, clr = %b",out,clr);
    clr = 1'b1;
    clk = 1'b0;
    #1;
    clr = 1'b0;
end

initial begin
    forever begin
    #5 clk = ~clk;
    end
end

initial begin
    #200 $finish;
end

endmodule