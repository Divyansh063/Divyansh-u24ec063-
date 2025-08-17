`timescale 1ns / 1ps

module LUTram (
    input  wire        clk,
    input  wire        we,            // Write enable
    input  wire [7:0]  in_data,       
    input  wire [15:0] in_wradd,      
    input  wire [15:0] in_rdadd,      
    output reg  [7:0]  out_read       
);

    // 64KB memory = 65536 x 8
    reg [7:0] loctn [0:65535];

    always @(posedge clk) begin
        if (we) begin
            loctn[in_wradd] <= in_data;
        end

        if (we && (in_wradd == in_rdadd)) begin
            out_read <= in_data;      
        end else begin
            out_read <= loctn[in_rdadd]; 
        end
    end

endmodule
