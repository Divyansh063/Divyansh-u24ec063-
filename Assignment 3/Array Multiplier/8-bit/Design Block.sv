`timescale 1ns / 1ps

module ArrayMultiplier (
    input  [7:0] A, B,
    output [15:0] P
);
    wire [15:0] partialproducts [7:0]; 
    
    genvar i;
    generate
      for (i = 0; i < 8; i = i + 1) begin : products
            assign partialproducts[i] = (A & {8{B[i]}}) << i;
        end
    endgenerate

    assign P = partialproducts[0] +
               partialproducts[1] +
               partialproducts[2] +
               partialproducts[3] +
               partialproducts[4] +
               partialproducts[5] +
               partialproducts[6] +
               partialproducts[7];

endmodule
