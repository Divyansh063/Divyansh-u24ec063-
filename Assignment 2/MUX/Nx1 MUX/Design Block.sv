module MUX #(parameter N = 16, // Value of N(input size) can be changed.
             parameter W = 4,  // W can also be changed.
             parameter sel_size = $clog2(N))
  ( 
    input [N*W-1:0] input_size,
    input [sel_size-1:0] sel,
    output reg [W-1:0] y
);
  always @(*) begin
    y = input_size[sel*W +: W];
  end
endmodule
