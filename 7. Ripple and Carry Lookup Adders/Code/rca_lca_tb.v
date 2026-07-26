`timescale 1ps/1ps
module testbench_rcacla();

    reg[3:0] rca_a;     
    reg[3:0] rca_b;   
    reg rca_cin;
    wire[3:0] rca_sum;
    wire rca_cout;

    reg[3:0] cla_a;     
    reg[3:0] cla_b;   
    reg cla_cin;
    wire[3:0] cla_sum;
    wire cla_cout;

    rca lol(
        .a(rca_a),.b(rca_b),.cin(rca_cin),
        .cout(rca_cout),.sum(rca_sum)
    );

    cla bruh(
        .a(cla_a),.b(cla_b),.cin(cla_cin),
        .cout(cla_cout),.sum(cla_sum)
        );

    initial begin
        $display("time|RCA:|a |b |cin|sum|cout||CLA:|a |b |cin|sum|cout");
        $monitor("%4t |    |%b|%b|%b |%b |%b  ||    |%b|%b|%b |%b |%b",
        $time,rca_a,rca_b,rca_cin,rca_sum,rca_cout,cla_a,cla_b,cla_cin,cla_sum,cla_cout);

            //0+0=0
            rca_a = 4'b0000; rca_b = 4'b0000; rca_cin = 1'b0;
            cla_a = 4'b0000; cla_b = 4'b0000; cla_cin = 1'b0;
            #10; // Wait 10 time units

            //5 + 3 + 0 = 8
            rca_a = 4'b0101; rca_b = 4'b0011; rca_cin = 1'b0;
            cla_a = 4'b0101; cla_b = 4'b0011; cla_cin = 1'b0;
            #10;

            //15 + 1 + 0 = 16 sum will be 0
            rca_a = 4'b1111; rca_b = 4'b0001; rca_cin = 1'b0;
            cla_a = 4'b1111; cla_b = 4'b0001; cla_cin = 1'b0;
            #10;

            // 7 + 7 + 1 = 15
            rca_a = 4'b0111; rca_b = 4'b0111; rca_cin = 1'b1;
            cla_a = 4'b0111; cla_b = 4'b0111; cla_cin = 1'b1;
            #10;

        $finish;
        end
endmodule