//Parallel in Parelel out

module PIPO(
    input d0,d1,d2,d3,
    input clk,
    input rst,

    output q0,q1,q2,q3
);

    d_ff zeroth(
        .d(d0),.q(q0),.clk(clk),.rst(rst)
    );

    d_ff first(
        .d(d1),.q(q1),.clk(clk),.rst(rst)
    );

    d_ff second(
        .d(d2),.q(q2),.clk(clk),.rst(rst)
    );

    d_ff third(
        .d(d3),.q(q3),.clk(clk),.rst(rst)
    );

endmodule



