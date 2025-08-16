`timescale 1ns / 1ps

module Master #
(
    parameter DATA_WIDTH = 8
)
(
    input  wire                   clk,
    input  wire                   resetn,   // active-low reset
    output reg  [DATA_WIDTH-1:0]  tdata,
    output reg                    tvalid,
    input  wire                   tready
);

    reg [DATA_WIDTH-1:0] counter;

    always @(posedge clk) begin
        if (!resetn) begin
            counter <= 0;
            tdata   <= 0;
            tvalid  <= 0;
        end
        else begin
            if (!tvalid) begin
                // Send first data
                tdata  <= counter;
                tvalid <= 1;
            end
            else if (tvalid && tready) begin
                // Handshake done, send next data
                counter <= counter + 1;
                tdata   <= counter + 1;
                tvalid  <= 1;
            end
        end
    end

endmodule
