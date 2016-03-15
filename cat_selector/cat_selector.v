module cat_selector(
	input wire IsBlack,
	input wire IsRed,
	input wire IsSterilized,
	input wire IsMale,
	output wire IsMyCat
);
	wire black, white, red, other;
	wire first_option, second_option, third_option;
	
	assign black = IsBlack && !IsRed;
	assign white = !IsBlack && !IsRed;
	assign red = !IsBlack && IsRed;
	assign other = IsBlack && IsRed;
	
	assign first_option = IsMale && IsSterilized && (white || red);
	assign second_option = !IsMale && IsSterilized && !white;
	assign third_option = black;
	
	assign IsMyCat = first_option || second_option || third_option;
endmodule