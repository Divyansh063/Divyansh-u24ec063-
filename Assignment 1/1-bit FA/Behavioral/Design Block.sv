module FA  ( input wire A,
             input wire B,
             input wire Cin,
             output reg S,
             output reg Cout);
  always @( A or B or Cin) begin
    {Cout, S} = A + B + Cin;
  end 
  
    endmodule
