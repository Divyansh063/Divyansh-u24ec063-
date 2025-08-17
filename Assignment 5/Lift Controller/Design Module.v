module Pulse_generator (
    input  wire clk,       
    input  wire rst_n,     
    input  wire button,    
    output reg  pulse     
);

    reg button_d;

    always @(posedge clk) begin
        if (!rst_n) begin
            button_d <= 1'b0;
            pulse    <= 1'b0;
        end else begin
            button_d <= button;               
            pulse    <= button & ~button_d;   
        end
    end

endmodule
