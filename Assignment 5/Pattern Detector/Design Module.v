module pattern_detector (
    input  wire clk,
    input  wire rst_n,
    input  wire din,     
    output reg  dout   
);

    // State encoding
    parameter S0 = 2'b00;   
    parameter S1 = 2'b01;   
    parameter S2 = 2'b10;   
    parameter S3 = 2'b11;  

    reg [1:0] state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: if (din) next_state = S1; else next_state = S0;
            S1: if (din) next_state = S2; else next_state = S0;
            S2: if (!din) next_state = S3; else next_state = S2;
            S3: next_state = S0;   // reset for non-overlapping
            default: next_state = S0;
        endcase
    end

    always @(*) begin
        if (state == S3)
            dout = 1'b1;
        else
            dout = 1'b0;
    end

endmodule
