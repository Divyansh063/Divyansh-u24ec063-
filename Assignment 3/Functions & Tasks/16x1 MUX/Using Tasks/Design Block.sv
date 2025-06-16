module MUX #(parameter N = 16, // Value of N(input size) can be changed.
             parameter W = 4,  // W can also be changed.
             parameter sel_size = $clog2(N))
  ( 
    input [N*W-1:0] input_size,
    input [sel_size-1:0] sel,
    output reg [W-1:0] y
);
  
  task mux;
    input [N*W-1:0] inputs;
    input [sel_size-1:0] select;
	output [W-1:0] outputs;
    
    begin
      outputs = inputs[select*W +: W]; 
    end
  endtask

  always @(*) begin
    mux(input_size, sel, y);
  end
  
endmodule
