module TestBench;
  reg [9:0] inpt;
  wire [3:0] out;

  BCD_Encoder encoder (.inpt(inpt), .out(out));

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0, TestBench);
      
      $display("Decimal  BCD");
      for (int i = 0; i < 10; i++) begin
            inpt = 10'b1 << i; #1;
        $display("%0d        %b", i, out);
        end
    end
endmodule
