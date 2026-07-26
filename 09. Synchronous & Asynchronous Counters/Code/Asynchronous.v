module async(
    input clk,
    input rst,
    output [3:0] Q
);
    
    d_ff b0(.clk(clk),.rst(rst),.q(Q[0]),.d(~Q[0]));
    d_ff b1(.clk(Q[0]),.rst(rst),.q(Q[1]),.d(~Q[1]));
    d_ff b2(.clk(Q[1]),.rst(rst),.q(Q[2]),.d(~Q[2]));
    d_ff b3(.clk(Q[2]),.rst(rst),.q(Q[3]),.d(~Q[3]));

endmodule