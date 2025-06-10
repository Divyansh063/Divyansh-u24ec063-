module NAND(
  input wire A, B,
  output reg Y
);
  wire I0, I1, sel;

  assign sel = A;
  assign I1 = ~B;
  assign I0 = 1'b1;

  assign Y = sel ? I1 : I0;

endmodule
