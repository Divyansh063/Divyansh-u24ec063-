module MUX(input wire A, I1,
           input wire sel_B,
           output reg Y);
  
  assign Y = sel_B ? I1 : A;
  
endmodule
