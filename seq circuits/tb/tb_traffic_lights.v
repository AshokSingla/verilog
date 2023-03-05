module tb_traffic();
reg clk;
wire [2:0] lights;

traffic_lights t(lights,clk);

initial begin
    clk = 1'b0;
    forever begin
        #1 clk = ~clk;
    end
end

initial begin
    $monitor($time, " ryg = %b",lights);
    #20 $finish;
end
endmodule
