    `timescale 1ns/1ps

    module tb;
        reg [3:0] mux_in;
        reg [1:0] mux_sel;
        
        reg demux_in;
        reg [1:0] demux_sel;

        wire mux_out;
        wire [3:0] demux_out;

        mux mux
        (
            .in(mux_in),
            .sel(mux_sel),
            .out(mux_out)
        );

        demux uut_demux 
        (
            .in(demux_in),
            .sel(demux_sel),
            .out(demux_out)
        );

        initial begin
            $display("time|||mux in|mux sel||mux out|||demux in|demux sel||demux out");
            $monitor("%4t |||%b    |%b     ||%b     |||%b      |%b       ||%b", 
                    $time, mux_in, mux_sel, mux_out, demux_in, demux_sel, demux_out);
            //4 bit input to mux
            mux_in = 4'b1100; 
            //1 bit input to demux
            demux_in = 1'b1;
            
            mux_sel = 2'b00; demux_sel = 2'b00; #10;
            mux_sel = 2'b01; demux_sel = 2'b01; #10;
            mux_sel = 2'b10; demux_sel = 2'b10; #10;
            mux_sel = 2'b11; demux_sel = 2'b11; #10;
        end

    endmodule