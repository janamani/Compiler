module SARTimerVerilog(Reset, ClockT, StateP, Inc, Dcr, Ready, Timer, FlagConv);

	parameter TIMER = 8;

	input [1:0] StateP;
	input ClockT, Reset, Inc, Dcr;

	output Ready, FlagConv;
	output reg [TIMER-1:0] TimerOut;


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
