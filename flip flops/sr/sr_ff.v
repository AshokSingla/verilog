`include "sr_latch_tt.v"

module sr_ff_tt (
    output reg q,qbar,
    input s,r,clock
);

always @(posedge clock) begin
    $display($time);
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
    
endmodule

module sr_master_slave (
    output q,qbar,
    input s,r,clock
);

wire clockbar, tempq, tempqbar;
not (clockbar,clock);

sr_latch_gates f1(tempq,tempqbar,s,r,clock);
sr_latch_gates f2(q,qbar,tempq,tempqbar,clockbar);

// the master slave will give different outputs for the case "11" depending on the clocking.
// since the output varies in that case, we can explicitly say that the case is forbidden case.
    
endmodule
