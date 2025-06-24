`timescale 1ns / 1ps

module ArrayMultiplier (
  input wire [15:0] A, B,
  output reg [31:0] P
);
  wire [31:0] partialproducts [15:0]; 
    
    genvar i;
    generate
      for (i = 0; i < 16; i++) begin : products
        assign partialproducts[i] = (A & {16{B[i]}}) << i;
        end
    endgenerate
  
  int j;
  always_comb begin
    P = 0;
  for(j = 0; j < 16; j++) begin
    P = P + partialproducts[j];
  end
  end

endmodule
