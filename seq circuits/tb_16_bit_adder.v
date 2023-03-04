module alutest;
reg [15:0] X, Y;

wire[15:0] Z; wire S, ZR, CY, P, OF;
alu dut (Z,X,Y,S,ZR,P,CY,OF);
initial

begin

$dumpfile ("alu.vcd");
$dumpvars (0,alutest);

$monitor ($time," X=%h, Y=%h, Z=%h, S=%b, Z=%b, CY=%b, P=%b,OF=%b", X, Y, Z, S, ZR, CY, P, OF);

#5 X = 16'h8fff; Y = 16'h8000;

#5 X = 16'hfffe; Y = 16'h0002;

#5 X = 16'hAAAA; Y = 16'h5555;

#5 $finish;
 
end
endmodule