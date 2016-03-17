module flipflop_test();
	reg set, reset;
	wire q;
	
	flipflop trig(
		.SET(set),
		.RESET(reset),
		.Q(q)
	);
	
	initial begin
		set = 0;
		reset = 0;
		#1;
	
		reset = 0;
		set = 1; #1; set = 0;
		#10;
		assert(q == 1);
		
		set = 0;
		reset = 1; #1; reset = 0;
		#10;
		assert(q == 0);
	end

endmodule
