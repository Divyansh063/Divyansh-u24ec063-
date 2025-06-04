module CarrySelect_Adder(input [7:0] A,
                         input [7:0] B,
                         input Cin,
                         output Cout,
                         output [7:0] S);
  
  wire [3:0] S0, S1;
  wire Cout0, Cout1;
  wire sel;
  
  RCA CSA_low(.A(A[3:0]),
                            .B(B[3:0]),
                            .Cin(Cin),
                            .Cout(sel),
                            .S(S[3:0]));
  
  RCA CSA_High0(.A(A[7:4]),
                              .B(B[7:4]),
                              .Cin(1'b0),
                              .Cout(Cout0),
                              .S(S0));
  
  RCA CSA_High1(.A(A[7:4]),
                              .B(B[7:4]),
                              .Cin(1'b1),
                              .Cout(Cout1),
                              .S(S1));
  
 
  
  assign S[7:4] = sel ? S1 : S0;
  assign Cout = sel ? Cout1 : Cout0;
  
endmodule 
  
  module RCA( input [3:0] A,
              input [3:0] B,
              input Cin,
              output Cout,
              output [3:0] S);
    
    wire carry [2:0];
    
    assign {carry[0], S[0]} = A[0] + B[0] + Cin;
    assign {carry[1], S[1]} = A[1] + B[1] + carry[0];
    assign {carry[2], S[2]} = A[2] + B[2] + carry[1];
    assign {Cout, S[3]} = A[3] + B[3] + carry[2];
    
  endmodule
