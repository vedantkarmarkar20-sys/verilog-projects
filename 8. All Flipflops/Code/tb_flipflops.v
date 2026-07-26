`timescale 1ps/1ps

module tb_ff();
    reg clk;
    reg rst; 
    reg s, r, j, k, d, t;
    wire q_d, q_t, q_sr, q_jk;

    
    d_ff dut1(
        .clk(clk), .rst(rst), .d(d), .q(q_d)
    );
    t_ff dut2(
        .clk(clk), .rst(rst), .t(t), .q(q_t)
    );
    sr_ff dut3(
        .clk(clk), .rst(rst), .s(s), .r(r), .q(q_sr)
    );
    jk_ff dut4(
        .clk(clk), .rst(rst), .j(j), .k(k), .q(q_jk)
    );

    always #5 clk = ~clk;

    initial begin
       
        clk = 0;
        rst = 1; 
        d = 0; t = 0; 
        s = 0; r = 0; 
        j = 0; k = 0;

        $display("Time | rst | clk | d | q_d || t | q_t || s | r | q_sr || j | k | q_jk");
        $monitor("%4t |  %b  |  %b  | %b |  %b  || %b |  %b  || %b | %b |  %b   || %b | %b |  %b", 
             $time, rst, clk, d, q_d, t, q_t, s, r, q_sr, j, k, q_jk);
                 
        #7 rst = 0; 

        #1 // time=8 so its before time=10 which is a clock cycle
        d = 1; t = 1;
        s = 0; r = 1;      
        j = 0; k = 1;  
        
        #10 // time=18
        d = 0; t = 0; 
        s = 1; r = 0;       
        j = 1; k = 0;
        
        #10 // time=28
        d = 1; t = 1;       
        s = 1; r = 1;       
        j = 1; k = 1;       
        
        #10 //  time=38
        d = 0; t = 0;       
        s = 0; r = 0;       
        j = 0; k = 0;       

        #15 //3 cycle delay
        
        $finish;       
    end

endmodule