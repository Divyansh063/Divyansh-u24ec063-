`timescale 1ns / 1ps

module TestBench;

    reg clk;
    reg reset;
    wire [2:0] Q;

    Async_Up_Counter asyncup (
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    always #5 clk = ~clk;

    initial begin
      $dumpfile("dump.vcd"); 
      $dumpvars(0, TestBench);

        clk = 0;
        reset = 1;
      
		$monitor("Time=%0t | Q=%b", $time, Q);
      
        #10 reset = 0;

        #160;
      
        $finish;
    end

endmodule
