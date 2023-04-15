// Design a 8-bit ripple carry adder.

module full_adder(output sum, carry,
                  input a,b,cin);
wire pre_s, pre_c_0, pre_c_1;

xor (pre_s, a ,b);
and (pre_c_0, a, b);
xor (sum, pre_s, cin);
and (pre_c_1, pre_s, cin);
or (carry, pre_c_0, pre_c_1);
endmodule

module adder_8(output [7:0]sum,
               output carry,
               input [7:0] a,b,
               input cin);

wire [6:0] temp_carry;

full_adder f0(sum[0],temp_carry[0],a[0],b[0],cin);
full_adder f2(sum[1],temp_carry[1],a[1],b[1],temp_carry[0]);
full_adder f3(sum[2],temp_carry[2],a[2],b[2],temp_carry[1]);
full_adder f4(sum[3],temp_carry[3],a[3],b[3],temp_carry[2]);
full_adder f5(sum[4],temp_carry[4],a[4],b[4],temp_carry[3]);
full_adder f1(sum[5],temp_carry[5],a[5],b[5],temp_carry[4]);
full_adder f6(sum[6],temp_carry[6],a[6],b[6],temp_carry[5]);
full_adder f7(sum[7],carry,a[7],b[7],temp_carry[6]);
endmodule