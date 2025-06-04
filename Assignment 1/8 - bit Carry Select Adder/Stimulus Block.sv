module TestBench;
  reg [7:0] A, B;
  reg Cin;
  wire Cout;
  wire [7:0] S;

  
  CarrySelect_Adder CSA(
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
  );

  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, TestBench);

    $display("A        B        Cin    S        Cout");
    $monitor("%b %b %b      %b %b", A, B, Cin, S, Cout);

    A = 8'b10101010; B = 8'b01010101; Cin = 1; #10;
    A = 8'b10111011; B = 8'b00101100; Cin = 0; #10;
    A = 8'b00000110; B = 8'b01101100; Cin = 1; #10;
    A = 8'b11110010; B = 8'b00001011; Cin = 0; #10;

    $finish;
  end
endmodule
