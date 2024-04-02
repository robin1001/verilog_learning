module sum (
    input [7:0] x,
    input [7:0] y,
    output [7:0] z,
    output cout
);

    assign {cout, z} = x + y;

endmodule
