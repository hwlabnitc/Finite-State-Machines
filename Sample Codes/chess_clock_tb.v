module chess_clk_cntrl_tb();
  wire time_a,time_b,clr;
  reg player_a,player_b,clk,reset;
  chess_clk_cntrl 	uut(time_a,time_b,clr,player_a,player_b,clk,reset);
  initial
    begin
      $dumpfile("dump.vcd");
	  $dumpvars(1);
      clk=1'b0;
      forever 
        #50 clk=~clk;
    end
  
  initial
    begin
      reset=1'b1;player_a=1'b0;player_b=1'b0;
      #100 reset=1'b0;
      #101 player_a=1'b1;
      #167 player_a=1'b0;
      #215 player_b=1'b1;
      #289 player_b=1'b0;
      #350 player_a=1'b1;player_b=1'b1;
      #478 player_a=1'b0;player_b=1'b0;
      #513 player_b=1'b1;
      #550 $stop;
    end
endmodule
