`timescale 1ns / 1ps

module Top (
    input  wire clk,
    input  wire resetn,
    output wire [7:0] tdata,
    output wire       tvalid,
    output wire       tready
);

    Master master (
        .clk(clk),
        .resetn(resetn),
        .tdata(tdata),
        .tvalid(tvalid),
        .tready(tready)
    );
    
    Slave slave (
        .clk(clk),
        .resetn(resetn),
        .tdata(tdata),
        .tvalid(tvalid),
        .tready(tready)
    );

endmodule
