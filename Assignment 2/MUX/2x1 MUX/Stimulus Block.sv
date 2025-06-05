module TestBench;
  reg [3:0] int1, int0;
  reg sel;
  wire [3:0] out;
  
  MUX mux(.int1(int1),
          .int0(int0),
          .sel(sel),
          .out(out));
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, TestBench);
    
    $display("input1 input0 select     output");
    
    int1 = 4'b1001; int0 = 4'b0110; sel = 0; #10;
    $display("%d    %d      %b          %d", int1, int0, sel, out);
    
    int1 = 4'b1001; int0 = 4'b0110; sel = 1; #10;
    $display("%d    %d      %b          %d", int1, int0, sel, out);
    
    $finish;
  end
endmodule
