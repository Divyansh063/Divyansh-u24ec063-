module XNOR(input A, B,
           output Y);
  
  wire I0, I1, sel;
  
  assign I0 = B;
  assign I1 = ~B;
  assign sel = ~A;
  
  assign Y = sel ? I1 : I0;
  
endmodule
