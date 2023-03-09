module tb_bcd_counter;
reg clk,reset;
wire [3:0] out;

bcd_counter s(out,clk,reset);

initial begin
    $monitor($time, " out = %b, reset = %b",out,reset);
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