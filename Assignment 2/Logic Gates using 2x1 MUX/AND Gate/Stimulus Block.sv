module TestBench;
  reg A, I0; 
  reg sel_B;
  wire Y;
  
  MUX mux( .A(A),
          .I0(I0),
          .sel_B(sel_B),
          .Y(Y));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, TestBench);
    
    $display("A B Y");
    
    $monitor("%b %b %b", A, sel_B, Y);
    
    A = 0; I0 = 1'b0; sel_B = 0; #10;
    A = 0; I0 = 1'b0; sel_B = 1; #10;
    A = 1; I0 = 1'b0; sel_B = 0; #10;
    A = 1; I0 = 1'b0; sel_B = 1; #10;
    
    $finish;
    
  end
endmodule
