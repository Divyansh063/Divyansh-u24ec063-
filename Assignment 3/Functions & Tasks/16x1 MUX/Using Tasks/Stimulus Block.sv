module TestBench;
  parameter N = 16; // Value of N(input size) can be changed.
  parameter W = 4;  // W can also be changed.
  parameter sel_size = $clog2(N);

  reg [N*W-1:0] input_size;
  reg [sel_size-1:0] sel;
  wire [W-1:0] y;

  MUX #(.N(N)) mux (
    .input_size(input_size),
    .sel(sel),
    .y(y)
  );
  
  int i;// in Verilog, integer is 32 bits by default
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(0, TestBench);
    
    $display("sel(3210)    output");
  
  for (i = 0; i < N; i++) begin
      input_size[i*W +: W] = i; 
    end

  for (i = 0; i < N; i++) begin
      sel = i;
      #10;
    $display("    %b     %b", sel, y);
    end

    $finish;
  end


endmodule
