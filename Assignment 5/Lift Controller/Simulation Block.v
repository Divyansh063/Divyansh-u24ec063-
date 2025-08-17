`timescale 1ns / 1ps

module TestBench;

    reg clk;
    reg rst_n;
    reg [1:0] floor_button;
    wire [1:0] current_floor;
    wire motor_up;
    wire motor_down;

    liftController lift (
        .clk(clk),
        .rst_n(rst_n),
        .floor_button(floor_button),
        .current_floor(current_floor),
        .motor_up(motor_up),
        .motor_down(motor_down)
    );

    initial clk = 0;
    always #5 clk = ~clk;  

    initial begin
        rst_n = 0;
        floor_button = 2'd0;

        #20;
        rst_n = 1;

        #10 floor_button = 2'd2;
        #100;

        #10 floor_button = 2'd0;
        #100;

        #10 floor_button = 2'd1;
        #100;

        $finish;
    end

endmodule
