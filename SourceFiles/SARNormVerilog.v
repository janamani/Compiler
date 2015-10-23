module SARNormVerilog(Clock, Reset, Compare, Ready, ClockTck, ClockCmp, ResetP, ResetN, SAROutG, SAROut, DataOut);

	parameter DATA = 8;

	input Clock, Reset, Compare;
	
	output reg Ready, ClockTck, ClockCmp;
	output reg ResetP, ResetN, SAROutG;
	output reg [DATA-1:0] SAROut, DataOut;

	reg [1:0] StateP, StateN;
	reg [DATA-1:0] SAR, TempSAR;
	
	
	always @ (posedge Reset or posedge Clock) begin
		if(Reset == 1'b1) begin
			Ready <= 1'b0;
			DataOut <= {DATA{1'b0}}; end
		else begin
			if (StateP == 2'b11) begin
				Ready <= 1'b1;
				DataOut <= TempSAR; end
			else begin
				Ready <= 1'b0;
				DataOut <= DataOut; end
		end
	end

	always @ (Reset) begin
		if (Reset == 1'b1) begin
			ResetP <= 1'b1; 
			ResetN <= 1'b0; 
			SAROutG <= 1'b0;	end
		else begin
		 	ResetP <= 1'b0; 
			ResetN <= 1'b1; 
			SAROutG <= 1'b1;	end
	end

	always @ (Reset or SAR or TempSAR) begin
		if (Reset == 1'b1) begin
			SAROut <= {DATA{1'b1}}; end
		else begin
			SAROut <=  ~(TempSAR | SAR); end
	end

	always @ (posedge Reset or posedge Clock) begin
		if (Reset == 1'b1) begin
			StateP <= 2'b00; end
		else begin
			StateP <= StateN; end
	end
	
	always @ (Reset or Clock or StateP) begin
		if (Reset == 1'b1) begin
			ClockTck <= 1'b0; end
		else begin
			if (StateP == 2'b00) begin
				ClockTck <= ~Clock; end
			else begin
				ClockTck <= 1'b0; end
		end
	end

	always @ (Reset or Clock or StateP) begin
		if (Reset == 1'b1) begin
			ClockCmp <= 1'b0; end
		else begin
			if (StateP != 2'b00) begin
				ClockCmp <= ~Clock; end
			else begin
				ClockCmp <= 1'b0; end
		end
	end

	always @ (Reset or StateP or SAR) begin
 		if(Reset == 1'b1) begin
			StateN <= 2'b00; end
		else begin
	 		case (StateP)		 
				2'b00: begin
							StateN <= 2'b01;
						end
				2'b01: begin
							if (SAR == {{DATA-1{1'b0}}, 1'b1}) begin
								StateN <= 2'b11; end
							else begin
								StateN <= 1'b01; end	
						end
				default: begin
							StateN <= 2'b00; 
						end
			endcase
		end
	end

	always @ (posedge Reset or posedge Clock) begin
		if (Reset == 1'b1) begin
			SAR <= {DATA{1'b0}};
			TempSAR <= {DATA{1'b0}}; end
		else begin
			case (StateP)
				2'b00: begin
							SAR <= {1'b1, {DATA-1{1'b0}}};
							TempSAR <= {DATA{1'b0}}; end
				2'b01: begin
							SAR <= SAR >> 1;
							if(Compare == 1'b1) begin
								TempSAR <= TempSAR | SAR; end
							else begin
								TempSAR <= TempSAR; end
						  end
				default: begin
							SAR <= {{DATA-1{1'b0}}};
							if(Compare == 1'b1) begin
								TempSAR <= TempSAR | SAR; end
							else begin
								TempSAR <= TempSAR; end
						   end
			endcase
		end
	end
endmodule
