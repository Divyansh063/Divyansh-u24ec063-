module BoothMultiplier (
    input  signed [7:0] multiplicand,
    input  signed [7:0] multiplier,
    output reg signed [15:0] Product
);

  int i;
  reg signed [7:0] acc; 
  reg signed [7:0] Q;    
  reg Q_1;                  
  reg signed [7:0] M;       

  always @(*) begin
    acc = 8'b0;
    Q = multiplier;
    Q_1 = 1'b0;
    M = multiplicand;

    // Addition Process-
    for (i = 0; i < 8; i++) begin
      case ({Q[0], Q_1})
        2'b01: acc = acc + M;   
        2'b10: acc = acc - M;   
        default: ;  // Covers the cases of 00 and 11
      endcase

      // Arithmetic Shift-
      Q_1 = Q[0];
      Q = {acc[0], Q[7:1]};
      acc = {acc[7], acc[7:1]};
    end

    Product = {acc, Q};
  end

endmodule
