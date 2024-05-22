module testbench;
reg clk,rst,in;
wire out;

CycleDetector inst(clk,rst,in,out);

always #1 clk = ~clk;

initial begin
	clk = 1'b1;
	rst = 1'b1;
	#2 rst = 0;
	@(posedge clk);
	#2 in = 1'b1;
	#2 in = 1'b0;
	#2 in = 1'b0;
	#2 in = 1'b0;
	#2 in = 1'b1;
	#2 in = 1'b0;
	//#2 Testbench continues...
	#10 $finish;
end
endmodule