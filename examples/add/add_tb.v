module sum_tb();

    reg [7:0] x;
    reg [7:0] y;
    wire [7:0] z;

    sum s(
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin
      x = 8'b0000_0000;
      y = 8'b0000_0001;

      #5;
      $display("x = %b, y = %b, z = %b", x, y, z);

      $finish;
    end

endmodule
