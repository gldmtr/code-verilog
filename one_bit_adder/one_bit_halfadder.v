module one_bit_halfadder(
	input wire A,
	input wire B,
	output wire S,
	output wire CO
);
	assign S = A ^ B;
	assign CO = A & B;
endmodule
