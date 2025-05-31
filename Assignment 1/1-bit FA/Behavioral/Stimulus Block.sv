module FAtb;
  reg A, B, Cin;
  wire S, Cout;
  FA fa( .A(A),
         .B(B),
         .Cin(Cin),
         .S(S),
         .Cout(Cout));
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(1, FAtb);
    
    $display("A B Cin  S Cout");
    
    A=0; B=0; Cin=0; #10;
    $display("%b %b %b    %b %b", A, B, Cin, S, Cout);
    
    A=0; B=0; Cin=1; #10;
     $display("%b %b %b    %b %b", A, B, Cin, S, Cout); 
    
    A=0; B=1; Cin=0; #10;
     $display("%b %b %b    %b %b", A, B, Cin, S, Cout);
    
    A=0; B=1; Cin=1; #10;
     $display("%b %b %b    %b %b", A, B, Cin, S, Cout);
    
    A=1; B=0; Cin=0; #10;
     $display("%b %b %b    %b %b", A, B, Cin, S, Cout); 
    
    A=1; B=0; Cin=1; #10;
     $display("%b %b %b    %b %b", A, B, Cin, S, Cout); 
    
    A=1; B=1; Cin=0; #10;
     $display("%b %b %b    %b %b", A, B, Cin, S, Cout);
    
    A=1; B=1; Cin=1; #10;
     $display("%b %b %b    %b %b", A, B, Cin, S, Cout); 
    
    $finish;
    
  end
  
endmodule
