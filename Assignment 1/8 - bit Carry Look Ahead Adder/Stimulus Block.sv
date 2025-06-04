module TestBench; 
  
  reg [7:0] A, B; 
  reg Cin;
  wire Cout;
  wire [7:0] S;                
  
  LookAhead_Adder lookaheadadder(.A(A),
                                 .B(B),
                                 .Cin(Cin),
                                 .Cout(Cout),
                                 .S(S));
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, TestBench);
    
    $display("A        B        Cin     S        Cout");
    $monitor("%b %b %b       %b %b", A, B, Cin, S, Cout);
    
    A = 8'b10101010; B = 8'b01010101; Cin = 1; #10;
    A = 8'b00001111; B = 8'b00000001; Cin = 0; #10;
    A = 8'b11110000; B = 8'b00001111; Cin = 1; #10;
    A = 8'b11111111; B = 8'b11111111; Cin = 1; #10;
    A = 8'b10110101; B = 8'b00101101; Cin = 0; #10;
    
    $finish;
  end 
endmodule
