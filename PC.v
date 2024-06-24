module PC(clock, pc_in, pc_out, en);
	
	input clock, en;
	input [11:0] pc_in;
	output reg [11:0] pc_out;

	initial begin
		pc_out = 0;
	end


	always @(pc_in) begin
		
		if(en == 1) begin
			pc_out = pc_in;
		end
	end

endmodule	
	
