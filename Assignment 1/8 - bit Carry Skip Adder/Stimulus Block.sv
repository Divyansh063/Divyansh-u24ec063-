module TestBench;
  reg [7:0] A, B;
  reg Cin;
  wire [7:0] S;
  wire Cout;
  
  CarrySkip_Adder CSA( .A(A),
                      .B(B),
                      .Cin(Cin),
                      .S(S),
                      .Cout(Cout));
  
  initial  begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,TestBench);

    $display("A        B        Cin     S        Cout");
    $monitor("%b %b %b       %b %b", A, B, Cin, S, Cout);
    
    A = 8'b10101010; B = 8'b01010101; Cin = 1; #10;
    A = 8'b00110110; B = 8'b11110000; Cin = 1; #10;
    A = 8'b11111010; B = 8'b00001101; Cin = 0; #10;
    A = 8'b00010110; B = 8'b00110101; Cin = 0; #10;
    
    $finish;
  end 
endmodule
