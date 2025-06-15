module TestBench;
    reg  [3:0] bnry;
    wire [3:0] gray;

    GrayEncoder encoder (
        .bnry(bnry),
        .gray(gray)
    );

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0, TestBench);
      
        $display("Binary  Gray");
      
        for (int i = 0; i < 16; i++) begin
            bnry = i;#1;
            $display("%b  %b", bnry, gray);
        end
    end
endmodule
