module SARTimerVerilog(StateP, SAROut, ClockT, Reset, Inc, Dcr, Ready, ResetP, ResetN, SAROutIS, SAROutDS, 
				SAROutIG, SAROutDG, SAROutCG, ClockDcr, ClockInc, ClockTck, DataOut, TimerOut, SAROutI, SAROutD, SAROutC);

	parameter DATA = 8;
	parameter TIMER = 8;

	input [1:0] StateP;
	input [DATA-1:0] SAROut;
	input ClockT, Reset, Inc, Dcr;

	output reg Ready;
	output reg ResetP, ResetN;
	output reg SAROutIS, SAROutDS;
	output reg SAROutIG, SAROutDG, SAROutCG;
	output reg ClockDcr, ClockInc, ClockTck;

	output reg [DATA-1:0] DataOut;
	output reg [TIMER-1:0] TimerOut;
	output reg [DATA-1:0] SAROutI, SAROutD, SAROutC;

	reg FlagTMR, FlagConv; 
	reg [TIMER-1:0] TempTMR;
	reg [1:0] StateX, StateY;


	always @ (posedge Reset or posedge ClockT) begin
		if (Reset == 1'b1) begin
			SAROutC <= ~{DATA{1'b0}};
			SAROutI <= ~{DATA{1'b0}};
			SAROutD <= ~{DATA{1'b0}}; end
		else begin
			case (StateP) 
				2'b00: begin
							SAROutC <= ~(SAROut);
							if (SAROut ==  {DATA{1'b1}}) begin
								SAROutI <= ~(SAROut - {{DATA-1{1'b0}},1'b1}); end
							else begin
								SAROutI <= ~(SAROut); end

							if (SAROut ==  {DATA{1'b0}}) begin
								SAROutD <= ~{DATA{1'b0}}; end
							else begin
								SAROutD <= ~(SAROut - {{DATA-1{1'b0}},1'b1}); end
						 end	
				2'b11: begin
							SAROutC <= ~(SAROut);
							if (SAROut ==  {DATA{1'b1}}) begin
								SAROutI <= ~(SAROut - {{DATA-1{1'b0}},1'b1}); end
							else begin
								SAROutI <= ~(SAROut); end

							if (SAROut ==  {DATA{1'b0}}) begin
								SAROutD <= ~{DATA{1'b0}}; end
							else begin
								SAROutD <= ~(SAROut - {{DATA-1{1'b0}},1'b1}); end
							end
				default: begin
							SAROutC <= ~(SAROut);
							SAROutI <= SAROutI;
							SAROutD <= SAROutD; end
			endcase
		end
	end

	always @ (Reset or FlagConv or ClockT or StateP) begin
		if (Reset == 1'b1) begin
			ClockTck <= 1'b0; 
			ClockDcr <= 1'b0; 
			ClockInc <= 1'b0; end
		else begin
			if (StateP == 2'b00 && FlagConv != 1'b1) begin
				ClockTck <= ~ClockT; 
				ClockDcr <= ~ClockT; 
				ClockInc <= ~ClockT; end
			else begin
				if (StateP == 2'b11) begin
					ClockTck <= ~ClockT; 
					ClockDcr <= ~ClockT; 
					ClockInc <= ~ClockT; end
				else begin
					ClockTck <= 1'b0;  
					ClockDcr <= 1'b0; 
					ClockInc <= 1'b0; end
			end
		end
	end
			
	always @ (Reset or StateP or Inc or Dcr) begin
 		if(Reset == 1'b1) begin
			FlagConv <= 1'b0; end
		else begin
 			case (StateP)
				2'b00: begin 
							FlagConv <= Inc | Dcr; end
				2'b11: begin 
							FlagConv <= 1'b0; end
			  default: begin 
							FlagConv <= 1'b1; end
			endcase
		end
	end	

	always @ (posedge Reset or posedge ClockT) begin
		if (Reset == 1'b1) begin
			DataOut <= {{DATA-1{1'b0}},1'b1}; end
		else begin
			if (StateP == 2'b00) begin
				DataOut <= SAROut; end
			else begin
				DataOut <= DataOut; end
		end
	end

	always @ (posedge Reset or posedge ClockT) begin
		if (Reset == 1'b1) begin
			Ready <= 1'b0;
			FlagTMR <= 1'b0;
			TempTMR <= {TIMER{1'b0}};
			TimerOut <= {TIMER{1'b0}}; end
		else begin
			if ((FlagConv == 1'b1 && FlagTMR == 1'b0) || TempTMR == {TIMER{1'b1}}) begin
				Ready <= 1'b1;
				FlagTMR <= 1'b1;
				TimerOut <= TempTMR; 
				TempTMR <= {{TIMER-1{1'b0}},1'b1}; end
			else begin
				Ready <= 1'b0;
				if (FlagConv == 1'b0) begin
					FlagTMR <= 1'b0; end
				else begin
					FlagTMR <= 1'b1; end
				TempTMR <= TempTMR + {{TIMER-1{1'b0}},1'b1}; end
		end
	end

	always @ (Reset) begin
		if (Reset == 1'b1) begin
			ResetP <= 1'b1; ResetN <= 1'b0;
			SAROutIS <= 1'b1; SAROutDS <= 1'b1; 
			SAROutIG <= 1'b0; SAROutDG <= 1'b0; SAROutCG <= 1'b0;	end
		else begin
		 	ResetP <= 1'b0; ResetN <= 1'b1;
			SAROutIS <= 1'b0; SAROutDS <= 1'b0; 
			SAROutIG <= 1'b1; SAROutDG <= 1'b1; SAROutCG <= 1'b1;	end
	end

endmodule
