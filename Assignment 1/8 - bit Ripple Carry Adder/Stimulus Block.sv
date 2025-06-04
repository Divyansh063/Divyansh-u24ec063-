module TestBench;

    reg [7:0] A, B;
    reg Cin;
    wire [7:0] S;
    wire Cout;

    CarryAdder carryadder (
      .A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout)
    );

    initial begin
      
      $dumpfile("dump.vcd");
      $dumpvars(0, TestBench);
      
      $display("A         B          Cin   S          Cout");

        A = 8'b00001111; B = 8'b00000001; Cin = 0; #10;
      $display("%b  %b   %b     %b   %b", A, B, Cin, S, Cout);

        A = 8'b11111111; B = 8'b00000001; Cin = 0; #10;
      $display("%b  %b   %b     %b   %b", A, B, Cin, S, Cout);

        A = 8'b10101010; B = 8'b01010101; Cin = 1; #10;
      $display("%b  %b   %b     %b   %b", A, B, Cin, S, Cout);

        A = 8'b00000000; B = 8'b00000000; Cin = 1; #10;
      $display("%b  %b   %b     %b   %b", A, B, Cin, S, Cout);
      
      A = 8'b00001001; B = 8'b00110010; Cin = 0; #10;
      $display("%b  %b   %b     %b   %b", A, B, Cin, S, Cout);
      
      A = 8'b11010111; B = 8'b10010101; Cin = 1; #10;
      $display("%b  %b   %b     %b   %b", A, B, Cin, S, Cout);

        $finish;
    end

endmodule
