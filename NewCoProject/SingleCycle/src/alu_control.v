module alu_control(alu_op,alu_function,ctrl,op_code);
	input [1:0] alu_op;
	input [5:0]alu_function; 
	input [5:0] op_code;
	output reg [3:0] ctrl;
	always @(alu_op or alu_function or op_code)
		begin
		if(alu_op==2'b10)	 //r tybe
			case (alu_function)
				6'b100000:ctrl<=4'b0010; //add
				6'b100010:ctrl<=4'b0110;   //sub
				6'b100100:ctrl<=4'b0000;   //and
				6'b100101:ctrl<=4'b0001;   //or
				6'b101010:ctrl<=4'b0111;   //slt
				6'b000000:ctrl<=4'b0100;  //sll
				6'b000010:ctrl<=4'b1000;  //srl
			
				
				default:ctrl<=4'b1111;
			endcase
		else if(alu_op==2'b11)
			case (op_code)
				6'b001000:ctrl<=4'b0010;	//addi
				6'b001100:ctrl<=4'b0000;	//andi
				6'b001101:ctrl<=4'b0001;	 //ori
				6'b001010:ctrl<=4'b0111;	  //stli  
				default:ctrl<=4'b1111; 
			endcase
			
			else
				case(alu_op)
					2'b00:ctrl<=4'b0010;	 //lw&sw
					2'b01:ctrl<=4'b0110;	//branch
					default:ctrl<=4'b1111;
				endcase	 
			end		 
			
			endmodule
				
					
				
				
				
		