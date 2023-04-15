// Design a counter to count the sequence 11,26,20,18,9,3,7… and repeat.

module counter_special(output reg [5:0] out,
                       input clk);

parameter s11 = 6'b001011 , s26 = 6'b011010, s20 = 6'b010100, s18 = 6'b010010, s9 = 6'b001001, s3 = 6'b000011, s7 = 6'b000111;

always @ (negedge clk)
begin
    case (out)
        s11 : out <= s26;
        s26 : out <= s20;
        s20 : out <= s18;
        s18 : out <= s9;
        s9 : out <= s3;
        s3 : out <= s7;
        s7 : out <= s11;
        default: out <= s11;
    endcase
end

endmodule
