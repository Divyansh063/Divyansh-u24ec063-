module MUX(input wire [3:0] A, B, C, D,
           input wire [1:0] sel,
           output reg [3:0] out);
  
  always@(*) begin 
    if (sel == 2'b00) 
     out = A;
    
    else if (sel == 2'b01) 
    out = B;
    
    else if (sel == 2'b10) 
    out = C;
    
    else
    out = D;
  end
endmodule
