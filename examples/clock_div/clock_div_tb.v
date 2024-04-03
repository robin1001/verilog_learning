module clock_div_tb ();

    wire clk;
    wire clk8;
    reg rst;

    clock #(.PERIOD(2)) ck(.clk(clk));

    clock_div div (
        .i_rst(rst),
        .i_clk(clk),
        .o_clk(clk8)
    );

    initial begin
        rst = 1'b1;
        #8;
        rst = 1'b0;
        #100;

        $finish;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars;
    end

endmodule
