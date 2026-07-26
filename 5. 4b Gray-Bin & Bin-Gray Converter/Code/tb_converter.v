module tb_converter();
    reg [3:0] gray;
    reg [3:0] binary;
    reg sel; //1=bin-gray,2=gray-bin
    wire [3:0] out;


    integer i;

    converter dut (
        .gray(gray),
        .binary(binary),
        .sel(sel),
        .out(out)
    );

    initial 
    begin
        $display("Time|Select|Gray|Binary|Output");
        $monitor("%4t |%b    |%b  |%b    |%b",$time,sel,gray,binary,out);

        gray = 4'b0000;
        binary = 4'b0000;

        //testing gray2bin
        $display("gray2bin");
        sel=1'b1;  
        for(i=0;i<16;i=i+1)
        begin
            gray=i;
            #10;
        end
        //testing  bin2gray
        gray = 4'b0000;
        $display("bin2gray");
        sel=1'b0;  
        for(i=0;i<16;i=i+1)
        begin
            binary=i;
            #10;
        end
    end
endmodule


