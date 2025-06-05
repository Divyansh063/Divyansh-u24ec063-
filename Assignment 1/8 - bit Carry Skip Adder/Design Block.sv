// This one can skip the carry which is generated after the sum of the first 4 bits.
// Similarly, to skip after every 2 bit or every 1 bit can be done too.

module FA( input A, B, Cin,
          output Cout, S);
  assign S = A ^ B ^ Cin;
  assign Cout = (A & B) | (A & Cin) | (B & Cin);
  
endmodule

module CarrySkip_Adder(input [7:0] A, B,
                       input Cin,
                       output Cout,
                       output [7:0] S);
  wire [3:0] Propa;
  wire [6:0] carry;
  
  FA fa0(.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(carry[0]));
  FA fa1(.A(A[1]), .B(B[1]), .Cin(carry[0]), .S(S[1]), .Cout(carry[1]));
  FA fa2(.A(A[2]), .B(B[2]), .Cin(carry[1]), .S(S[2]), .Cout(carry[2]));
  FA fa3(.A(A[3]), .B(B[3]), .Cin(carry[2]), .S(S[3]), .Cout(carry[3]));
  
  
  assign Propa[0] = A[0] ^ B[0];
  assign Propa[1] = A[1] ^ B[1];
  assign Propa[2] = A[2] ^ B[2];
  assign Propa[3] = A[3] ^ B[3];
  
  wire Pblock = Propa[0] & Propa[1] & Propa[2] & Propa[3];
  
   wire Carryskip = Pblock & Cin;

    wire Carryforward = Pblock ? Carryskip : carry[3];

  FA fa4(.A(A[4]), .B(B[4]), .Cin(Carryforward), .S(S[4]), .Cout(carry[4]));
  FA fa5(.A(A[5]), .B(B[5]), .Cin(carry[4]), .S(S[5]), .Cout(carry[5]));
  FA fa6(.A(A[6]), .B(B[6]), .Cin(carry[5]), .S(S[6]), .Cout(carry[6]));
  FA fa7(.A(A[7]), .B(B[7]), .Cin(carry[6]), .S(S[7]), .Cout(Cout));

endmodule
