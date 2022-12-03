module seq_det_1011_ov (
    input_seq, output_seq, present_state
);

input [0:31] input_seq;
output reg [0:31] output_seq;
output reg [0:2] present_state;
reg [0:2] next_state;
integer n, m;

parameter s0 = 3'b000;  // no bit
parameter s1 = 3'b001;  // 1 detected
parameter s2 = 3'b010;  // 10 detected
parameter s3 = 3'b011;  // 101 detected
parameter s4 = 3'b100;  // 1011 detected

initial 
begin
    n = -1;
    present_state = s0;
    next_state = s0;
    #1;
    while (n<31)
    begin
        #2;
        case (present_state)
            s0:
            begin
                if (input_seq[n+1] == 1)
                next_state = s1;
                else if (input_seq[n+1] == 0)
                next_state = s0;
                else
                next_state = s0;
            end 

            s1:
            begin
                if (input_seq[n+1] == 1)
                next_state = s1;
                else if (input_seq[n+1] == 0)
                next_state = s2;
                else
                next_state = s0;
            end

            s2:
            begin
                if (input_seq[n+1] == 1)
                next_state = s3;
                else if (input_seq[n+1] == 0)
                next_state = s0;
                else
                next_state = s0;
            end

            s3:
            begin
                if (input_seq[n+1] == 1)
                next_state = s4;
                else if (input_seq[n+1] == 0)
                next_state = s2;
                else
                next_state = s0;
            end
            
            s4:
            begin
                if (input_seq[n+1] == 1)
                next_state = s1;
                else if (input_seq[n+1] == 0)
                next_state = s2;
                else
                next_state = s0;
            end 
        endcase
        n = n +1;
    end
end

always @(n) 
begin
    $display();
    $display($time, " n = %d", n);
    present_state = next_state;
    if (present_state == s4)
    output_seq[n] = 1;
    else
    output_seq[n] = 0;
end
    
endmodule