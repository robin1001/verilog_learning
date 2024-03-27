module fsm_bus_control_tb (
);

   reg rst_n, write, select, resp_ok;
   wire clk;
   wire [2:0] stat_cur, stat_nxt;

   reg [35:0] stimulus [0:31];

   parameter Reset = 3'b000;
   parameter Idle = 3'b001;
   parameter Read = 3'b010;
   parameter Write = 3'b011;
   parameter Delay = 3'b100;

   clock_gen #(15) cgen(
       .o_clk(clk)
   );

   fsm_bus_control fsm(
       .i_clk(clk),
       .i_rst_n(rst_n),
       .i_write(write),
       .i_sel(select),
       .i_ok(resp_ok),
       .o_stat_current(stat_cur),
       .o_stat_next(stat_nxt)
   );

   initial
       $readmemh("fsm_sim.dat", stimulus);

   integer i;
   reg [35:0] line;
   wire [3:0] cmd = line[35:32];
   wire [15:0] addr = line[31:16];
   wire [15:0] data = line[15:0];

   initial begin
       #0 rst_n = 1'b1; write = 1'b0; select = 1'b0; resp_ok = 1'b0;
       #50 rst_n = 1'b0;
       #50 if (stat_cur != Reset)
               $display("error: Expect Reset, but got %b", stat_cur);
       #50 rst_n = 1'b1;
       #50 i = 0; line = stimulus[i];
       if (stat_cur != Idle)
               $display("error: Expect Idle, but got %b", stat_cur);
       #1;

       while (cmd != 4'h2) begin
           $display("info: cmd = %h, addr = %h, data = %h", cmd, addr, data);
           // if (cmd == 4'h0) begin
           //     write = 1'b1; select = 1'b1;
           //     @(posedge clk)
           //         #1 if (stat_cur != Write)
           //                $display("error Expect Write, stat_cur = %b", stat_cur);
           // end
           i = i + 1;
           line = stimulus[i];
           #1;
       end

       $finish;
   end

endmodule
