`timescale 1ns / 1ps

module Slave #
(
    parameter DATA_WIDTH = 8
)
(
    input  wire                   clk,
    input  wire                   resetn,   // active-low reset
    input  wire [DATA_WIDTH-1:0]  tdata,
    input  wire                   tvalid,
    output reg                    tready
);

    always @(posedge clk) begin
        if (!resetn) begin
            tready <= 0;
        end
        else begin
            // Always ready to receive
            tready <= 1;

            if (tvalid && tready) begin
                $display("Received data: %d", tdata);
            end
        end
    end

endmodule
