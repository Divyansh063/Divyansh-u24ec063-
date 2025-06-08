module Encoder (
  input  [3:0] inpt,       
  output reg [1:0] out   
);

always @(*) begin
  case (1'b1)
    inpt[0]: out = 2'b00;
    inpt[1]: out = 2'b01;
    inpt[2]: out = 2'b10;
    inpt[3]: out = 2'b11;
    default: out = 2'b00;  // Default value
  endcase
end

endmodule
