    module bcd(
        output reg [3:0]tens,ones,
        input rst,clk
    );
        always @(posedge clk) begin
        if (rst == 1) 
        begin
            ones <= 4'd0;
            tens <= 4'd0;
        end 
        else if (ones == 4'd9) 
            begin 
                ones <= 4'd0; 
                
                if (tens == 4'd9) begin
                    tens <= 4'd0;
                end else begin
                    tens <= tens + 4'd1;
                end
            end 
        else 
            begin
                ones <= ones + 4'd1; 
            end
    end

       
    endmodule