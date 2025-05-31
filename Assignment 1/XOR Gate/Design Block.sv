module  XOR (input wire A,
             input wire B,
             output reg x);
  
  reg N1, N2, N3;
  
  always @(*) begin
    N1 = ~(A & B);
    N2 = ~(A & N1);
    N3 = ~(B & N1);
    x = ~(N2 & N3);
  end
  
endmodule
