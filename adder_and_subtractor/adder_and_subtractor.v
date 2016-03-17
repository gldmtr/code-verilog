module adder_and_subtractor (
	A,
	B,
	CI,
	SUB,
	S,
	CO
);
	parameter DATA_WIDTH = 8;
	
	input [DATA_WIDTH-1:0] A;
	input [DATA_WIDTH-1:0] B;
	input CI;
	input SUB;
	
	output [DATA_WIDTH-1:0] S;
	output CO;
	
	wire [DATA_WIDTH-1:0] inv;
	wire sub_co;

	ones_complementor #(
		.DATA_WIDTH(DATA_WIDTH)
	) sub(
		.num(B),
		.sub(SUB),
		.out(inv)
	);

	adder #(
		.DATA_WIDTH(DATA_WIDTH)
	) add(
		.A(A),
		.B(inv),
		.CI(CI ^ SUB),
		.S(S),
		.CO(sub_co)
	);

	assign CO = sub_co ^ SUB;
endmodule
