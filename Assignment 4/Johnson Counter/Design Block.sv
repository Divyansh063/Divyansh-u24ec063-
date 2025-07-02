`timescale 1ns / 1ps

module d_ff (input wire D,
             input wire clk,
             input wire reset,
             input wire init,
             output reg Q);
  
  always @(posedge clk) begin
    if (reset)
      Q <= init;
    else
      Q <= D;
  end 
endmodule

module Ring_Counter(input wire clk,
                    input wire reset,
                    output wire [2:0] Q);
  
  wire Q0, Q1, Q2;
  
  d_ff ff0 (.clk(clk), .reset(reset), .init(1'b1), .D(~Q2), .Q(Q0));
  d_ff ff1 (.clk(clk), .reset(reset), .init(1'b0), .D(Q0), .Q(Q1));
  d_ff ff2 (.clk(clk), .reset(reset), .init(1'b0), .D(Q1), .Q(Q2));
  
  assign Q = {Q2, Q1, Q0};

endmodule
