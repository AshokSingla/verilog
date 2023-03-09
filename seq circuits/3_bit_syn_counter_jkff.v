module jk_ff(q,j,k,clk,reset);
input j,k,clk,reset;
output reg q;
// output qbar;

// assign qbar = ~q;

always @(posedge clk or negedge reset)
begin 
    if (!reset)
    begin
        q = 1'b0;
    end
    else
        case ({j,k})
            2'b00:begin
                 q = q;
                //  $display("00");
            end
            2'b01: q = 1'b0;
            2'b10: q = 1'b1;
            2'b11:begin
                 q = ~q;
                //  $display("11");
            end
        endcase
end
endmodule



module syn_counter_3bit(q,clk, reset,mode);
input clk, reset,mode;
output [2:0] q;
wire j2 = (~q[1]&~q[0]&~mode)|(q[1]&q[0]&mode);
wire k2 = (~q[1]&~q[0]&~mode)|(q[1]&q[0]&mode);
wire j1 = q[0]~^mode;
wire k1 = q[0]~^mode;
wire j0 = 1'b1;
wire k0 = 1'b1;
// better do the marking 2-0 as in notebook. Else unwanted result may come.
jk_ff f1(q[0],j0,k0,clk,reset);
jk_ff f2(q[1],j1,k1,clk,reset);
jk_ff f3(q[2],j2,k2,clk,reset);
endmodule