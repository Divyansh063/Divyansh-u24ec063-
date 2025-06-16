module Encoder (
    input  wire [7:0] inpt,
    output reg  [2:0] out
);

    task encode(
      input  [7:0] inputs,
      output [2:0] outputs
    );
        begin
            case (1'b1)
                inputs[0]: outputs = 3'b000;
                inputs[1]: outputs = 3'b001;
                inputs[2]: outputs = 3'b010;
                inputs[3]: outputs = 3'b011;
                inputs[4]: outputs = 3'b100;
                inputs[5]: outputs = 3'b101;
                inputs[6]: outputs = 3'b110;
                inputs[7]: outputs = 3'b111;
                default: outputs = 3'b000;  
            endcase
        end
    endtask
  
  always @(*) begin
        encode (inpt, out);
    end

endmodule
