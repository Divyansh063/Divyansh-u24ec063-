module TestBench;
  reg inpt;
  wire y;
  
  NOT not_gate(.inpt(inpt),
          .y(y));
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, TestBench);
   
    
    $display("inpt  y");
    inpt = 0; #10;
    $display("%b     %b", inpt, y);
    
    inpt = 1; #10;
    $display("%b     %b", inpt, y);
    
  $finish;
  end
endmodule
