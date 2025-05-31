module FA(input wire A,
          input wire B,
          input wire Cin,
          output reg S,
          output reg Cout);
  
  assign S = A ^ B ^ Cin;
  assign Cout = A & B | Cin & (A ^ B);
  
endmodule
