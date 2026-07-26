    module USR(
        input D0,D1,D2,D3,
        input [1:0]sel,
        input R,
        input L,
        output [3:0] Q,

        input rst,clk
    );
        /*
        thr r 3 ways to load data:
        parellaly from D bits and serially from R, and L
        four modes  
        00=hold
        01=left shift
        10=right shift
        11=load from external input
        */
        wire m0,m1,m2,m3;
        four21mux mux0
            (
            .sel(sel),
            .a(Q[0]), // o/p of the ff routed to a of mux to hold
            .b(L), //load from L
            .c(Q[1]),//next input routed back
            .d(D0),
            .y(m0)
            );

        d_ff ff0
            (
            .d(m0), //input from mux
            .q(Q[0]),
            .rst(rst),
            .clk(clk));

        four21mux mux1(.sel(sel),.a(Q[1]), .b(Q[0]),.c(Q[2]),.d(D1),.y(m1));
        d_ff ff1(.d(m1),.q(Q[1]),.rst(rst),.clk(clk));

        four21mux mux2(.sel(sel),.a(Q[2]), .b(Q[1]),.c(Q[3]),.d(D2),.y(m2));
        d_ff ff2(.d(m2),.q(Q[2]),.rst(rst),.clk(clk));

        four21mux mux3(.sel(sel),.a(Q[3]), .b(Q[2]),
                    .c(R), //load from R
                    .d(D3),.y(m3));
        d_ff ff3(.d(m3),.q(Q[3]),.rst(rst),.clk(clk));

    endmodule



        



