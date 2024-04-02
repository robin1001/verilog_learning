module mux4_1_tb ();

    reg i0, i1, i2, i3;
    reg [1:0] sel;
    wire o;


    mux4_1 mux(
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .i_sel(sel),
        .o(o)
    );


    initial begin
        i0 = 1'b0;
        i1 = 1'b0;
        i2 = 1'b0;
        i3 = 1'b1;
        sel = 2'b11;

        #5;

        $display("select %b", o);

        $finish;
    end

endmodule
