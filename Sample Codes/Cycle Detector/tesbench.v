module testbench;
reg clk,rst,in;
wire detected;

CycleDetector inst (clk,rst,in,detected);

initial begin

clk = 1'b0;
rst = 1'b1;
#2 rst = 1'b0;
@ (posedge clk);
#2 in = 1'b0;
#2 in = 1'b1;
#2 in = 1'b1;
#2 in = 1'b0;
#2 in = 1'b1;
#2 in = 1'b0;
#2 in = 1'b0;
#2 in = 1'b1;
#2 in = 1'b0;
#2 in = 1'b1;
#2 in = 1'b0;
#2 in = 1'b1;
#2 in = 1'b0;
#2 in = 1'b0;
#2 in = 1'b1;
#2 in = 1'b0;
#2 in = 1'b1;
#2 in = 1'b0;
#2 in = 1'b0;
#2 in = 1'b1;
#4 $finish;
end

always #1 clk = ~clk;

endmodule