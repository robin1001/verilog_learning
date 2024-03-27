module fsm_bus_control (
   input i_clk,
   input i_rst_n,
   input i_write,
   input i_sel,
   input i_ok,
   output [2:0] o_stat_current,
   output [2:0] o_stat_next
);

   parameter Reset = 3'b000;
   parameter Idle = 3'b001;
   parameter Read = 3'b010;
   parameter Write = 3'b011;
   parameter Delay = 3'b100;

   reg [2:0] cur_stat;
   reg [2:0] nxt_stat;

  always @(posedge i_clk or negedge i_rst_n)
      if (!i_rst_n)
          cur_stat <= Reset;
      else
          cur_stat <= nxt_stat;

  always @(cur_stat or i_write or i_sel or i_ok or i_rst_n) begin
      case (cur_stat)
          Reset:
              if (!i_rst_n)
                  nxt_stat = Reset;
              else
                  nxt_stat = Idle;
          Idle:
              if (i_write && i_sel)
                 nxt_stat = Write;
              else if (!i_write && i_sel)
                 nxt_stat = Read;
              else
                 nxt_stat = Reset;
          Read:
              nxt_stat = Delay;
          Write:
              nxt_stat = Delay;
          Delay:
              if (!i_ok)
                  nxt_stat = Delay;
              else
                  nxt_stat = Idle;
          default:
              nxt_stat = Idle;
      endcase
  end

  assign o_stat_current = cur_stat;
  assign o_stat_next = nxt_stat;

endmodule
