module TestBench;

  reg signed [7:0] A, B;
  wire signed [15:0] Product;

  BoothMultiplier boothmultiplier (
    .multiplicand(A),
    .multiplier(B),
    .Product(Product)
  );

  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(0, TestBench);
    
    $display("A\tB\tProduct");
    
    A = 8'd15;  B = 8'd3;  #10; $display("%d\t%d\t%d", A, B, Product);
    A = -8'd15; B = 8'd3;  #10; $display("%d\t%d\t%d", A, B, Product);
    A = 8'd127;  B = 8'd127; #10; $display("%d\t%d\t%d", A, B, Product);
    A = -8'd100; B = 8'd125; #10; $display("%d\t%d\t%d", A, B, Product);
    A = 8'd0;  B = -8'd3; #10; $display("%d\t%d\t%d", A, B, Product);
    A = -8'd45; B = 8'd74; #10; $display("%d\t%d\t%d", A, B, Product);
    $finish;
  end

endmodule
