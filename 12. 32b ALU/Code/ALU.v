`timescale 1ps / 1ps


/*
32b ALU for RISC-V core
will be able to do 

arithmetic:addition,subtraction

logical:and,or,xor

logical shift:left,right

arithmetic shift:right 
cus in arithmetic rs, the sign is preserved ie- the sign bit is copied to the leftmost bits of the result
eg- 1100 0000 >> 2 = 1111 0000
no need for arithmetic shift left as shifting left is like x2 and all x2 numbers are even and even numbers have 0 as their LSB

set less than: signed and unsigned

*/



module ALU (
    input wire [31:0]A,
    input wire [31:0]B,
    input wire [3:0]sel,
    output reg  [31:0]Q,
    output reg zero
);

    always @(*) begin
        case(sel)
            4'b0000: Q = A+B; 
            4'b0001: Q = A-B;

            4'b0010: Q = A&B;
            4'b0011: Q = A|B;
            4'b0100: Q = A^B;

            //in shift, a is the data and b is just the control, so we only need 5 lsb of bas 2^5 = 32

            //logical shift
            4'b0101: Q = A<<B[4:0]; //only need 5 bits 
            4'b0110: Q = A>>B[4:0]; 

            //arithmetic shift
            4'b0111: Q = $signed(A) >>> B; //$signed tells verilog to look at the number as twos complement

            4'b1000: Q = ($signed(A) < $signed(B)) ? 32'b1 : 32'b0; //checks magnitude and sign
            
            4'b1001: Q = (A < B) ? 32'b1 : 32'b0; //only check the magnitude

            default: Q = 32'b0; 
        endcase
        
        zero = (Q == 32'b0) ? 1'b1 : 1'b0; 
    end

endmodule