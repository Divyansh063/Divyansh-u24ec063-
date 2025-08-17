`timescale 1ns / 1ps

module TestBench;

    reg clk;
    reg rst_n;
    wire [1:0] north;
    wire [1:0] east;
    wire [1:0] south;
    wire [1:0] west;

    traffic_light trafflight (
        .clk  (clk),
        .rst_n(rst_n),
        .north(north),
        .east (east),
        .south(south),
        .west (west)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
    
        rst_n = 0;
        #25;       
        rst_n = 1;
        
        #3200; // based on the time given to green and yellow signal, for proper observation
        $display("\nSimulation complete");
        $finish;
    end
    
    function [8*6:1] color; // ASCII characters are 8 bits.
        input [1:0] v;
        begin
            if (v == 2'b10)      color = "GREEN ";
            else if (v == 2'b01) color = "YELLOW";
            else                 color = "RED   ";
        end
    endfunction

    initial begin
        $display("NORTH      EAST      SOUTH     WEST");
        wait (rst_n == 1);
        @(posedge clk);
        $display("%s  %s  %s  %s",
                 color(north), color(east), color(south), color(west));
                 
        forever @(posedge clk) begin
            $display("%s  %s  %s  %s",
                     color(north), color(east), color(south), color(west));
        end
    end

endmodule
