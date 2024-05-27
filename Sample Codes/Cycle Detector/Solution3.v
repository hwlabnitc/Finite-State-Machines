module CycleDetector(out,in,clk,r);
input in,clk,r;
output reg out;

reg [1:0]current,next;

parameter [3:0]S0='d0;
parameter [3:0]S1='d1;
parameter [3:0]S2='d2;
parameter [3:0]S3='d3;
parameter [3:0]S4='d4;
parameter [3:0]S5='d5;
parameter [3:0]S6='d6;
parameter [3:0]S7='d7;

always @ (posedge clk or posedge r) begin
	if(r) begin
		out=1'b0;
		current=S0;
		next=S0;
	end
	current=next;
	case(current)
	S0: begin
			if(in) begin
				out=1'b0;
				next=S1;
			end
			else begin
				out=1'b0;
				next=S0;
			end 
		 end
	S1: begin
			if(in) begin
				out=1'b0;
				next=S2;
			end
			else begin
				out=1'b0;
				next=S0;
			end 
		 end
	S2: begin
			if(in) begin
				out=1'b0;
				next=S3;
			end
			else begin
				out=1'b0;
				next=S0;
			end
		 end
	S3: begin
			if(in) begin
				out=1'b0;
				next=S2;
			end
			else begin
				out=1'b0;
				next=S4;
			end 
		 end
	S4: begin
			if(in) begin
				out=1'b0;
				next=S5;
			end
			else begin
				out=1'b0;
				next=S0;
			end 
		 end
	S5: begin
			if(in) begin
				out=1'b1;
				next=S1;
			end
			else begin
				out=1'b0;
				next=S6;
			end
		 end
	S6: begin
			if(in) begin
				out=1'b0;
				next=S0;
			end
			else begin
				out=1'b0;
				next=S7;
			end 
		 end
	S7: begin
			if(in) begin
				out=1'b1;
				next=S0;
			end
			else begin
				out=1'b0;
				next=S0;
			end
		 end
	endcase
end
endmodule
