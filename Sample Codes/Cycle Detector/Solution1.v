module CycleDetector(
input clk, rst, in,
output reg detected
);

parameter A = 3'b000, B = 3'b001, C = 3'b010,
			 D = 3'b011, E = 3'b100, F = 3'b101;
	
reg [2:0] current, next;

always@ (posedge clk or posedge rst) begin
	if(rst) begin
		next = A;
		detected = 1'b0;
		current = 1'bx;
	end else begin
		current = next;
		case(current)
			
			A: begin
				detected = 1'b0;
				if(in)
					next = B;
				else
					next = A;
			end
			
			B: begin
				detected = 1'b0;
				if(~in)
					next = C;
				else
					next = B;
			end
			
			C: begin
				detected = 1'b0;
				if(in)
					next = D;
				else
					next = A;
			end
			
			D: begin
				detected = 1'b0;
				if(~in)
					next = E;
				else
					next = B;
			end
			
			E: begin
				detected = 1'b0;
				if(~in)
					next = F;
				else
					next = D;
			end
			
			F:begin
				if(in) begin
					detected = 1'b1;
					next = B;
				end else begin
					detected = 1'b0;
					next = A;
				end
			end
		endcase
	end
end
endmodule
