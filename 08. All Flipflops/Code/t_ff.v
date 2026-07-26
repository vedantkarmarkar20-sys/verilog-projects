`timescale 1ps/1ps
module t_ff(
    input rst,
    input clk,
    input t,
    output reg q 
);
    always @(posedge clk) 
    begin
        if (rst)
            q <= 1'b0;
        else if (t)
            q <= ~q;
    end
endmodule