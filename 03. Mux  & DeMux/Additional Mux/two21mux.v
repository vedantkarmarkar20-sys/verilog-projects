module two21mux(
    input a,b,
    output y,
    input sel
);
    assign y=(sel==0)?a:b;
endmodule
    