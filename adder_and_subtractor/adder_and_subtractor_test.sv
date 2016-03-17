module adder_and_subtractor_test ();
	
	localparam DATA_WIDTH = 8;
	
	reg [DATA_WIDTH-1:0] a, b;
	reg ci, sub;
	
	wire [DATA_WIDTH-1:0] s;
	wire co;
	
	adder_and_subtractor #(
		.DATA_WIDTH(DATA_WIDTH)
	) add(
		.A(a),
		.B(b),
		.CI(ci),
		.SUB(sub),
		.S(s),
		.CO(co)
	);
	
	initial begin
		sub = 0;
		// adder test
		a[DATA_WIDTH-1:0] = 100;
		b[DATA_WIDTH-1:0] = 16;
		ci = 0;
		#10;
		assert(s[DATA_WIDTH-1:0] == 100 + 16);
		assert(co == 0);		
		
		ci = 1;
		#10;
		assert(s[DATA_WIDTH-1:0] == 100 + 16 + 1);
		assert(co == 0);		
		
		ci = 0;
		a[DATA_WIDTH-1:0] = 200;
		b[DATA_WIDTH-1:0] = 200;
		#10;
		assert(s[DATA_WIDTH-1:0] == 400 - 256);
		assert(co == 1);		

		sub = 1;
		// subractor test
		a[DATA_WIDTH-1:0] = 100;
		b[DATA_WIDTH-1:0] = 16;
		ci = 0;
		#10;
		assert(s[DATA_WIDTH-1:0] == 100 - 16);
		assert(co == 0);		
		
		ci = 1;
		#10;
		assert(s[DATA_WIDTH-1:0] == 100 - 16 - 1);
		assert(co == 0);		
		
		ci = 0;
		a[DATA_WIDTH-1:0] = 200;
		b[DATA_WIDTH-1:0] = 200;
		#10;
		assert(s[DATA_WIDTH-1:0] == 0);
		assert(co == 0);
		
		ci = 0;
		a[DATA_WIDTH-1:0] = 8;
		b[DATA_WIDTH-1:0] = 12;
		#10;
		assert(s[DATA_WIDTH-1:0] == 8 - 12);
		assert(co == 1);		
	end

endmodule
