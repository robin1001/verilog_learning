module clock (
    output reg clk
);
    parameter PERIOD = 10;

    initial begin
        clk = 1'b0;
    end

    always #(PERIOD / 2) begin
        clk = ~clk;
    end

endmodule
