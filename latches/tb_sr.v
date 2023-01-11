module tb_sr (
    
);

reg s,r,clock;
wire q,qbar;

sr_latch_gates S(q,qbar,s,r,clock);

initial begin
    $monitor($time, " q = %b , qbar = %b , s = %b , r = %b",q,qbar,s,r);
    clock = 1'b1;
    #2;
    s = 1'b0;
    r = 1'b1;
    #2;
    s = 1'b0;
    r = 1'b0;
    #2;
    s = 1'b1;
    r = 1'b0;
    #2;
    s = 1'b0;
    r = 1'b0;
    #2;
    s = 1'b1;
    r = 1'b1;
    #2;
    s = 1'b0;
    r = 1'b0;
end

initial begin
    #12 $finish;
end

always begin
    #1;
    clock = ~clock;
end
    
endmodule
