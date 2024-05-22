//TESTBENCH
`timescale 1ns/100ps
module testbench;
reg clk,rst,close_req,open_req,up_req,down_req,stop;	
wire open,moving,up,down,error;

ElevatorController inst (clk,rst,close_req,open_req,up_req,down_req,stop,open,moving,up,down,error);
always #1 clk = ~clk;

initial begin
	clk = 1;
	rst = 1;
	#2 rst = 0;
	@(posedge clk);
	#2 close_req = 1'b1;
		open_req = 1'b0;
		up_req = 1'b0;
		down_req = 1'b0;
		stop = 1'b0;
	
	#2 close_req = 1'b1;
		open_req = 1'b0;
		up_req = 1'b0;
		down_req = 1'b0;
		stop = 1'b0;
		
	#2 close_req = 1'b0;
		open_req = 1'b0;
		up_req = 1'b1;
		down_req = 1'b0;
		stop = 1'b0;
		
	#2 close_req = 1'b0;
		open_req = 1'b1;
		up_req = 1'b0;
		down_req = 1'b0;
		stop = 1'b0;
	
	#10 $finish;
end
endmodule