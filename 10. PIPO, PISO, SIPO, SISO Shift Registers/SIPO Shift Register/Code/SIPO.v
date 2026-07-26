module SIPO(
    input D,
    output Q0,Q1,Q2,Q3,
    input clk,
    input rst
);
    d_ff zeroeth(
        .clk(clk),.rst(rst),.d(D),.q(Q0)
    );

    d_ff first(
        .clk(clk),.rst(rst),.d(Q0),.q(Q1)
    );

    d_ff second(
        .clk(clk),.rst(rst),.d(Q1),.q(Q2)
    );

    d_ff third(
        .clk(clk),.rst(rst),.d(Q2),.q(Q3)
    );

endmodule