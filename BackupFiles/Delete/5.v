

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


xg201 ( saroutcg resetn ) buf2 
xg202 ( saroutdg resetn ) buf2 
xg203 ( saroutig resetn ) buf2 
xg204 ( saroutds saroutis ) buf2 
xg205 ( saroutis resetp ) buf2
xg206 ( resetp reset ) buf2
xg207 ( resetn resetp ) inv2






