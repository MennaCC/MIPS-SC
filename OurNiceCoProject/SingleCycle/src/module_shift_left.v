module shift_left(a,b,shift_amount);
	input[31:0]a;
	output reg[31:0]b;
	input shift_amount;
	always@(a)	
		begin
		b<=a<<shift_amount;
		end
	endmodule
	