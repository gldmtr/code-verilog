module ones_complementor_test ();
	localparam DATA_WIDTH = 8;
	
	reg [DATA_WIDTH-1:0] num;
	reg sub;
	
	wire [DATA_WIDTH - 1:0] res;
	
	ones_complementor #(
		.DATA_WIDTH(DATA_WIDTH)
	) comp(
		.num(num),
		.sub(sub),
		.out(res)
	);

	initial begin
	
	sub = 0;
	
	num = 8'b00110011;
	#10;
	assert(res == 8'b00110011);
	
	num = 8'b11001100;
	#10;
	assert(res == 8'b11001100);
	
	sub = 1;
	
	num = 8'b00110011;
	#10;
	assert(res == 8'b11001100);
	
	num = 8'b11001100;
	#10;
	assert(res == 8'b00110011);
	
	end

endmodule
