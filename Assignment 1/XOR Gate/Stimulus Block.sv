module XORtb;
  reg A, B;
  wire x;
  
  XOR xor1( .A(A),
            .B(B),
            .x(x));
  
  initial begin 
    
    $dumpfile("dump.vcd");
    $dumpvars(1, XORtb);
    
    $display("A B   x");
    
    A = 0; B = 0; #10;
    $display("%b %b   %b", A, B , x);
    
    A = 0; B = 1; #10;
    $display("%b %b   %b", A, B , x);
    
    A = 1; B = 0; #10;
    $display("%b %b   %b", A, B , x);
    
    A = 1; B = 1; #10;
    $display("%b %b   %b", A, B , x);
    
    $finish;
  end 
endmodule
