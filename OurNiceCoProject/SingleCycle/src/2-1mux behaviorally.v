module mux_2x1_behavioral	(I0,I1,S,y);
	input I0,I1;
	output y;
	input S;
	wire y;
	assign y= (S) ? I1:I0;
	endmodule