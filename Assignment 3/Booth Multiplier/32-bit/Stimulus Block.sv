module TestBench;

  reg signed [31:0] A, B;
  wire signed [63:0] Product;

  BoothMultiplier boothmultiplier (
    .multiplicand(A),
    .multiplier(B),
    .Product(Product)
  );

  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(0, TestBench);
    
    $display("A\tB\tProduct");
    
    A = 32'd15;  B = 32'd3;  #10; $display("%d\t%d\t%d", A, B, Product);
    A = -32'd15; B = 32'd3;  #10; $display("%d\t%d\t%d", A, B, Product);
    A = 32'd127;  B = 32'd127; #10; $display("%d\t%d\t%d", A, B, Product);
    A = -32'd100; B = 32'd125; #10; $display("%d\t%d\t%d", A, B, Product);
    A = 32'd0;  B = -32'd3; #10; $display("%d\t%d\t%d", A, B, Product);
    A = -32'd100000; B = 32'd1634556; #10; $display("%d\t%d\t%d", A, B, Product);
    $finish;
  end

endmodule
