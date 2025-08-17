`timescale 1ns / 1ps

module traffic_light (
    input  wire clk,
    input  wire rst_n,
    output reg  [1:0] north, // 2'b10=Green, 2'b01=Yellow, 2'b00=Red
    output reg  [1:0] east,
    output reg  [1:0] south,
    output reg  [1:0] west
);

    // State encoding
    localparam S0_N_GREEN  = 3'd0,
               S1_N_YELLOW = 3'd1,
               S2_E_GREEN  = 3'd2,
               S3_E_YELLOW = 3'd3,
               S4_S_GREEN  = 3'd4,
               S5_S_YELLOW = 3'd5,
               S6_W_GREEN  = 3'd6,
               S7_W_YELLOW = 3'd7;

    reg [2:0] state;
    reg [31:0] count;

    localparam Time_GREEN  = 10; // cycles for green
    localparam Time_YELLOW = 3;  // cycles for yellow

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S0_N_GREEN;
            count <= Time_GREEN;
        end 
        else begin
            if (count == 0) begin
                case (state)
                    S0_N_GREEN:  begin state <= S1_N_YELLOW; count <= Time_YELLOW; end
                    S1_N_YELLOW: begin state <= S2_E_GREEN;  count <= Time_GREEN;  end
                    S2_E_GREEN:  begin state <= S3_E_YELLOW; count <= Time_YELLOW; end
                    S3_E_YELLOW: begin state <= S4_S_GREEN;  count <= Time_GREEN;  end
                    S4_S_GREEN:  begin state <= S5_S_YELLOW; count <= Time_YELLOW; end
                    S5_S_YELLOW: begin state <= S6_W_GREEN;  count <= Time_GREEN;  end
                    S6_W_GREEN:  begin state <= S7_W_YELLOW; count <= Time_YELLOW; end
                    S7_W_YELLOW: begin state <= S0_N_GREEN;  count <= Time_GREEN;  end
                endcase
            end 
            else begin
                count <= count - 1;
            end
        end
    end

    always @(*) begin
        north = 2'b00;
        east  = 2'b00;
        south = 2'b00;
        west  = 2'b00;

        case (state)
            S0_N_GREEN:  north = 2'b10;
            S1_N_YELLOW: north = 2'b01;
            S2_E_GREEN:  east  = 2'b10;
            S3_E_YELLOW: east  = 2'b01;
            S4_S_GREEN:  south = 2'b10;
            S5_S_YELLOW: south = 2'b01;
            S6_W_GREEN:  west  = 2'b10;
            S7_W_YELLOW: west  = 2'b01;
        endcase
    end

endmodule
