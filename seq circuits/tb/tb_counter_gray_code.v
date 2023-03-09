module tb_counter_gray;
reg clk,reset;
wire [2:0] out;

mod6_gray_counter_tff s(out,clk,reset);

initial begin
    $monitor($time, " out = %b",out);
    clk = 1'b0;
    reset = 1'b1;
    #1 reset = 1'b0;
    #1 reset = 1'b1;

end

initial begin
    forever begin
        #1 clk = ~clk;
    end
end

initial begin
    #20 $finish;
end
endmodule