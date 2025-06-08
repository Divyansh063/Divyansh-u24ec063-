module TestBench;

  reg [3:0] inpt;
  wire [1:0] out;

  
  P_Encoder encode (
    .inpt(inpt),
    .out(out)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,TestBench);
    
    $display("inpt out");
    
    $monitor("%b %b", inpt, out);

    
    inpt = 4'b0000; #10;  
    inpt = 4'b0001; #10;  
    inpt = 4'b0010; #10;  
    inpt = 4'b0100; #10;  
    inpt = 4'b1000; #10;  
    inpt = 4'b0011; #10;   
    inpt = 4'b1110; #10;   
    inpt = 4'b0111; #10;  

    $finish;
  end

endmodule
