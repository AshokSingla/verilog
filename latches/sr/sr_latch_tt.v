// for the sake of using the same test bench clock is used which may be replaced by the enable as per the need in the scope of this file.

module sr_latch_tt ( 
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

module sr_latch_gates (
    q,qbar,s,r,clock
);
output q,qbar;
input s,r,clock;
wire sp,rp;


nand(sp,s,clock);
nand(rp,r,clock);
nand(q,sp,qbar);
nand(qbar,rp,q); 

endmodule

// The circuit used for the above latch is available at https://tse1.mm.bing.net/th?id=OIP.v-QPkEd_78iukAERZkI2tQAAAA&pid=Api&P=0
