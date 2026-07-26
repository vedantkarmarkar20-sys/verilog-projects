`timescale 1ps/1ps
module PISO_tb;
    reg [3:0] d;
    reg clk,rst,shift;
    wire q;

    PISO dut(
        .D0(d[0]),.D1(d[1]),.D2(d[2]),.D3(d[3]),
        .clk(clk),.rst(rst),.shift(shift),
        .Q(q)
    );

    always #5 clk=~clk;

    initial 
    begin
        $display("Time\tD\tQ");
        $monitor("%4t\t %b\t %b", $time,d, q); 
        shift=1;
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

        shift=0;

        #10 d=4'b1000;
        #10 d=4'b1001;
        #10 d=4'b1010;
        #10 d=4'b1011;
        #10 d=4'b1100;
        #10 d=4'b1101;
        #10 d=4'b1110;
        #10 d=4'b1111;

        $finish;
    end

endmodule