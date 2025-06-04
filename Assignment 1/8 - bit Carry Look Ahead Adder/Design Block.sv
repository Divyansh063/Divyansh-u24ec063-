module LookAhead_Adder(input [7:0] A,
                       input [7:0] B,
                       input Cin,
                       output Cout,
                       output [7:0] S);
  wire [7:0] Gen, Propa;
  wire [8:0] carry;
  
  assign carry[0] = Cin;
  
  assign Gen = A & B;
  assign Propa = A ^ B;
                       
  assign carry[1] = Gen[0] | (Propa[0] & carry[0]);
  assign carry[2] = Gen[1] | (Propa[1] & carry[1]);
  assign carry[3] = Gen[2] | (Propa[2] & carry[2]);
  assign carry[4] = Gen[3] | (Propa[3] & carry[3]);
  assign carry[5] = Gen[4] | (Propa[4] & carry[4]);
  assign carry[6] = Gen[5] | (Propa[5] & carry[5]);
  assign carry[7] = Gen[6] | (Propa[6] & carry[6]);
  assign carry[8] = Gen[7] | (Propa[7] & carry[7]);
  
  assign Cout = carry[0];
  assign S = Propa ^ carry [7:0];
  
endmodule 
