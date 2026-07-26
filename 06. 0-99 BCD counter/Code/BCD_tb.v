module BCD_tb;
  reg clk,rst;
  wire [3:0]tens,ones;

    bcd dut(
        .tens(tens),
        .ones(ones),
        .rst(rst),
        .clk(clk)
    );

initial 
    begin
        clk = 0;
        rst = 1;     
        #15;         
        rst = 0;    
    end 

    always #5 clk = ~clk;


    initial begin
        #10000;
        $finish;
    end

    initial begin
        $monitor("time: %4t \t number:%d%d", $time,tens, ones);
    end

endmodule