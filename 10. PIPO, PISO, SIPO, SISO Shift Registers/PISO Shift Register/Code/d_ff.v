`timescale 1ps/1ps

module d_ff(
    input rst,
    input clk,
    input d,
    output reg q
);
    always @(posedge clk) 
    begin
        if (rst) 
            q <= 1'b0;
        else 
            q <= d;
    end
endmodule