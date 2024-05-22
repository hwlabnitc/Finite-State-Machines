module TLFSM(
input slow_clk, fast_clk,rst,
output reg Red,Yellow, Green
);

parameter R = 2'b00;
parameter Y = 2'b01;
parameter G = 2'b10;

reg [2:0] current,next = R;
reg [1:0] Fcount,Scount;


always @(posedge fast_clk or posedge rst) begin
		if(rst)
			Fcount = 2'b00;
		if (current == Y)
		Fcount = Fcount + 2'b01;
		if(Fcount == 2'b11)
			Fcount = 2'b00;
end

always @(posedge slow_clk or posedge rst) begin
		if(rst)
			Scount = 2'b00;
		if(current == R || current == G)
			Scount = Scount + 2'b01;
		if(Scount == 2'b11)
			Scount = 2'b00;
end

always @(Fcount or Scount or rst) begin
	if(rst) begin
		Red = 1'b0;
		Yellow = 1'b0;
		Green = 1'b0;
		next = R;
	end
	else begin
		current = next;
		case(current)
			R: begin
				Red = 1'b1;
				Yellow = 1'b0;
				Green = 1'b0;
				if(Scount == 2'b10)
					next = Y;
			end
			
			Y: begin
				Red = 1'b0;
				Yellow = 1'b1;
				Green = 1'b0;
				if(Fcount == 2'd2)
					next = G;
			end
			
			G: begin
				Red = 1'b0;
				Yellow = 1'b0;
				Green = 1'b1;
				if(Scount == 2'd2)
					next = R;
			end
		endcase
	end
end
endmodule