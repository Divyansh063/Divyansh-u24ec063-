module TestBench;

reg inpt;
reg [1:0] sel;
wire [3:0] out;

DeMUX demux (
    .inpt(inpt),
    .sel(sel),
    .out(out)
);

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, TestBench);
  
  $display("inpt sel out");
  
  $monitor("%b    %b  %b", inpt, sel, out);
  
    inpt = 0; sel = 2'b00; #10;
    inpt = 1; sel = 2'b00; #10;
    inpt = 1; sel = 2'b01; #10;
    inpt = 1; sel = 2'b10; #10;
    inpt = 1; sel = 2'b11; #10;
    inpt = 0; sel = 2'b11; #10;
           
    $finish;
end

endmodule
