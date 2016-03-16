module one_bit_adder(
	input wire A,
	input wire B,
	input wire CI,
	output wire S,
	output wire CO
);
	wire sum_wo_ci, temp_co_h, temp_co_l;
	one_bit_halfadder ab_add( .A(A), .B(B), .S(sum_wo_ci), .CO(temp_co_h));
	one_bit_halfadder ci_add( .A(CI), .B(sum_wo_ci), .S(S), .CO(temp_co_l));
	assign CO = temp_co_h | temp_co_l;
endmodule
