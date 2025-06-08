module TestBench;
  reg [2:0] inpt;
  reg enb;
  wire [7:0] out;

  Decoder decode (
    .inpt(inpt),
    .enb(enb),
    .out(out)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, TestBench);

    $display("inpt  I7I6I5I4I3I2I1I0");
    enb = 1;
    inpt = 3'b000; #10;
    $display("%b   %b", inpt, out);
    inpt = 3'b001; #10;
    $display("%b   %b", inpt, out);
    inpt = 3'b010; #10;
    $display("%b   %b", inpt, out);
    inpt = 3'b011; #10;
    $display("%b   %b", inpt, out);
    inpt = 3'b100; #10;
    $display("%b   %b", inpt, out);
    inpt = 3'b101; #10;
    $display("%b   %b", inpt, out);
    inpt = 3'b110; #10;
    $display("%b   %b", inpt, out);
    inpt = 3'b111; #10;
    $display("%b   %b", inpt, out);

    enb = 0; inpt = 3'b100; #10;
    $display("%b   %b", inpt, out);

    $finish;
  end
endmodule
