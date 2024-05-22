`timescale 1ns/100ps
module testbench;
reg fast_clk,slow_clk,rst;
wire Red,Yellow,Green;

TLFSM inst(slow_clk,fast_clk,rst,Red,Yellow,Green);

always #1 fast_clk = ~fast_clk;
always #3 slow_clk = ~slow_clk;

initial begin
	fast_clk = 1'b1;
	slow_clk = 1'b1;
	#2 rst = 1'b1;
	#1 rst = 1'b0;
	#400 $finish;
end
endmodule