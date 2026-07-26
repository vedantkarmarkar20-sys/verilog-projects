//4 bit bin-gray and gray-bin converter

module converter(
    input [3:0] gray,
    input [3:0] binary,
    input sel,//1=bin-gray,2=gray-bin

    output reg [3:0] out
);

integer i; //when reg[1:0] i is used program doesnt run 

    always@(*) 
    begin
        case (sel) 
            1'b0: //bin-gray
            out=binary^(binary>>1); //current dig xor w next dig
            1'b1: //gray-bin
            begin
                
                out[3]=gray[3]; //MSB=MSB
                for(i=2;i>=0;i=i-1) out[i]=out[i+1]^gray[i]; 
                
            end
        endcase
    end
endmodule

