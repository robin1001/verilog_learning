module clock_gen #(
    parameter period = 10) (
    output reg o_clk
    );

    initial o_clk = 1'b0;

    always #(period/2) o_clk = ~o_clk;

endmodule
