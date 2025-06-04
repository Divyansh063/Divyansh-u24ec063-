module CarryAdder(input [7:0] A,
                   input [7:0] B,
                   input Cin,
                   output Cout,
                   output [7:0] S);
  
  wire carry[6:0];
  
  FA fa0 (.Cin(Cin), .A(A[0]), .B(B[0]), .S(S[0]), .Cout(carry[0]));
  FA fa1 (.Cin(carry[0]), .A(A[1]), .B(B[1]), .S(S[1]), .Cout(carry[1]));
  FA fa2 (.Cin(carry[1]), .A(A[2]), .B(B[2]), .S(S[2]), .Cout(carry[2]));
  FA fa3 (.Cin(carry[2]), .A(A[3]), .B(B[3]), .S(S[3]), .Cout(carry[3]));
  FA fa4 (.Cin(carry[3]), .A(A[4]), .B(B[4]), .S(S[4]), .Cout(carry[4]));
  FA fa5 (.Cin(carry[4]), .A(A[5]), .B(B[5]), .S(S[5]), .Cout(carry[5]));
  FA fa6 (.Cin(carry[5]), .A(A[6]), .B(B[6]), .S(S[6]), .Cout(carry[6]));
  FA fa7 (.Cin(carry[6]), .A(A[7]), .B(B[7]), .S(S[7]), .Cout(Cout));
    
    endmodule
  
  module FA(input A,
            input B,
            input Cin,
            output Cout,
            output S);
    
    assign S  = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
  endmodule
