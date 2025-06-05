module TestBench;
   reg [3:0] A, B, C, D;
   reg [1:0] sel;
  wire [3:0] out;
  
  MUX mux(.A(A),
          .B(B),
          .C(C),
          .D(D),
          .sel(sel),
          .out(out));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, TestBench);
  
    $display(" A  B C   D sel out");
    
    A = 4'b0101; B = 4'b1001; C = 4'b1111; D = 4'b0010;
    
    sel = 2'b00; #10; $display("%d %d %d %d %b  %d", A, B, C, D, sel, out);
    sel = 2'b01; #10; $display("%d %d %d %d %b  %d", A, B, C, D, sel, out);
    sel = 2'b10; #10; $display("%d %d %d %d %b  %d", A, B, C, D, sel, out);
    sel = 2'b11; #10; $display("%d %d %d %d %b  %d", A, B, C, D, sel, out);

    $finish;
  end

endmodule
    
