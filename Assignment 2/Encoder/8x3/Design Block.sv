module Encoder (
  input  [7:0] inpt,       
  output reg [2:0] out    
);

always @(*) begin
  
  case (1'b1)          
    inpt[0]: out = 3'b000;
    inpt[1]: out = 3'b001;
    inpt[2]: out = 3'b010;
    inpt[3]: out = 3'b011;
    inpt[4]: out = 3'b100;
    inpt[5]: out = 3'b101;
    inpt[6]: out = 3'b110;
    inpt[7]: out = 3'b111; 
    default: out = 3'b000;
  endcase
end
