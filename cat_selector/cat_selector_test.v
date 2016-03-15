module cat_selector_test();
	reg is_black, is_red, is_sterilized, is_male;
	
	wire is_my_cat;
	
	cat_selector sel( .IsBlack(is_black), .IsRed(is_red), .IsSterilized(is_sterilized), .IsMale(is_male), .IsMyCat(is_my_cat) );
	
	initial begin
		is_sterilized = 0;
		is_black = 0;
		is_red = 1;
		is_male = 1;
		#1;
		assert(is_my_cat == 0);
		
		is_sterilized = 1;
		is_black = 0;
		is_red = 0;
		is_male = 0;
		#1;
		assert(is_my_cat == 0);
		
		is_sterilized = 1;
		is_black = 1;
		is_red = 1;
		is_male = 0;
		#1;
		assert(is_my_cat == 1);
	end
	
endmodule