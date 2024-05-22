module ElevatorController(
input clk,rst,
close_req,open_req,
up_req,down_req,stop,
output reg open,moving,up,down,error);

//Parameters
parameter idle_closed = 3'b000;
parameter idle_open = 3'b001;
parameter move_up = 3'b010;
parameter move_down = 3'b011;
parameter invalid = 3'b100;

reg [2:0] current,next = idle_closed;

always @(posedge clk or posedge rst) begin

	if(rst) begin
		open = 1'b0;
		moving = 1'b0;
		up = 1'b0;
		down = 1'b0;
		error = 1'b0;
		next = idle_closed;
	end else begin
		current = next;
		case(current)
			idle_closed: begin
				open = 1'b0;
				moving = 1'b0;
				up = 1'b0;
				down = 1'b0;
				error = 1'b0;
				if(~close_req && open_req && ~up_req && ~down_req && ~stop)
					next = idle_open;
				else if(~close_req && ~open_req && up_req && ~down_req && ~stop)
					next = move_up;
				else if(~close_req && ~open_req && ~up_req && down_req && ~stop)
					next = move_down;
				else if(close_req && ~open_req && ~up_req && ~down_req && ~stop)
					next = idle_closed;
				else
					next = invalid;
			end
			
			idle_open: begin
			
				open = 1'b1;
				moving = 1'b0;
				up = 1'b0;
				down = 1'b0;
				error = 1'b0;
				
				if (close_req && ~open_req && ~up_req && ~down_req && ~stop) 
					next = idle_closed;
				else if(~close_req && open_req && ~up_req && ~down_req && ~stop)
					next = idle_open;
				else
					next = invalid;
			end
				
			move_up: begin
			
				open = 1'b0;
				moving =1'b1;
				up = 1'b1;
				down = 1'b0;
				error = 1'b0;
				
				if(~close_req && ~open_req && ~up_req && ~down_req && stop)
					next = idle_closed;
				else if(~close_req && ~open_req && up_req && ~down_req && ~stop)
					next = move_up;
				else if(~close_req && ~open_req && ~up_req && down_req && ~stop) 
					next = move_down;
				else
					next = invalid;
			end
			
			move_down: begin
			
				open = 1'b0;
				moving = 1'b1;
				up = 1'b0;
				down = 1'b1;
				error = 1'b0;
				
				if(~close_req && ~open_req && ~up_req && ~down_req && stop)
					next = idle_closed;
				else if(~close_req && ~open_req && ~up_req && down_req && ~stop)
					next = move_down;
				else if(~close_req && ~open_req && up_req && ~down_req && ~stop)
					next = move_up;
				else
					next = invalid;
			end
			
			invalid: begin
				
				open = 1'bx;
				moving = 1'bx;
				up = 1'bx;
				down = 1'bx;
				error = 1'b1;
				
				next = idle_closed;
			end
		endcase
	end
end
endmodule