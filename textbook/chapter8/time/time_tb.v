module time_tb ();
    initial begin
       #0 $display("t %t", $time);
       #2 $display("t %t", $time);
       $finish(2);
    end
endmodule
