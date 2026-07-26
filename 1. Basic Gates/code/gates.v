`timescale 1ns / 1ps

module gates (
    input wire a,
    input wire b,
    output wire out_and,
    output wire out_or,
    output wire out_not_a, 
    output wire out_nand,
    output wire out_nor,
    output wire out_xor,
    output wire out_xnor
);
    assign out_and=a & b;
    assign out_or=a|b;
    assign out_not_a=~a;
    assign out_nand=~(a & b);
    assign out_nor=~(a|b);
    assign out_xor= a^b;
    assign out_xnor=~(a^b); 

endmodule
