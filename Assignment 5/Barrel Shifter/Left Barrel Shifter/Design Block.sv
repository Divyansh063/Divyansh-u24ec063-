`timescale 1ns/1ps

module barrel_shifter_left (
    input  wire [31:0] data_in,   
    input  wire [4:0]  shift_amt,      // Shift amount (0-31)
    output wire [31:0] data_out   
);
    assign data_out = data_in << shift_amt;  // Logical Left Shift
endmodule
