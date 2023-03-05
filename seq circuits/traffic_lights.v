module traffic_lights(lights,clock);
parameter sr = 2'b00, sy = 2'b01, sg = 2'b10;
parameter red = 3'b100, yellow = 3'b010, green = 3'b001;
input clock;
output reg [2:0]lights;

reg [1:0] current;  // assign some value if want to start from a particular state. default is green.

// always @(posedge clock) begin
//     case (current)
//         sr:begin
//             lights = green;
//             current = sg;
//         end 

//         sy: begin
//             lights = red;
//             current = sr;
//         end

//         sg: begin
//             lights = yellow;
//             current = sy;
//         end
        
//         default: begin
//             lights = green;
//             current = sg;
//         end
//     endcase
// end

// both the ways are fine, it is just the way of writting and grouping which is shown here from 2 POVs.

always @(posedge clock) begin   // compute state on clock posedge
    case (current)
        sr:current = sg;
        sy:current = sr; 
        sg:current = sy;
        default: current = sg;
    endcase
end

always @(current) begin         // based on state show lights
    case (current)
        sr: lights = red;
        sy: lights = yellow;
        sg: lights = green; 
        default: lights = green;
    endcase
end

endmodule