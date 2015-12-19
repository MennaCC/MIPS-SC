module shift_left(a,b);
	input[31:0] a;
	output reg[31:0] b;
	parameter shift =2;
	always@(a)
		begin
			b <= a << shift;
		end
		endmodule