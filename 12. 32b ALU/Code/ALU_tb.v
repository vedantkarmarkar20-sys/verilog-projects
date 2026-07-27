
`timescale 1ps / 1ps
module ALU_tb;
    reg [31:0] A,B;
    reg [3:0] sel;
    wire [31:0] Q;
    wire zero;

    ALU dut(
        .A(A),
        .B(B),
        .sel(sel),
        .Q(Q),
        .zero(zero)
    );

    initial begin
        $monitor("A: %d, B: %d, sel: %d, Q: %d, zero: %d", A, B, sel, Q, zero);
        A = 32'b0;
        B = 32'b0;
        sel = 4'b0;
        #10000 $finish;
    end

    always #10 sel = sel + 1;
    always #5 A = A + 1;
    always #7 B = B + 1;

endmodule