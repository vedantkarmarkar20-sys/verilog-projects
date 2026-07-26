`timescale 1ns / 1ps

module gates_tb;

    reg tb_a;
    reg tb_b;
  
    wire tb_out_and;
    wire tb_out_or;
    wire tb_out_not_a;
    wire tb_out_nand;
    wire tb_out_nor;
    wire tb_out_xor;
    wire tb_out_xnor;

    gates gates(
        .a(tb_a),
        .b(tb_b),
        .out_and(tb_out_and),
        .out_or(tb_out_or),
        .out_not_a(tb_out_not_a),
        .out_nand(tb_out_nand),
        .out_nor(tb_out_nor),
        .out_xor(tb_out_xor),
        .out_xnor(tb_out_xnor)
    );

    initial begin
        // header
        $display("Time | a | b | AND | OR | NOT_a | NAND | NOR | XOR | XNOR");
        $monitor("%4t | %b | %b |  %b  |  %b |   %b   |   %b  |  %b  |  %b  |   %b", 
                 $time, tb_a, tb_b, tb_out_and, tb_out_or, tb_out_not_a, tb_out_nand, tb_out_nor, tb_out_xor, tb_out_xnor);

        //all combos w/ 10ns delay
        tb_a = 0; tb_b = 0; #10;
        tb_a = 0; tb_b = 1; #10;
        tb_a = 1; tb_b = 0; #10;
        tb_a = 1; tb_b = 1; #10;

        $finish;
    end

endmodule
