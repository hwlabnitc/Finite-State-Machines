module vending_machine_tb();
  wire vend;
  wire [2:0] change,state;
  reg [2:0] coin;
  reg clk,rst;
  
  vending_machine uut(vend,change,state,coin,clk,rst);
  
  parameter [2:0]rs_5= 3'b001;
  parameter [2:0]rs_10= 3'b010;
  parameter [2:0]rs_15= 3'b011;
  parameter [2:0]rs_20= 3'b100;
  parameter [2:0]rs_25= 3'b101;
  
  parameter [2:0]idle= 3'b000;
  parameter [2:0]five= 3'b001;
  parameter [2:0]ten= 3'b010;
  parameter [2:0]fifteen= 3'b011;
  parameter [2:0]twenty= 3'b100;
  parameter [2:0]twenty_five=3'b101;
  
  initial 
    begin
    $dumpvars;
	  $dumpfile("file.vcd");
      clk=1'b0; rst=1'b1;
      #2 rst=0; coin=rs_5;
      #2 rst=1; coin=2'b00;
      #2 rst=0;coin=rs_10;
      #2 rst=1; coin=2'b00;
	  #2 rst=0; coin=rs_25;
      #2 rst=1; coin=2'b00;
      #2 rst=0; coin=rs_5;
      #2 coin=rs_5;
      #2 coin=rs_5;
      #2 coin=rs_5;
      #2 coin=rs_5;
      #2 rst=1; coin=2'b00;
      #2 rst=0; coin=rs_5;
      #2 coin=rs_10;
      #2 coin=rs_10;
      #2 rst=1; coin=2'b00;
      #2 rst=0; coin=rs_10;
      #2 coin=rs_25;
      #2 coin=rs_5;
      #2 rst=1; coin=2'b00;
      #2 rst=0; coin=rs_10;
      #2 coin= rs_10;
      #2 coin=rs_25;
      #2 rst=1; coin=2'b00;
      #2 $finish;
    end
  always
	#1 clk=~clk;
  initial 
    begin
      if (rst)
			coin=2'b00;
	end
endmodule








