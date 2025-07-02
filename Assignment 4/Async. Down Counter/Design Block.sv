`timescale 1ns / 1ps

module jk_ff (input wire clk, reset, J, K,
           output reg Q);
  
  always @(posedge clk or posedge reset) begin
    if(reset)
      Q <= 1'b0;
    else begin
      case ({J, K})
        2'b00: Q <= Q;
        2'b01: Q <= 1'b0;
        2'b10: Q <= 1'b1;
        2'b11: Q <= ~Q;
        
      endcase
    end
  end
endmodule

module Async_Up_Counter (
    input wire clk, reset,
    output wire [2:0] Q
);
  
  wire Q2, Q1, Q0;
  wire J0, J1, J2, K0, K1, K2;
  
    assign J0 = 1'b1;         
    assign K0 = 1'b1;

    assign J1 = 1'b1;           
    assign K1 = 1'b1;

    assign J2 = 1'b1;      
    assign K2 = 1'b1;
    
    jk_ff FF0 (.clk(clk), .reset(reset), .J(J0), .K(K0), .Q(Q0));
    jk_ff FF1 (.clk(Q0), .reset(reset), .J(J1), .K(K1), .Q(Q1));
    jk_ff FF2 (.clk(Q1), .reset(reset), .J(J2), .K(K2), .Q(Q2));
    
    assign Q = {Q2, Q1, Q0};
  
endmodule
