module CycleDetector(
input clk,rst,in,
output reg out
);

parameter first_one = 2'b00;
parameter first_zero = 2'b01;
parameter second_one = 2'b10;
parameter second_zero = 2'b11;

reg [1:0] current, next = first_one;

always @(posedge clk or posedge rst) begin
	if(rst) begin
		next = first_one;
		out = 1'bx;
	end else begin
		current = next;
		case(current)
			first_one : begin
				out = 1'b0;
				if(in) begin
					next = first_zero;
				end else begin
					next = first_one;
				end
			end
			
			first_zero: begin
				out = 1'b0;
				if(in) begin
					next = first_one;
				end else begin
					next = second_one;
				end
			end
			
			second_one: begin
				out = 1'b0;
				if(in) begin
					next = second_zero;
				end else begin
					next = second_one;
				end
			end
			
			second_zero: begin
				if(in) begin
					out = 1'b0;
					next = second_one;
				end else begin
					out = 1'b1;
					next = first_one;
				end
			end
		endcase
	end
end
endmodule