module PatternDetector(
input clk,rst,in,
output reg out
);

parameter A = 3'b000;
parameter B = 3'b001;
parameter C = 3'b010;
parameter D = 3'b011;
parameter E = 3'b100;

reg [2:0] current,next = A;

always@(posedge clk or posedge rst) begin
	if(rst) begin
		out = 1'bx;
		next = A;
	end else begin
		current = next;
		case(current)
			A: begin
				out = 1'b0;
				if(in) begin
					next = B;
				end else begin
					next = A;
				end
			end
			
			B: begin
				out = 1'b0;
				if(in) begin
					 next = B;
				end else begin
					next = C;
				end
			end
			
			C: begin
				out = 1'b0;
				if(in) begin
					next = B;
				end else begin
					next = D;
				end
			end
			
			D: begin
				out = 1'b0;
				if(in) begin
					next = B;
				end else begin
					next = E;
				end
			end
			
			E: begin
				if(in) begin
					out = 1'b1;
					next = B;
				end else begin
					out = 1'b0;
					next = B;
				end
			end
		endcase
	end
end
endmodule