`timescale 1ns / 1ps

module TestBench;

    reg [7:0] A, B;
    wire [15:0] P;

    ArrayMultiplier multiply (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0, TestBench);
      
        $display("Time\tA\tB\tProduct");
        $monitor("%0dns\t%d\t%d\t%d", $time, A, B, P);

        A = 8'd13; B = 8'd7;
        #10;

        A = 8'd255; B = 8'd255;
        #10;

        A = 8'd0; B = 8'd123;
        #10;

        A = 8'd45; B = 8'd123;
        #10;

        A = 8'd100; B = 8'd0;
        #10;

        A = 8'd88; B = 8'd64; 
        #10;

        $finish;
    end

endmodule
