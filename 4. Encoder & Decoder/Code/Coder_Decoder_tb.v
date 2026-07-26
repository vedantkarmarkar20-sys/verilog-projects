`timescale 1ps/1ps
module testbench_encoderdecoder();
    reg[7:0] enc_in;
    wire[2:0] enc_out;

    reg[2:0] dec_in;
    wire[7:0] dec_out;

    encoder enc(
        .in(enc_in),
        .out(enc_out)
    );

    decoder dec(
        .in(dec_in),
        .out(dec_out)
    );

    initial 
    begin
        $display("time|encoderin|encoderout||decoderin|decoderout");
        $monitor("%4t |%b       |%b        ||%b       |%b",$time,enc_in,enc_out,dec_in,dec_out);
            //testing encoder
            dec_in = 3'd0;#10;

            enc_in = 8'b0000_0000;#10;
            enc_in = 8'b1000_0000;#10;
            enc_in = 8'b0100_0000;#10;
            enc_in = 8'b0010_0000;#10;	
            enc_in = 8'b0001_0000;#10;
	    enc_in = 8'b0000_1000;#10;
            enc_in = 8'b0000_0100;#10;
            enc_in = 8'b0000_0010;#10;
            enc_in = 8'b0000_0001;#10;
            
            enc_in=8'd0;#10;

            dec_in=3'd0;#10;
            dec_in=3'd1;#10;
            dec_in=3'd2;#10;
            dec_in=3'd3;#10;
            dec_in=3'd4;#10;
            dec_in=3'd5;#10;
            dec_in=3'd6;#10;
            dec_in=3'd7;#10;

    end
endmodule