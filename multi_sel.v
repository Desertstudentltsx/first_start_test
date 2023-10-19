`timescale 1ns/1ns
module multi_sel(
input [7:0]d ,
input clk,
input rst,
output reg input_grant,
output reg [10:0]out
);

reg [1:0]cnt;
reg [7:0]din;

always@(posedge clk or negedge rst) begin
	if(!rst) begin
		cnt <= 0;
		out <= 0;
		input_grant <= 0;
		din <= 0;
	end
	else begin
		cnt <= cnt+1;
		case (cnt)
			0: begin
				din <= d;
				input_grant <= 1;
				out <= d;
			end
			1: begin
				input_grant <= 0;
				out <= din<<2 ;
			end		
			2: begin
				input_grant <= 0;
				out <= (din<<3)-din;
			end
			3: begin
				input_grant <= 0;
				out <= (din<<3);
			end	
		endcase
	end

end
endmodule