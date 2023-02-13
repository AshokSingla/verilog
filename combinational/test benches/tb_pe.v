module tb_pe;

reg [3:0]in;
wire [1:0]out;
wire valid;

priority_encoder pe(out,valid,in);

initial begin
    $monitor("out = %b, in = %b",out,in);
    in = 4'b1000;
    #1;
    in[1] = 1'b1;
    #1;
    in[3] = 1'b0;

end

endmodule