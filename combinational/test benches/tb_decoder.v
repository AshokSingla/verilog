module tb_mux ();

reg ENABLE;
reg [2:0]IN;
wire [7:0]OUT;

decoder_3to8 m(OUT,IN, ENABLE);

initial begin
    $monitor($time, " out = %b", OUT);
    #2;
    ENABLE = 1'B1;
    IN = 3'b110;
    #2;
    IN = 3'b001;

end

endmodule