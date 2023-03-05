module serial_adder(out,in1,in2,clk,reset);
parameter zero = 1'b0, one = 1'b1;
output reg out;
input in1,in2,clk,reset;

reg carry;

always @(posedge clk or negedge reset) begin
    if (!reset)
    begin
        carry = zero;
        out = 0;
    end
    else
    case (carry)
        zero:
        begin
            case ({in1,in2})
                2'b00: begin
                    carry = zero;
                    out = 0; 
                end
                2'b01:
                begin
                    carry = zero;
                    out = 1;
                end
                2'b10:
                begin
                    carry = zero;
                    out = 1;
                end
                2'b11:
                begin
                    carry = one;
                    out = 0;
                end
                default: begin
                    carry = zero;
                    out = 0; 
                end
            endcase
        end
        one:
        begin
            case ({in1,in2})
                2'b00:
                begin
                    carry = zero;
                    out = 1; 
                end 
                2'b01:
                begin
                    carry = one;
                    out = 0; 
                end
                2'b10:
                begin
                    carry = one;
                    out = 0; 
                end
                2'b11:
                begin
                    carry = one;
                    out = 1; 
                end
                default: begin
                    carry = zero;
                    out = 0; 
                end
            endcase
        end
        default: carry = zero;
    endcase
end
endmodule