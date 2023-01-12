module tb_jk ();

reg j,k,clock,clear;
wire q,qbar;

jk_latch_gates JK(q,qbar,j,k,clock,clear);

initial begin
    $monitor($time, " clock = %b, j = %b, k = %b, q = %b, qbar = %b", clock , j , k , q, qbar);
    clock = 1'b1;
    clear = 1'b1;
    #1;
    clear = 1'b0;
    #1;
    j = 1'b1;
    k = 1'b0; // 10
    #2;
    j = 1'b0;
    k = 1'b0; // 10
    #2;
    j = 1'b1;
    k = 1'b1; // 01
    #2;
    j = 1'b0; 
    k = 1'b0; // 01
    #2;
    j = 1'b1;
    k = 1'b0; // 10
    #2;
    j = 1'b0;
    k = 1'b1; // 01
    #2; 
    j = 1'b0;
    k = 1'b0; // 01

end

always
#1 clock = ~clock;

initial
#15 $finish;

endmodule