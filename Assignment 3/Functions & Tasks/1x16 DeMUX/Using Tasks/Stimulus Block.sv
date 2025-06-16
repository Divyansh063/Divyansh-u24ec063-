module TestBench;
    parameter N = 16;
    reg inpt;
    reg [$clog2(N)-1:0] sel;
    wire [N-1:0] out;

  DeMUX #(N) demux (
        .inpt(inpt),
        .sel(sel),
        .out(out)
    );

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0, TestBench);
      
      $display("inpt sel out");
      
      $monitor("%b %b %b", inpt, sel, out);
        inpt = 1;
        sel = 0; #10;
        sel = 1; #10;
        sel = 2; #10;
        sel = 3; #10;
      	sel = 4; #10;
      	sel = 5; #10;
      	sel = 6; #10;
      	sel = 7; #10;
      sel = 8; #10;
      sel = 9; #10;
      sel = 10; #10;
      sel = 11; #10;
      sel = 12; #10;
      sel = 13; #10;
      sel = 14; #10;
      sel = 15; #10;
      
        inpt = 0;
        sel = 2; #10;
        
        $finish;
    end
endmodule
