`timescale 1ps/1ps
module counterstb2;
reg clk;
reg rst;

//Sync
wire [3:0] sync_Q;
//async
wire [3:0] async_Q;

async dut2(.clk(clk),.rst(rst),.Q(async_Q));
sync dut3(.clk(clk),.rst(rst),.Q(sync_Q));

always #5 clk=~clk;

initial 
begin
    clk=0;
    rst=1;
    #15 rst=0;
    
    $display("Time\tAsync\t Sync");
  
    $monitor("%4t\t %b\t %b", $time, async_Q, sync_Q);  

    #500;
    
    $finish;
end

endmodule