`include "sr_ff.v"
`include "d_latch.v"

module d_ff_tt(output reg q,qbar, input d, clock);

always @(posedge clock) begin
    q = d;
    qbar = ~d;
end
endmodule



module d_ff_sr(output q,qbar, input d, clock);

sr_ff_tt s(q,qbar,d,~d,clock);

endmodule



module d_master_slave(q,qbar,d,clock);
output q,qbar;
input d, clock;

wire nclock,tempq,tempqbar;
not (nclock,clock);

d_latch_gates d1(tempq,tempqbar,d,nclock);
d_latch_gates d2(q,qbar,tempq,clock);

endmodule
