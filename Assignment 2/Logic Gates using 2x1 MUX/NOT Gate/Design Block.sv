module NOT(input wire inpt,
           output reg y);  // select line = input which will be complemented
  
 always @(*) begin
    if (inpt == 1'b0)
      y = 1'b1;      
    else
      y = 1'b0;      
    end
endmodule
