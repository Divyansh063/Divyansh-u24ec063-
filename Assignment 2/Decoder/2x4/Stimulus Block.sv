module TestBench;
  reg [1:0] inpt;
  reg enb;
  wire [3:0] out;

  Decoder decode (
    .inpt(inpt),
    .enb(enb),
    .out(out)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, TestBench);
	
    $display("inpt I3I2I1I0");
    enb = 1; inpt = 2'b00; #10;
    $display("%b   %b", inpt, out); 
    inpt = 2'b01; #10;
    $display("%b   %b", inpt, out);
    inpt = 2'b10; #10;
    $display("%b   %b", inpt, out);
    inpt = 2'b11; #10;
    $display("%b   %b", inpt, out);

    enb = 0;
    inpt = 2'b10; #10;
    $display("%b   %b", inpt, out);

    $finish;
  end
endmodule
