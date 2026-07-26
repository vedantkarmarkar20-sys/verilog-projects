module SISO(
    input clk,
    input rst,
    input D,
    output Q
);

    wire q0,q1,q2;

    d_ff zeroeth(
        .d(D),.q(q0),.clk(clk),.rst(rst)
    );

    d_ff first(
        .d(q0),.q(q1),.clk(clk),.rst(rst)
    );

    d_ff second(
        .d(q1),.q(q2),.clk(clk),.rst(rst)
    );

    d_ff third(
        .d(q2),.q(Q),.clk(clk),.rst(rst)
    );

endmodule