`timescale 1ns / 1ps

module reg_rtl (
    input  wire        clk,
    input  wire        en,          
    input  wire [15:0] wr_data,
    input  wire [3:0]  wr_addr,
    input  wire [3:0]  rd_addr1,
    input  wire [3:0]  rd_addr2,
    output reg  [15:0] rd_data1,
    output reg  [15:0] rd_data2
);

    // 16 registers of 16 bits
    reg [15:0] reg_file [0:15];

    integer i;
    initial begin
        for (i=0; i<16; i=i+1)
            reg_file[i] = 16'h0000;
        rd_data1 = 16'h0000;
        rd_data2 = 16'h0000;
    end

    always @(posedge clk) begin
        if (en) begin
            reg_file[wr_addr] <= wr_data;
        end

        if (en && (rd_addr1 == wr_addr))
            rd_data1 <= wr_data;        
        else
            rd_data1 <= reg_file[rd_addr1];

        if (en && (rd_addr2 == wr_addr))
            rd_data2 <= wr_data;         
        else
            rd_data2 <= reg_file[rd_addr2];
    end

endmodule
