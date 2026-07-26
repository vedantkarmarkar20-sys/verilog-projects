    module sync(
        input clk,
        input rst,
        output [3:0] Q
    );
        wire d0, d1, d2, d3;
        wire en1, en2;

        assign d0 = ~Q[0];
        assign d1 = Q[1] ^ Q[0];

        assign en1 = Q[1] & Q[0];
        assign d2 = Q[2] ^ en1; //only be 1 when either q[2] or en1 is 0

        assign en2 = Q[2] & en1; 
        assign d3 = Q[3] ^ en2; //only be 1 when either q[3] or en2 is 0

        //en1 will only be 1 when q0 and q1 are one and same for en2 w/ q1 with all q0 q1 and q2

        d_ff b0 (.clk(clk), .rst(rst), .q(Q[0]), .d(d0));
        d_ff b1 (.clk(clk), .rst(rst), .q(Q[1]), .d(d1));
        d_ff b2 (.clk(clk), .rst(rst), .q(Q[2]), .d(d2));
        d_ff b3 (.clk(clk), .rst(rst), .q(Q[3]), .d(d3));

    endmodule