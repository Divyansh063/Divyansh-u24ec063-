module Encoder (
  input [7:0] inpt,       
  output [2:0] out    
);

  function [2:0] encode;
    input [7:0] inputs;
    begin 
  
  case (1'b1)          
    inputs[0]: encode = 3'b000;
    inputs[1]: encode = 3'b001;
    inputs[2]: encode = 3'b010;
    inputs[3]: encode = 3'b011;
    inputs[4]: encode = 3'b100;
    inputs[5]: encode = 3'b101;
    inputs[6]: encode = 3'b110;
    inputs[7]: encode = 3'b111; 
    default: encode = 3'b000;
  endcase
end
  endfunction
  
  assign out = encode(inpt);
endmodule
