`timescale 1ns / 1ps

module TestBench;

    reg clk;
    reg resetn;

    wire [7:0] tdata;
    wire tvalid;
    wire tready;

    Top top (
        .clk(clk),
        .resetn(resetn),
        .tdata(tdata),
        .tvalid(tvalid),
        .tready(tready)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        resetn = 0;
        #20;
        resetn = 1;

        #200;
        $stop;
    end

    initial begin
        $display(" clk resetn tvalid tready tdata");
        $monitor(" %b    %b      %b      %b     %d", clk, resetn, tvalid, tready, tdata);
    end

endmodule
