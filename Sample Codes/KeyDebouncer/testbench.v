//TESTBENCH
`timescale 1ns/100ps
module testbench;
reg clk, rst, key_pressed;
reg [4:0] Key_Id;
wire key_saved;

Debouncer inst(clk,rst,key_pressed,Key_Id,key_saved);

always #1 clk = ~clk;

initial begin
	clk = 1'b1;
	rst = 1'b1;
	#2 rst = 1'b0;
	@(posedge clk);
	#2 key_pressed = 1'b1;
		Key_Id = 5'b00101;
	#10 key_pressed = 1'b0;
	#10 $finish;
end
endmodule