module one_bit_halfadder_test();
	reg a, b;
	wire s, co;

	one_bit_halfadder ha(
		.A(a),
		.B(b),
		.S(s),
		.CO(co)
	);

	initial begin
		a = 0;
		b = 0;
		#10;
		assert(s == 0);
		assert(co == 0);

		a = 0;
		b = 1;
		#10;
		assert(s == 1);
		assert(co == 0);

		a = 1;
		b = 0;
		#10;
		assert(s == 1);
		assert(co == 0);

		a = 1;
		b = 1;
		#10;
		assert(s == 0);
		assert(co == 1);
	end
endmodule // one_bit_halfadder_test
