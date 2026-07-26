`timescale 1ps/1ps

module SISO_tb;

    reg clk,rst,D;
    wire Q;

    SISO uut(
        .clk(clk),.rst(rst),.D(D),.Q(Q)
    );
    always #5 clk=~clk;
    initial begin
        $monitor("time: %4t \t D:%b \t Q:%b", $time,D,Q);
        clk=0;
        rst=1;D=0;
        #10 rst=0;D=1;
        #10 D=0;
        #10 D=1;
        #10 D=0;
        #10 D=1;
        #10 D=0;
        #10 D=1;
        #10 D=0;
        #1000 $finish;
    end
endmodule