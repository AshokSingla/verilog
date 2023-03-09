module t_ff(out,in,clk,reset);
input in,clk,reset;
output reg out;

always @(negedge clk or posedge reset)
begin
    out = reset ? 1'b0:(in?~out:out);
end

endmodule


module t_ff_ps(out,in,clk,preset);
input in,clk,preset;
output reg out;

always @(negedge clk or posedge preset)
begin
    out = preset ? 1'b1:(in?~out:out);
end

endmodule


module counter_mod6_up(out,clk,reset);
input clk,reset;
output [2:0]out;

assign rp = reset | out[2]&out[1]; // reset for value 6 and 7. Also could have used wor reset in place.

t_ff f0(out[0],1'b1,clk,rp);
t_ff f1(out[1],1'b1,out[0],rp);
t_ff f2(out[2],1'b1,out[1],rp);

endmodule


module counter_mod5_down(out,clk,preset);
input clk,preset;
output [2:0] out;

wire rp = preset | ((~out[2])&(~out[0] | ~out[1])); // preset for 2,1,0

t_ff_ps f0(out[0],1'b1,clk,rp);
t_ff_ps f1(out[1],1'b1,~out[0],rp);
t_ff_ps f2(out[2],1'b1,~out[1],rp);

endmodule