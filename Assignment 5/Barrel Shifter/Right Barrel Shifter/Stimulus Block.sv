`timescale 1ns/1ps

module TestBench;
    reg  [31:0] data_in;
    reg  [4:0]  shift_amt;
    wire [31:0] data_out;

    barrel_shifter_right BSR (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .data_out(data_out)
    );

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0,TestBench);
      
      $display("data_in    shift_amt    data_out");
      $monitor("0x%08h   0x%02h   0x%08h",
                data_in, shift_amt, data_out);

        data_in = 32'h0000001f; 
        shift_amt = 5'h00; #10;
        shift_amt = 5'h01; #10;
        shift_amt = 5'h04; #10;
        shift_amt = 5'h08; #10;
        shift_amt = 5'h10; #10;
        shift_amt = 5'h1F; #10;

        $finish;
    end
endmodule
