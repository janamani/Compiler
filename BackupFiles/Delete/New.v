module SARTimerVerilog(Reset, ClockT, StateP, SAROut, SAROutI);

	parameter DATA = 8;

	input Reset, ClockT;
	input [1:0] StateP;
	input [DATA-1:0] SAROut;

	output reg [DATA-1:0] SAROutI;

	always @ (posedge Reset or posedge ClockT) begin
		if (Reset == 1'b1) begin
			SAROutI <= ~{DATA{1'b0}}; end
		else begin
			case (StateP) 
				2'b00: begin
							if (SAROut ==  {DATA{1'b1}}) begin
								SAROutI <= {DATA{1'b0}}; end
							else begin
								SAROutI <= ~(SAROut); end
						end
				2'b11: begin
							if (SAROut ==  {DATA{1'b1}}) begin
								SAROutI <= {DATA{1'b0}}; end
							else begin
								SAROutI <= ~(SAROut); end
						end
				default: begin
							SAROutI <= SAROutI; end
			endcase
		end
	end
endmodule
