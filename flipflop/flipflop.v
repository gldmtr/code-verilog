module flipflop (
	input SET,
	input RESET,
	output wire Q
);
	wire interconn, feedback;
	
	assign interconn = ~(SET | Q);
	assign Q = ~(RESET | interconn);
endmodule
