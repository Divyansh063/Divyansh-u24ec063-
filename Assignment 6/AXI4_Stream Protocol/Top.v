`timescale 1ns / 1ps

module Top (
    input  wire clk,
    input  wire resetn,
    output wire [7:0] tdata,
    output wire       tvalid,
    output wire       tready
);

    // Master instance
    Master master_inst (
        .clk(clk),
        .resetn(resetn),
        .tdata(tdata),
        .tvalid(tvalid),
        .tready(tready)
    );

    // Slave instance
    Slave slave_inst (
        .clk(clk),
        .resetn(resetn),
        .tdata(tdata),
        .tvalid(tvalid),
        .tready(tready)
    );

endmodule
