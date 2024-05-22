module testbench;
reg clk,rst,in;
wire out;

PatternDetector inst (clk,rst,in,out);

initial begin
	clk = 1'b1;
	rst = 1'b1;
	#2 rst = 1'b0;
	@(posedge clk);
	#2 in = 1'b1;
	#2 in = 1'b0;
	#2 in = 1'b0;
	#2 in = 1'b0;
	#2 in = 1'b0;
	#2 in = 1'b1;
	#2 in = 1'b0;
	#2 in = 1'b0;
	#2 in = 1'b0;
	#2 in = 1'b1;
	//Testbench goes;
	#10 $finish; 
end

always #1 clk = ~clk;
endmodule