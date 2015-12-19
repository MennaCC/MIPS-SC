module full_adder(inx,iny,sumw,carry_in,carry_out);
	input[31:0] inx;
	input[31:0] iny;
	input carry_in;
	output carry_out;  
	output [31:0] sumw;
	reg [31:0] sum;
	wire [31:0]w1;
	wire w2;
	wire w3;
	xor (w1,inx,iny);
	xor(sumw,w1,carry_in) ;
	and(w2,w1,carry_in)	; 
	and(w3,inx,iny);
	or(carry_out,w2,w3	);
	endmodule 