module liftController (
    input clk,
    input rst_n,
    input [1:0] floor_button,
    output reg [1:0] current_floor,
    output reg motor_up,
    output reg motor_down
);

    reg [1:0] state;
    reg [1:0] target_floor;

    always @(posedge clk) begin
        if (!rst_n) begin
            state <= 2'b00;
            current_floor <= 2'd0;
            motor_up <= 0;
            motor_down <= 0;
            target_floor <= 2'd0;
        end else begin
            case (state)
                2'b00: begin
                    motor_up <= 0;
                    motor_down <= 0;
                    if (floor_button != current_floor) begin
                        target_floor <= floor_button;
                        if (floor_button > current_floor)
                            state <= 2'b01;
                        else if (floor_button < current_floor)
                            state <= 2'b10;
                    end
                end

                2'b01: begin
                    motor_up <= 1;
                    motor_down <= 0;
                    current_floor <= current_floor + 1;
                    if (current_floor + 1 == target_floor)
                        state <= 2'b00;
                end

                2'b10: begin
                    motor_up <= 0;
                    motor_down <= 1;
                    current_floor <= current_floor - 1;
                    if (current_floor - 1 == target_floor)
                        state <= 2'b00;
                end
            endcase
        end
    end

endmodule
