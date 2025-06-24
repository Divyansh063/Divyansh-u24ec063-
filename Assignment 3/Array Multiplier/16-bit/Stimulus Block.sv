`timescale 1ns / 1ps

module TestBench;

  reg [15:0] A, B;
  wire [31:0] P;

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

        A = 16'd13; B = 16'd7;
        #10;

        A = 16'd255; B = 16'd255;
        #10;

        A = 16'd0; B = 16'd123;
        #10;

        A = 16'd786; B = 16'd9288;
        #10;

        A = 16'd1111; B = 16'd10000;
        #10;

        A = 16'd5000; B = 16'd2000; 
        #10;

        $finish;
    end

endmodule
