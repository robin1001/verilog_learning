module sum_tb();

    reg [7:0] x;
    reg [7:0] y;
    wire [7:0] z;
    wire cout;

    sum s(
        .x(x),
        .y(y),
        .z(z),
        .cout(cout)
    );

    initial begin
      x = 8'b1111_1110;
      y = 8'b0000_0001;

      #5;
      $display("x = %b, y = %b, z = %b, cout = %b", x, y, z, cout);

      $finish;
    end

endmodule
