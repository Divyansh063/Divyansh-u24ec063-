`timescale 1ns / 1ps

module TestBench;

    reg clk;
    reg resetn;

    wire [7:0] tdata;
    wire tvalid;
    wire tready;

    // Instantiate Top
    Top uut (
        .clk(clk),
        .resetn(resetn),
        .tdata(tdata),
        .tvalid(tvalid),
        .tready(tready)
    );

    // Clock generation (100 MHz -> 10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset and simulation flow
    initial begin
        resetn = 0;
        #20;
        resetn = 1;

        // Run for some time
        #200;
        $stop;
    end

    // Monitor signals
    initial begin
        $display("Time | clk resetn tvalid tready tdata");
        $monitor("%4dns |  %b    %b      %b      %b     %d", 
                  $time, clk, resetn, tvalid, tready, tdata);
    end

endmodule
