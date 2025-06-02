module compare(input [1:0] A,
               input [1:0] B,
               output AgtB,
               output AeqB,
               output AltB);
  
  assign AgtB = (A > B);
  assign AeqB = (A == B);
  assign AltB = (A < B);
  
endmodule 
