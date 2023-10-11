module top (
	output clk
);
	reg u_clk;
	assign clk = u_clk;

	initial begin
		forever begin
			u_clk = ~u_clk;
			#1;
		end
	end
endmodule //top
