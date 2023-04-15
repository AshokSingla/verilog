// Design a 32 to 1 MUX with active high enable.

// 32 inputs so need 5 select lines.

module mux_32_direct(output out,
                     input [31:0] in,
                     input [4:0] sel,
                     input enable);

wire t_out;

assign out = enable & t_out;

assign t_out = 
sel[4] ? (
    s[3] ? (
        s[2] ? (
            s[1] ? (
                s[0] ? (in[1]) : (in[0])    
            ) : (
                s[0] ? (in[3]) : (in[2])
            )
        ) : (
            s[1] ? (
                s[0] ? (in[5]) : (in[4])
            ) : (
                s[0] ? (in[7]) : (in[6])
            )
        )
    ):(
        s[2] ? (
            s[1] ? (
                s[0] ? (in[9]) : (in[8])
            ) : (
                s[0] ? (in[11]) : (in[10])
            )
        ) : (
            s[1] ? (
                s[0] ? (in[13]) : (in[12])
            ) : (
                s[0] ? (in[15]) : (in[14])
            )
        )
    )
) : (
    s[3] ? (
        s[2] ? (
            s[1] ? (
                s[0] ? (in[17]) : (in[16])
            ) : (
                s[0] ? (in[19]) : (in[18])
            )
        ) : (
            s[1] ? (
                s[0] ? (in[21]) : (in[20])
            ) : (
                s[0] ? (in[23]) : (in[22])
            )
        )
    ):(
        s[2] ? (
            s[1] ? (
                s[0] ? (in[25]) : (in[24])
            ) : (
                s[0] ? (in[27]) : (in[26])
            )
        ) : (
            s[1] ? (
                s[0] ? (in[29]) : (in[28])
            ) : (
                s[0] ? (in[31]) : (in[30])
            )
        )
    )
);


/*
could have completed in 1 go by writing

assign t_out = in[sel];

*/

endmodule