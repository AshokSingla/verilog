module tb_dff();
reg d, clock;
wire q, qbar;

d_latch_gates D(q,qbar,d,clock);

initial begin
    $monitor($time, " q=%b, qbar=%b, d=%b",q,qbar,d);
    clock = 1'b1;
    d = 1'b0;
    #2;
    d = 1'b1;
    #2;
    d = 1'b1;
    #2;
    d = 1'b0;
end

always
#1 clock = ~clock;

initial
#7 $finish;
endmodule