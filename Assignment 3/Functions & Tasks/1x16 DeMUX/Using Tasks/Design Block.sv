module DeMUX #(parameter N = 16)(
    input wire inpt,
    input wire [$clog2(N)-1:0] sel,
    output reg [N-1:0] out
);

  int i;
  
  task demux;
    input inputs;
    input [$clog2(N)-1:0] select;
    output [N-1:0] outputs;
    
      for (i = 0; i < N; i++)
            outputs[i] = 0;
    outputs[select] = inputs;
  endtask
    
  always @(*) begin
    demux(inpt, sel, out);
    end
endmodule
