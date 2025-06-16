module DeMUX #(parameter N = 16)(
    input wire inpt,
    input wire [$clog2(N)-1:0] sel,
    output reg [N-1:0] out
);

  function [N-1:0] demux;
    input inputs;
    input [$clog2(N)-1:0] select;
    int i;
    
      for (i = 0; i < N; i++)
            demux[i] = 0;
    demux[select] = inputs;
  endfunction
    
  always @(*) begin
      out = demux(inpt, sel);
    end
endmodule
