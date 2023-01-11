module d_latch_tt (
    q,qbar,d,clock
);

output reg q,qbar;
input d,clock;

always @(clock == 1) begin
    q = d;
    qbar = ~d;
end
    
endmodule

module d_latch_gates (
    output q,qbar,input d,clock
);

wire dp,dbp,nd; //dprime, dbarprime, negd
not (nd,d);

nand(dp,d,clock);
nand(dbp,nd,clock);
nand(q,dp,qbar);
nand(qbar,dbp,q);
    
endmodule