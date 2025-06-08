module Decoder (
    input [1:0] inpt,     
    input enb,           // Enable 
    output reg [3:0] out  
);

always @(*) begin
  if (enb) begin
    case (inpt)
            2'b00: out = 4'b0001; // I0 active
            2'b01: out = 4'b0010; // I1 active
            2'b10: out = 4'b0100; // I2 active
            2'b11: out = 4'b1000; // I3 active
        endcase
    end 
  else begin
        out = 4'b0000; // when not enabled
    end
end

endmodule
