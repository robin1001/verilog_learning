module count (
  input clk,
  input rst,
  output reg [7:0] cnt
);

 always @(posedge clk) begin
     if (rst)
         cnt <= 8'b0;
     else
         cnt <= cnt + 8'b0000_0001;
 end

endmodule
