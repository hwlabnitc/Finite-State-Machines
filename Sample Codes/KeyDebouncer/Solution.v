module Debouncer(
input clk,rst,key_pressed,
input [4:0] Key_Id,
output reg key_saved
);

//Parameters
parameter Input = 2'b00;
parameter Wait = 2'b01;
parameter DebounceLow = 2'b10;
parameter DebounceHigh = 2'b11;

reg [1:0] current, next = Input;
reg [4:0] prev;

always@(posedge clk or posedge rst) begin
	if(rst) begin
		next = Input;
		key_saved = 1'bx;
	end else begin
		current = next;
		case(current)
			Input: begin
				key_saved = 1'b0;
				prev = 5'bx;
				if(key_pressed) begin
					prev = Key_Id;
					next = Wait;
				end
			end
			
			Wait: begin
				key_saved = 1'b0;
				if(key_pressed && Key_Id == prev) begin
					next = DebounceLow;
				end else begin
					next = Input;
				end
			end
			
			DebounceLow: begin
				key_saved = 1'b0;
				if(key_pressed && Key_Id == prev) begin
					next = DebounceHigh;
				end else begin
					next = Input;
				end
			end
			
			DebounceHigh: begin
				if(key_pressed && Key_Id == prev) begin
					key_saved = 1'b1;
				end
				next = Input;
			end
		endcase
	end
end
endmodule