`timescale 1ns/1ps

module barrel_shifter (
    input  wire [31:0] data_in,   
    input  wire [4:0]  shift_amt,     // Shift amount (0-31)
    input  wire        sel,       // Select: 0=Left, 1=Right
    output reg  [31:0] data_out   
);

    always @(*) begin
        case (sel)
            1'b0: data_out = data_in << shift_amt;  // Left shift
            1'b1: data_out = data_in >> shift_amt;  // Right shift
            default: data_out = 32'h0000_0000;
        endcase
    end

endmodule
