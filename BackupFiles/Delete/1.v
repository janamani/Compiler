

	always @ (posedge Reset or posedge ClockT) begin
		if (Reset == 1'b1) begin
			SAROutI <= ~{DATA{1'b0}};
			SAROutD <= ~{DATA{1'b0}}; end
		else begin
			case (StateP) 
				2'b00: begin
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
							SAROutI <= SAROutI;
							SAROutD <= SAROutD; end
			endcase
		end
	end
