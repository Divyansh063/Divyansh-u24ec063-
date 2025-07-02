`timescale 1ns / 1ps

module TestBench;

    reg clk;
    reg reset;
    wire [3:0] Q;

    BCD_Sync_Up_Counter BCDsync (
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

        #10 reset = 0;

        #200;
      
        $finish;
    end

endmodule
