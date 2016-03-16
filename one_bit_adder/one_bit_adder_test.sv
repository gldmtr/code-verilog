module one_bit_adder_test();
	reg a, b, ci;
	wire s, co;

	one_bit_adder add(
		.A(a),
		.B(b),
		.CI(ci),
		.S(s),
		.CO(co)
	);

	initial begin
		ci = 0;
		
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

		ci = 1;

		a = 0;
		b = 0;
		#10;
		assert(s == 1);
		assert(co == 0);

		a = 0;
		b = 1;
		#10;
		assert(s == 0);
		assert(co == 1);

		a = 1;
		b = 0;
		#10;
		assert(s == 0);
		assert(co == 1);

		a = 1;
		b = 1;
		#10;
		assert(s == 1);
		assert(co == 1);
	end
endmodule // one_bit_halfadder_test
