`timescale 1ns/1ps

module TestBench;

    reg clk;
    reg rst_n;
    reg button;
    wire pulse;

    Pulse_generator Button (
        .clk(clk),
        .rst_n(rst_n),
        .button(button),
        .pulse(pulse)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0;
        button = 0;

        #20 rst_n = 1;
        #20;

        $display("Pressing button");
        button = 1; #20;
        button = 0; #40;

        $display("Pressing button");
        button = 1; #20;
        button = 0; #40;

        $display("Holding button");
        button = 1; #100;
        button = 0; #40;

        $display("Pressing button");
        button = 1; #20;
        button = 0; #40;
        
        #100;
        $stop;
    end

endmodule
