`timescale 1ns / 1ps

module TestBench;

    reg clk, reset;
    wire [2:0] Q;

    Ring_Counter ringcounter (
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    initial begin
      
      $dumpfile("dump.vcd");
      $dumpvars(0, TestBench);
      
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin

        $monitor("Time = %0t  Q = %b", $time, Q);
        reset = 1; #10;
        reset = 0;
        #60;
        $finish;
    end

endmodule
