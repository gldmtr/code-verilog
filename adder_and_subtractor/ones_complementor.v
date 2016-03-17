module ones_complementor (
	num,
	sub,
	out
);
	parameter DATA_WIDTH = 8;

	input [DATA_WIDTH - 1:0] num;
	input sub;

	output [DATA_WIDTH - 1:0] out;

	assign out = num ^ {DATA_WIDTH {sub}};
endmodule
