`timescale 1ps/1ps

module encoder(
    input[7:0] in,
    output[2:0] out
);
    assign out =     (in[7]==1) ? 3'd7 :
                    (in[6]==1) ? 3'd6 :
                    (in[5]==1) ? 3'd5 :
                    (in[4]==1) ? 3'd4 :
                    (in[3]==1) ? 3'd3 :
                    (in[2]==1) ? 3'd2 :
                    (in[1]==1) ? 3'd1 :
                                3'd0;
endmodule


module decoder(
    input[2:0] in,
    output reg [7:0] out
);

    always@(*) begin
        out=8'd0;
        case(in)
        3'd0:out[0]=1;
        3'd1:out[1]=1;
        3'd2:out[2]=1;
        3'd3:out[3]=1;
        3'd4:out[4]=1;
        3'd5:out[5]=1;
        3'd6:out[6]=1;
        3'd7:out[7]=1;
        endcase
    end

endmodule
    
