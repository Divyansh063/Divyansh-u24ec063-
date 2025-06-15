module BCD_Encoder (
  input  wire [9:0] inpt,       
  output reg  [3:0] out        
);
    always @(*) begin
        case (1'b1)            
          inpt[0]: out = 4'b0000;
          inpt[1]: out = 4'b0001;
          inpt[2]: out = 4'b0010;
          inpt[3]: out = 4'b0011;
          inpt[4]: out = 4'b0100;
          inpt[5]: out = 4'b0101;
          inpt[6]: out = 4'b0110;
          inpt[7]: out = 4'b0111;
          inpt[8]: out = 4'b1000;
          inpt[9]: out = 4'b1001;
            default: out = 4'bxxxx; 
        endcase
    end
endmodule
