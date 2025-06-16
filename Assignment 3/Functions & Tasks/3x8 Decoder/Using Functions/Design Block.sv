module Decoder (
  input [2:0] inpt,     
    input enb,           // Enable
    output reg [7:0] out  
);

  function [7:0] decode;
    input [2:0] inputs;
    input enable;
    
    if (enable) begin
    case (inputs)
            3'b000: decode = 8'b00000001; //I0
            3'b001: decode = 8'b00000010; //I1
            3'b010: decode = 8'b00000100; //I2
            3'b011: decode = 8'b00001000; //I3
            3'b100: decode = 8'b00010000; //I4
            3'b101: decode = 8'b00100000; //I5
            3'b110: decode = 8'b01000000; //I6
            3'b111: decode = 8'b10000000; //I7
        endcase
    end 
  else begin
        decode = 8'b00000000;
    end
    
  endfunction

  always @(*) begin
    out = decode(inpt, enb);
  end

endmodule
