module TestBench;

    reg clk, rst_n, din;
    wire dout;

    pattern_detector patterndetect (
        .clk(clk),
        .rst_n(rst_n),
        .din(din),
        .dout(dout)
    );

    reg [31:0] stream = 32'b10110110011011010011011011011011;
    integer i;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst_n = 0; din = 0;
        #12 rst_n = 1;

        for (i = 31; i >= 0; i = i - 1) begin
            din = stream[i];
            #10;  
        end

        #500 
        $finish;
    end
    
endmodule
