module PISO(
    input D0,D1,D2,D3,
    input clk,
    input rst,
    output Q,
    input shift
);
    wire d1,d2,d3;
    wire qa,qb,qc;
    
    //first ff directly takes inpput from d0, only 3 mux required
    d_ff zeroeth(
        .clk(clk),.rst(rst),.q(qa),.d(D0)
    );

    two21mux mux1(
        .sel(shift),.b(qa),.a(D1),.y(d1)
    );

    d_ff first(
        .clk(clk),.rst(rst),.q(qb),.d(d1)
    );

    two21mux mux2(
        .sel(shift),.b(qb),.a(D2),.y(d2)
    );

    d_ff second(
        .clk(clk),.rst(rst),.q(qc),.d(d2)
    );

    two21mux mux3(
        .sel(shift),.b(qc),.a(D3),.y(d3)
    );

    d_ff third(
        .clk(clk),.rst(rst),.q(Q),.d(d3)
    );

    //last ff directly gives o/p

endmodule








