// Design a 8-bit ripple carry adder using two 4-bit ripple carry adders.

module full_adder(output sum, carry,
                  input a,b,cin);
wire pre_s, pre_c_0, pre_c_1;

xor (pre_s, a ,b);
and (pre_c_0, a, b);
xor (sum, pre_s, cin);
and (pre_c_1, pre_s, cin);
or (carry, pre_c_0, pre_c_1);
endmodule

module adder_4(output [3:0]sum,
               output carry,
               input [3:0] a,b,
               input cin);

wire [2:0] temp_carry;

full_adder f0(sum[0],temp_carry[0],a[0],b[0],cin);
full_adder f2(sum[1],temp_carry[1],a[1],b[1],temp_carry[0]);
full_adder f3(sum[2],temp_carry[2],a[2],b[2],temp_carry[1]);
full_adder f4(sum[3],carry,a[3],b[3],temp_carry[2]);
endmodule

module adder_8(output [7:0] sum,
               output carry,
               input [7:0] a,b,
               input cin);

wire t_c;
adder_4 a0(sum[3:0],t_c, a[3:0], b[3:0],cin);
adder_4 a1(sum[7:4],carry, a[7:4], b[7:4],t_c);

endmodule