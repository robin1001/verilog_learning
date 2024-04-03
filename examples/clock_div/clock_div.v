module clock_div (
    input i_rst,
    input i_clk,
    output reg o_clk
);

    reg [1:0] cnt;
    always @(posedge i_clk) begin
        if (i_rst)
            cnt <= 2'b00;
        else
            cnt <= cnt + 1;
    end

    always @(posedge i_clk) begin
        if (i_rst)
            o_clk <= 1'b0;
        else if (cnt == 2'b11)
            o_clk <= ~o_clk;
        else
            o_clk <= o_clk;
    end

endmodule
