module GrayEncoder (
  input  [3:0] bnry,
  output [3:0] gray
);
    assign gray[3] = bnry[3];
  	assign gray[2] = bnry[3] ^ bnry[2];
    assign gray[1] = bnry[2] ^ bnry[1];
    assign gray[0] = bnry[1] ^ bnry[0];
endmodule
