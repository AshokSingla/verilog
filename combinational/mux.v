module mux_2to1 (output out, input in0,in1,sel0);

wire nsel = ~sel0;
assign out = (in0 & nsel) | (in1 & sel0);

endmodule


module mux_4to1 (
    output out,input in0,in1,in2,in3,sel0,sel1
);

wire o0,o1;

mux_2to1 m0(o0,in0,in1,sel0);
mux_2to1 m1(o1,in2,in3,sel0);
mux_2to1 m2(out,o0,o1,sel1);
    
endmodule

module mux_8to1 (
    output out, input in0,in1,in2,in3,in4,in5,in6,in7,sel0,sel1,sel2
);

wire o0,o1;

mux_4to1 m0(o0,in0,in1,in2,in3,sel0,sel1);
mux_4to1 m1(o1,in4,in5,in6,in7,sel0,sel1);
// mux_2to1 m2(out,o0,o1,sel2);
mux_4to1 m2(.out(out),.in0(o0),.in1(o1),.sel0(sel2),.sel1(0));
    
endmodule


module mux_16to1 (
    output out,input in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,
    sel0,sel1,sel2,sel3
);

wire o0,o1,o2,o3;

mux_4to1 m0(o0,in0,in1,in2,in3,sel0,sel1);
mux_4to1 m1(o1,in4,in5,in6,in7,sel0,sel1);
mux_4to1 m2(o2,in8,in9,in10,in11,sel0,sel1);
mux_4to1 m3(o3,in12,in13,in14,in15,sel0,sel1);
mux_4to1 m4(out,o0,o1,o2,o3,sel2,sel3);
    
endmodule
