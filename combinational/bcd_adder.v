module bcd_adder(out,a,b,cin);
supply0 gnd;
input cin;
input [3:0] a,b;
output [7:0] out;
wire [3:0]add;
wire [4:0] temp = a+b+cin;

// assign out = (temp > 9) ? (temp + 4'b0110) : (temp);        // will take too much hardware (1mux, 1 5bit comparator, 1adder)

// get carry for bcd;
assign c_bcd = temp[4] | (temp[3]&(temp[2] | temp[1]));
// assign add = c_bcd ? 4'b0110 : 4'b0000;


// used only a mux and adder and a few gates

// the mux can be removed by writting the above add as below;
assign add[2:1] = c_bcd;
assign add[3] = gnd;
assign add[0] = gnd;

assign out = temp + add;

endmodule