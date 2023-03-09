module tb_ripple_counter_eg;
reg clk,reset;
wire [2:0] out;

counter_mod5_down s(out,clk,reset);

initial begin
    $monitor($time, " out = %b, clk = %b, reset = %b",out,clk,reset);
    clk = 1'b0;
    reset = 1'b1;
    #3 reset = 1'b0;
    // #1 reset = 1'b1;

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