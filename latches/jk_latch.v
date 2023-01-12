module jk_latch_tt (
    output reg q,qbar, input j,k,clock
);

always @(clock) begin
    if (clock == 1)
    begin
        case ({j,k})
            2'b00:
            begin
                q = q;
                qbar = qbar;
            end 
            2'b10:
            begin
                q = 1'b1;
                qbar = 1'b0;
            end
            2'b01:
            begin
                q = 1'b0;
                qbar = 1'b1;
            end
            2'b11:
            begin
                q = ~q;
                qbar = ~qbar;
            end
        endcase
    end
end
    
endmodule


module jk_latch_gates (output q,qbar, input j,k,clock);

wire jp,kp;

nand (jp,j,clock,qbar);
nand (kp,k,clock,q);
nand (q,jp,qbar);
nand (qbar,kp,q);

endmodule