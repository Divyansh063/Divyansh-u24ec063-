module NOR(
  input wire A, B,
  output reg Y
);
  wire I0, I1, sel;

  assign sel = A;
  assign I0 = ~B;
  assign I1 = 1'b0;

  assign Y = sel ? I1 : I0;

endmodule
