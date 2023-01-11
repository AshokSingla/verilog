module sr_latch (
    q,qbar,s,r,clock
);
    // truth table based
output reg q,qbar;
input s,r,clock;

always @(clock) begin
    if (clock == 1)
    begin
        case ({s,r})
            2'b01:begin
                qbar = 1;
                q = 0;
            end 
            2'b10:begin
                qbar = 0;
                q = 1;
            end
            2'b11:begin
                qbar = 1'bx;
                q = 1'bx;
            end
            2'b00:begin
                qbar = qbar;
                q = q;
            end
        endcase
    end
end
    
endmodule
