// Design a counter to count the sequence 0,7,14,21,28,35,42,49,56,63 and repeat.

// biggest number 63 needs minimum 6 bits

// Any number not in the above mentioned numbers will return to state 0 in next cycle.
module counter_table_7(output reg [5:0] out,
                       input clk, reset);
parameter s0 = 6'b000000, s7 = 6'b000111, s14 = 6'b001110, s21 = 6'b010101, s28 = 6'b011100,
        s35 = 6'b100011, s42 = 6'b101010, s49 = 6'b110001, s56 = 6'b111000, s63 = 6'b111111;

always @(posedge reset or negedge clk) begin
    if (reset)
    out <= s0;
    else
    begin
        case (out)
            s0 : out <= s7;
            s7 : out <= s14;
            s14: out <= s21;
            s21: out <= s28;
            s28: out <= s35;
            s35: out <= s42;
            s42: out <= s49;
            s49: out <= s56;
            s56: out <= s63;
            s63: out <= s0; 
            default: out <= s0;
        endcase
    end
end
endmodule