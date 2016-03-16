module adder(
	A,
	B,
	CI,
	S,
	CO
);
	parameter DATA_WIDTH = 8;
	
	input [DATA_WIDTH-1:0] A;
	input [DATA_WIDTH-1:0] B;
	input CI;
	
	output [DATA_WIDTH-1:0] S;
	output CO;
	
	wire [DATA_WIDTH-1:0] conns;

	one_bit_adder add_0(
		.A(A[0]),
		.B(B[0]),
		.CI(CI),
		.S(S[0]),
		.CO(conns[0])
	);
	
	genvar i;
	generate
		for (i = 1; i < DATA_WIDTH; i = i + 1) begin : gen_adds
			one_bit_adder add_i(
				.A(A[i]),
				.B(B[i]),
				.CI(conns[i - 1]),
				.S(S[i]),
				.CO(conns[i])
			);
		end
	endgenerate
	
	assign CO = conns[DATA_WIDTH - 1];
endmodule
