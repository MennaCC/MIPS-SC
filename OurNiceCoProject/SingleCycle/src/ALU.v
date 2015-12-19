module ALU (in1,in2,ou,ctrl,zero,shift_amount);
	
	input [31:0] in1;
	input [31:0] in2;
	input [3:0] ctrl;
	output reg [31:0] ou;
	output zero; 
	input[4:0]  shift_amount ;
	assign zero = (ou==0);
	
	always @ (ctrl or in1  or in2 )
		begin
		case(ctrl)
			4'b0000:ou <= in1&in2;
			4'b0001:ou <= in1|in2;
			4'b0010:ou <=in1 +in2;
			4'b0110:ou <=in1-in2;
			4'b0111:ou <= in1 < in2 ? 1 : 0;
			4'b1100:ou <= ~(in1	| in2);
			4'b0100:ou <= in1<<shift_amount; //sll
			4'b1000:ou<= in1>>shift_amount;	   //srl
			
			default:ou <= 0;
		endcase
		end	
		endmodule
	
	