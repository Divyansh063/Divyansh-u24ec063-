module FA( input A,
           input B,
           input Cin,
           output S,
           output Cout);
  
  wire w1, w2, w3;
  
  // S = A ^ B ^ Cin
  xor(w1, A, B);
  xor(S, w1, Cin);
  
  // Cout = A & B | Cin & (A ^ B)
  // or Cout = (A & B) | (B & Cin) | (A & Cin)
  and(w2, A, B);
  and(w3, Cin, w1);
  or(Cout, w2, w3);
  
endmodule
