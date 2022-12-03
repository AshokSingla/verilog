module test_ma_sequence; 
reg [0:31] Input;
output [0:31] Result;
output [0:2] State;

seq_det_1011_nov sd ( 
.input_seq(Input),
.output_seq(Result),
.present_state(State)
); 

initial begin 
    Input = 32'b1011_1011_0110_0000_101x_x000_1010_1101;
        //  ov  0001_0001_0010_0000_0000_0000_0000_0100
        // nov  0001_0001_0000_0000_0000_0000_0000_0100
    $monitor ($time," output = %b, state = %b", Result, State);
end 

endmodule