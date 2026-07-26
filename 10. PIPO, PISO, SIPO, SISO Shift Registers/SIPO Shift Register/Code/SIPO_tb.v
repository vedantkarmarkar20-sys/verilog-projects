`timescale 1ps/1ps

module SIPO_tb();
    reg D,clk,rst;
    wire Q0,Q1,Q2,Q3;

    SIPO uut(
        .D(D),.clk(clk),.rst(rst),
        .Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3)
    );

    initial begin
        clk = 0;
        rst = 1;
        D = 0;
        #15;
        rst = 0;
    end

    always #5 clk = ~clk;

    initial 
    begin

        $monitor("time: %4t \t D:%b \t Q:%b%b%b%b", $time,D,Q0,Q1,Q2,Q3);

        #10 D = 0;
        #10 D = 0;
        #10 D = 0;
        #10 D = 1;

        #10 D = 0;
        #10 D = 0;
        #10 D = 1;
        #10 D = 0;

        #10 D = 0;
        #10 D = 0;
        #10 D = 1;
        #10 D = 1;

        #10 D = 0;
        #10 D = 1;
        #10 D = 0;
        #10 D = 0;

        #500;
        $finish;

    end

endmodule   