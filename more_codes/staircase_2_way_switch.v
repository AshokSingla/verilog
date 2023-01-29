module switch_2_way (
    output reg out,
    input in1,in2
);

always @(*) begin
    case({in1,in2})
    2'b00: out = 1'b0;
    2'b01: out = 1'b1;
    2'b10: out = 1'b1;
    2'b11: out = 1'b0;
    default: out = 1'bx;    
    endcase
end
    
endmodule

module switch ( // without using reg
    output out,
    input in1,in2
);

assign out = in1^in2;

endmodule
