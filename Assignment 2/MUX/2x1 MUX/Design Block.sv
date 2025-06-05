module MUX(input [3:0] int1, int0, 
           input sel,
           output [3:0] out);
  assign out = sel ? int1 : int0;
endmodule 
