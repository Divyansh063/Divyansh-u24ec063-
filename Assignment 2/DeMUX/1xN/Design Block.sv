module DeMUX #(parameter N = 8)(
    input wire inpt,
    input wire [$clog2(N)-1:0] sel,
    output reg [N-1:0] out
);

    int i;

    always @(*) begin
      for (i = 0; i < N; i++)
            out[i] = 0;
        out[sel] = inpt;
    end
endmodule
