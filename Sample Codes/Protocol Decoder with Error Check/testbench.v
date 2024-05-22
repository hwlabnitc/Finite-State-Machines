//TESTBENCH
`timescale 1ns/100ps
module testbench;
reg clk;
reg rst;
reg serial_in;

wire [7:0]data_out;
wire valid;
wire error;

ProtocolDecoder inst(clk,rst,serial_in,data_out,valid,error);

always #1 clk = ~clk;

initial begin
clk <= 1'b0;
rst <= 1'b1;
#2 rst <= 1'b0;

// Test case 1
@(posedge clk);
#2 serial_in <= 1'b0; // Start bit
#2 serial_in <= 1'b1;
#2 serial_in <= 1'b1;
#2 serial_in <= 1'b0;
#2 serial_in <= 1'b1;
#2 serial_in <= 1'b1;
#2 serial_in <= 1'b0;
#2 serial_in <= 1'b0;
#2 serial_in <= 1'b1;
#2 serial_in <= 1'b1;
#2 serial_in <= 1'b0;

#10;
$finish;
end
endmodule