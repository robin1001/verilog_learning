module switch_bytes_tb ();

   task switch_bytes_task;
       input [15:0] i_word;
       output [15:0] o_word;
       o_word = {i_word[7:0], i_word[15:8]};
   endtask

   function [15:0] switch_bytes_func;
       input [15:0] i_word;
       switch_bytes_func = {i_word[7:0], i_word[15:8]};
   endfunction

   reg [15:0] old_word;
   reg [15:0] new_word;

   initial begin
       old_word = 16'h00ff;

       switch_bytes_task(old_word, new_word);
       $display("i:%b o:%b", old_word, new_word);

       new_word = switch_bytes_func(old_word);
       $display("i:%b o:%b", old_word, new_word);
   end

endmodule
