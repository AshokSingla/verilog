// Design a 8-bit ripple carry adder/subtractor circuit.

// if mode = 0, circuit is a adder circuit
// if mode = 1, circuit is a subtractor circuit

module add_sub_circuit(output o8,
                       output [7:0] o,
                       input [7:0] a, b,
                       input mode);

wire [7:0] b_after_mode;
wire [6:0] temp_carry;
assign b_after_mode[0] = mode ^ b[0];
assign b_after_mode[1] = mode ^ b[1];
assign b_after_mode[2] = mode ^ b[2];
assign b_after_mode[3] = mode ^ b[3];
assign b_after_mode[4] = mode ^ b[4];
assign b_after_mode[5] = mode ^ b[5];
assign b_after_mode[6] = mode ^ b[6];
assign b_after_mode[7] = mode ^ b[7];

full_adder f0(o[0],temp_carry[0],a[0],b_after_mode[0],mode);
full_adder f1(o[1],temp_carry[1],a[1],b_after_mode[1],temp_carry[0]);
full_adder f2(o[2],temp_carry[2],a[2],b_after_mode[2],temp_carry[1]);
full_adder f3(o[3],temp_carry[3],a[3],b_after_mode[3],temp_carry[2]);
full_adder f4(o[4],temp_carry[4],a[4],b_after_mode[4],temp_carry[3]);
full_adder f5(o[5],temp_carry[5],a[5],b_after_mode[5],temp_carry[4]);
full_adder f6(o[6],temp_carry[6],a[6],b_after_mode[6],temp_carry[5]);
full_adder f7(o[7],o8,a[7],b_after_mode[7],temp_carry[6]);

endmodule

module full_adder(output sum, carry,
                  input a,b,cin);
wire pre_s, pre_c_0, pre_c_1;

xor (pre_s, a ,b);
and (pre_c_0, a, b);
xor (sum, pre_s, cin);
and (pre_c_1, pre_s, cin);
or (carry, pre_c_0, pre_c_1);
endmodule