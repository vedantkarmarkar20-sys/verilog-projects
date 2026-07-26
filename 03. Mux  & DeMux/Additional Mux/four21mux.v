module four21mux(
    input a,b,c,d,
    output y,
    input [1:0] sel
);

    assign y=(sel==2'b00)?a:
             (sel==2'b01)?b:
             (sel==2'b10)?c:
             (sel==2'b11)?d:0;

endmodule

                      
         