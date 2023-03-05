module detector_111(out,current, in, clk,reset);

parameter no_1 = 2'b00, one_1 = 2'b01, two_1 = 2'b11, all_1 = 2'b10;

input in, clk, reset;
output out;
output reg [1:0] current;

reg [1:0] next;

assign out = current == all_1;

always @(negedge clk or negedge reset) begin
    if (reset)
    current = no_1;
    else
    current = next;
end

always @(current,in) begin
    case (current)
        no_1: next = in ? one_1:no_1;
        one_1: next = in? two_1:no_1;
        two_1: next = in? all_1:no_1;
        all_1: next = in? all_1:no_1; 
        default: next = no_1;
    endcase
end

endmodule