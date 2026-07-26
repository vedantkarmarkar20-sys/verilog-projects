`timescale 1ps/1ps
module PIPO_tb;
    reg [3:0] d;
    reg clk,rst;
    wire q0,q1,q2,q3;

    PIPO dut(
        .d0(d[0]),.d1(d[1]),.d2(d[2]),.d3(d[3]),
        .clk(clk),.rst(rst),
        .q0(q0),.q1(q1),.q2(q2),.q3(q3)
    );

    always #5 clk=~clk;

    initial 
    begin
        $display("Time\tD\tQ");
        $monitor("%4t\t %b\t %b%b%b%b", $time,d, q3,q2,q1,q0); 
        clk=0;
        rst=1;
        d=4'b0000;
        #15 rst=0;
        #10 d=4'b0001;
        #10 d=4'b0010;
        #10 d=4'b0011;
        #10 d=4'b0100;
        #10 d=4'b0101;
        #10 d=4'b0110;
        #10 d=4'b0111;
        #10 d=4'b1000;
        #10 d=4'b1001;
        #10 d=4'b1010;
        #10 d=4'b1011;
        #10 d=4'b1100;
        #10 d=4'b1101;
        #10 d=4'b1110;
        #10 d=4'b1111;
        #50000;
        
        $finish;
    end
endmodule


