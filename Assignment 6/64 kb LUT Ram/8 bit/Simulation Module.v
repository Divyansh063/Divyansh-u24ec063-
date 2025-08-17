`timescale 1ns / 1ps

module Testbench;

    reg clk;
    reg we;
    reg [7:0] in_data;
    reg [15:0] in_wradd;
    reg [15:0] in_rdadd;
    wire [7:0] out_read;

    LUTram ram (
        .clk(clk),
        .we(we),
        .in_data(in_data),
        .in_wradd(in_wradd),
        .in_rdadd(in_rdadd),
        .out_read(out_read)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        we  = 0;
        in_data = 8'd0;
        in_wradd = 16'd0;
        in_rdadd = 16'd0;

        #10; we = 1; in_data = 8'hAA; in_wradd = 16'd1; in_rdadd = 16'd1;   
        #10; we = 1; in_data = 8'h55; in_wradd = 16'd2; in_rdadd = 16'd1;   
        #10; we = 1; in_data = 8'hF0; in_wradd = 16'd3; in_rdadd = 16'd2;   
        #10; we = 1; in_data = 8'h0F; in_wradd = 16'd4; in_rdadd = 16'd3;   

        #10; we = 1; in_data = 8'h99; in_wradd = 16'd60000; in_rdadd = 16'd4;
        #10; we = 1; in_data = 8'h77; in_wradd = 16'd65535; in_rdadd = 16'd60000;

        #10; we = 0; in_rdadd = 16'd1;   
        #10; we = 0; in_rdadd = 16'd2;   
        #10; we = 0; in_rdadd = 16'd3;   
        #10; we = 0; in_rdadd = 16'd65535;

        #10; we = 1; in_data = 8'hCC; in_wradd = 16'd10; in_rdadd = 16'd10; // Read should be 0xCC immediately

        #20;
        $finish;
    end

endmodule
