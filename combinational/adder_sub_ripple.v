`include "4bit_adder.v"
module adder_subtractor (output [3:0]out, output car_bor, input [3:0]a,b, input initial_car_bor); 
// if use as adder, initial_car_bor = 0, else 1 for use as subtractor
wire [3:0]tempb;
xor (tempb[0],b[0],initial_car_bor);
xor (tempb[1],b[1],initial_car_bor);
xor (tempb[2],b[2],initial_car_bor);
xor (tempb[3],b[3],initial_car_bor);
ripple_carry_adder r(out, car_bor,a,tempb,initial_car_bor);

endmodule