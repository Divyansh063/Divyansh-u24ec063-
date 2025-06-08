module TestBench;

  reg [7:0] inpt;
  wire [2:0] out;

  Encoder encode (.inpt(inpt), .out(out));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, TestBench);
    
    $display("inpt     out");
    
    $monitor("%b %b", inpt, out);

    inpt = 8'b00000001; #10;
    inpt = 8'b00000010; #10;
    inpt = 8'b00000100; #10;
    inpt = 8'b00001000; #10;
    inpt = 8'b00010000; #10;
    inpt = 8'b00100000; #10;
    inpt = 8'b01000000; #10;
    inpt = 8'b10000000; #10;
    inpt = 8'b10011101; #10; 

    $finish;
  end

endmodule
