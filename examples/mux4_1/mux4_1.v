module mux4_1 (
    input i0,
    input i1,
    input i2,
    input i3,
    input [1:0] i_sel,
    output reg o
);

    always @(i0, i1, i2, i3, i_sel) begin
        case(i_sel)
            2'b00: o = i0;
            2'b01: o = i1;
            2'b10: o = i2;
            2'b11: o = i3;
            default: o = 2'bx;
        endcase
    end

endmodule
