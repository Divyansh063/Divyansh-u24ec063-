`timescale 1ns / 1ps

module jk_ff (input wire clk, reset, J, K,
           output reg Q);
  
  always @(posedge clk) begin
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

module BCD_Sync_Up_Counter (
    input wire clk, reset,
    output wire [3:0] Q
);
  
  wire Q3, Q2, Q1, Q0;
  wire J0, J1, J2, J3, K0, K1, K2, K3;
  
    assign J0 = 1'b1;         
    assign K0 = 1'b1;

    assign J1 = (~Q3) & Q0;           
    assign K1 = Q0;

    assign J2 = Q0 & Q1;      
    assign K2 = Q0 & Q1;

    assign J3 = (Q0 & Q1 & Q2); 
    assign K3 = Q0;

    
    jk_ff FF0 (.clk(clk), .reset(reset), .J(J0), .K(K0), .Q(Q0));
    jk_ff FF1 (.clk(clk), .reset(reset), .J(J1), .K(K1), .Q(Q1));
    jk_ff FF2 (.clk(clk), .reset(reset), .J(J2), .K(K2), .Q(Q2));
    jk_ff FF3 (.clk(clk), .reset(reset), .J(J3), .K(K3), .Q(Q3));

    
    assign Q = {Q3, Q2, Q1, Q0};
  
endmodule
