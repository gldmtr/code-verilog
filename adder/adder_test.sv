module adder_test();
	localparam DATA_WIDTH = 8;
	
	reg [DATA_WIDTH-1:0] a, b;
	reg ci;
	
	wire [DATA_WIDTH-1:0] s;
	wire co;
	
	adder #(
		.DATA_WIDTH(DATA_WIDTH)
	) add(
		.A(a),
		.B(b),
		.CI(ci),
		.S(s),
		.CO(co)
	);
	
	initial begin
		a[DATA_WIDTH-1:0] = 135;
		b[DATA_WIDTH-1:0] = 16;
		ci = 0;
		#10;
		assert(s[DATA_WIDTH-1:0] == 135 + 16);
		assert(co == 0);		
		
		ci = 1;
		#10;
		assert(s[DATA_WIDTH-1:0] == 135 + 16 + 1);
		assert(co == 0);		
		
		ci = 0;
		a[DATA_WIDTH-1:0] = 200;
		b[DATA_WIDTH-1:0] = 200;
		#10;
		assert(s[DATA_WIDTH-1:0] == 400 - 256);
		assert(co == 1);		
	end
endmodule
