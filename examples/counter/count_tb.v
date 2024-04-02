module count_tb ();

    wire clk;
    reg rst;
    wire [7:0] cnt;

    clock #(.PERIOD(10)) ck(
        .clk(clk)
    );

    count c(
       .clk(clk),
       .rst(rst),
       .cnt(cnt)
    );


    initial begin
        #0; rst = 1'b1;
        #10; rst = 1'b0;

        // first init, should be zero
        $display("count %b", cnt);

        // 10 clock, should be 10
        #100; $display("count %b", cnt);

        $finish;
    end

endmodule
