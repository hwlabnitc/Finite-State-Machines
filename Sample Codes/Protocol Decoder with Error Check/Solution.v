module ProtocolDecoder(
input clk,rst,serial_in,
output reg [7:0] parallel_out,
output reg valid,
output reg error
);

parameter Wait = 3'b00;
parameter Start = 3'b001;
parameter Receive = 3'b010;
parameter Verify = 3'b011;
parameter Valid = 3'b100;
parameter Error = 3'b101;

reg [2:0] current, next = Wait;
reg [7:0] data;
reg [3:0] count;
reg checksum;

always @(posedge clk or posedge rst) begin
	if(rst) begin
		next = Wait;
		data = 8'b0;
		error = 1'b0;
		parallel_out = 8'bx;
		count = 3'b000;
		checksum = 1'b1;
		valid = 1'b0;
	end else begin
		current = next;
		case(current)
			Wait: begin
				error = 1'b0;
				parallel_out = 8'bx;
				valid = 1'b0;
				data = 8'b0;
				if(~serial_in) begin
					next = Start;
				end else begin
					next = Wait;
				end
			end
			
			Start: begin
				if(serial_in) begin
					next = Receive;
					count = 3'b0;
					checksum = 1'b1;
				end else begin
					next = Wait;
				end
			end
			
			Receive: begin
				data = {data[6:0],serial_in};
				count = count + 1'b1;
				checksum = checksum ^ serial_in;
				if(count == 8) begin
					next = Verify;
				end else begin
					next = Receive;
				end
			end
			
			Verify: begin
				if(serial_in == checksum) begin
					next = Valid;
				end else begin
					next = Error;
				end
			end
			
			Valid: begin
				parallel_out = data;
				valid = 1'b1;
				next = Wait;
			end
			
			Error: begin
				valid = 1'b0;
				error = 1'b1;
				next = Wait;
			end
		endcase
	end
end
endmodule