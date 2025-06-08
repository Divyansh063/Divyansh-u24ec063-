module TestBench;

reg inpt;
reg sel;
wire out0, out1;

DeMUX demux (
    .inpt(inpt),
    .sel(sel),
    .out0(out0),
    .out1(out1)
);

initial begin
    
  $dumpfile("dump.vcd");
  $dumpvars(0,TestBench);
  
  $display("inpt sel out0 out1");
  
    inpt = 0; sel = 0; #10;
  $display("%b    %b   %b    %b", inpt, sel, out0, out1);

    inpt = 1; sel = 0; #10;
  $display("%b    %b   %b    %b", inpt, sel, out0, out1);
  
    inpt = 0; sel = 1; #10;
  $display("%b    %b   %b    %b", inpt, sel, out0, out1);

    inpt = 1; sel = 1; #10;
  $display("%b    %b   %b    %b", inpt, sel, out0, out1);

    $finish;
end

endmodule
