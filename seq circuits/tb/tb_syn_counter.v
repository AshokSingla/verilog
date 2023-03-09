module tb_syn_counter;
reg clk,reset,mode;
wire [2:0] out;

syn_counter_3bit s(out,clk,reset,mode);

initial begin
    $monitor($time, " out = %b, out_d = %4d, mode = %b",out, out, mode);
    clk = 1'b0;
    reset = 1'b1;
    mode = 1'b1;
    #1 reset = 1'b0;
    #1 reset = 1'b1;
    #20 mode = 1'b0;

end

initial begin
    forever begin
        #1 clk = ~clk;
    end
end

initial begin
    #42 $finish;
end
endmodule