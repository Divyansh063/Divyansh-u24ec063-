module DeMUX(
    input wire inpt,     
    input wire sel,    
    output reg out0,   
    output reg out1    
);

always @(*) begin
    if (sel == 1'b0) begin
        out0 = inpt;
        out1 = 1'b0;
    end else begin
        out0 = 1'b0;
        out1 = inpt;
    end
end

endmodule
