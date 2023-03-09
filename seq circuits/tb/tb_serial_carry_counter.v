module tb_serial_carry_counter;
reg clk, reset;
wire [3:0] out;

serial_carry_counter s(out,clk,reset);

initial begin
    $monitor($time, " out = %b, out = %4d, reset = %b", out, out, reset);
    clk = 1'b0;
    reset = 1'b0;
    #1 reset = 1'b1;
    #1 reset = 1'b0;
end

initial begin
    forever begin
        #1 clk = ~clk;
    end
end

initial begin
    #50 $finish;
end

endmodule