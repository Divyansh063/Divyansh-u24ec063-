module DeMUX(
    input wire inpt,        
    input wire [1:0] sel,   
    output reg [3:0] out    
);

  always @(*) begin
    
    out = 4'b0000;
    
    case(sel)
      2'b00: out[0] = inpt;
      2'b01: out[1] = inpt;
      2'b10: out[2] = inpt;
      2'b11: out[3] = inpt;
        default: out = 4'b0000;
    endcase
end

endmodule
