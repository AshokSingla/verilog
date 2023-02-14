module tb_pe;

reg [9:0]in;
wire [3:0]out;
wire valid;

priority_encoder_dectobin pe(out,valid,in);

initial begin
    $monitor("out = %b, in = %b",out,in);
    in = 10'b1000000000;
    #1;
    in[4] = 1'b1;
    #1;
    in[7] = 1'b1;
    #1;
    in[9] = 1'b0;
    #1;
    in[5] = 1'b1;
    #1;
    in[7] = 1'b0;
    #1;
    in[5] = 1'b0;
    #1;
    in[4] = 1'b1;
    #1;
    in[4] = 1'b0;

end

endmodule
