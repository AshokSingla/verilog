module tb_mux ();

reg IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7,SEL0,SEL1,SEL2;
wire OUT;

mux_8to1 m(OUT,IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7,SEL0,SEL1,SEL2);

initial begin
    $monitor($time, " out = %b", OUT);
    #2;
    {IN0,IN1,IN2,IN3,IN4,IN5,IN6,IN7} = 8'b00001111;
    {SEL0,SEL1,SEL2} = 3'b000;
    #2;
    {SEL0,SEL1,SEL2} = 3'b001;

end

endmodule