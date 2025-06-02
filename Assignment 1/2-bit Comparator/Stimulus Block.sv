module stimulus;

    reg [1:0] A;
    reg [1:0] B;
    wire AgtB, AeqB, AltB;

    compare comp (
        .A(A),
        .B(B),
        .AgtB(AgtB),
        .AeqB(AeqB),
        .AltB(AltB)
    );

    initial begin
      
      $dumpfile("dump.vcd");
      $dumpvars(1, stimulus);

      // Two ways to do this-
      // 1. write all 16 cases 
      // 2. select one case and change it in testbench like giving an input
      
      A = 2'b10;  
      B = 2'b01;  
      #5;
      
        $display("A = %b (%0d), B = %b (%0d)", A, A, B, B);
        $display("AgtB = %b, AeqB = %b, AltB = %b", AgtB, AeqB, AltB);

        $finish;
    end

endmodule
