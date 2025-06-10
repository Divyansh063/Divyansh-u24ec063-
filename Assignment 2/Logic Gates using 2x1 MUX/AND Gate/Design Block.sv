module MUX(input wire A, I0,
           input wire sel_B,
           output reg Y);
  
  assign Y = sel_B ? A : I0;
  
endmodule
