module shift_right(a,b,shift_amount) ;
	input[31:0]a;
	input shift_amount;
	output reg [31:0] b;  
	always@(a)
		begin
			b<=a>>shift_amount;
		end
		endmodule
	
	
	