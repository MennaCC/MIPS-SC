module ControlUnit(clk,OpCode,Funct,RegDst,RegWrite,ALUSrc,ALUOp,MemWrite,MemRead,MemToReg,Branch,Jr);
	input [5:0] OpCode ; 
	input [5:0] Funct ;  
	input clk;
	output RegDst,RegWrite,ALUSrc,ALUOp,MemWrite,MemRead,MemToReg,Branch,Jr;
	reg  RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg , branch, Jr;	
	reg [2:0] ALUOp ;
	
	always @ (posedge clk )begin
		
		if(OpCode == 6'b000000)	begin
			case(Funct)
	           100000: begin RegDst = 1'b1 ;	 //add
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b0 ;
			 		   ALUOp = 3'b010 ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 1'b0 ; 
					   branch = 1'b0 ;
					   Jr = 1'b0 ;	end
		       100100: begin RegDst = 1'b1 ;	 //and
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b0 ;
			 		   ALUOp = 3'b000 ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 1'b0 ; 
					   branch = 1'b0 ;
					   Jr = 1'b0 ; end 
		       100111: begin RegDst = 1'b1 ;	 //nor
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b0 ;
			 		   //AlUOp = 3'b000 ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 1'b0 ; 
					   branch = 1'b0 ;
					   Jr = 1'b0 ; end
			   001000: begin RegDst = 1'b0 ;	 //Jr
					   RegWrite = 1'b0 ;
					   ALUSrc = 1'bx ;
			 		   ALUOp = 3'bxxx ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 1'bx ; 
					   branch = 1'b0 ;
					   Jr = 1'b1 ; end
			   101010: begin RegDst = 1'b1 ;	 //slt
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b0 ;
			 		   ALUOp = 3'b111 ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 1'b0 ; 
					   branch = 1'b0 ;
					   Jr = 1'b0 ; end
			endcase	
		  end
		else if(OpCode == 6'b001000)begin 	//addi
			           RegDst = 1'b1 ;	 
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b1 ;
			 		   //AlUOp = 3'b010 ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 1'b0 ; 
					   branch = 1'b0 ;
					   Jr = 1'b0 ; 
		end
		else if(OpCode == 6'b001100)begin //andi 
			           RegDst = 1'b1 ;	 
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b1 ;
			 		   //AlUOp = 3'b010 ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 1'b0 ; 
					   branch = 1'b0 ;
					   Jr = 1'b0 ; 	
		end	
	   else if(OpCode == 6'b100011)begin //lw
			           RegDst = 1'b0 ;	
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b1 ;
			 		   ALUOp = 3'b010 ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b1 ;
					   MemToReg = 1'b1 ; 
					   branch = 1'b0 ;
					   Jr = 1'b0 ;
		end 
		else if(OpCode == 6'b101011)begin	 //sw
			           RegDst = 1'bx ;	 
					   RegWrite = 1'b0 ;
					   ALUSrc = 1'b1 ;
			 		   ALUOp = 3'b010 ;
					   MemWrite = 1'b1 ;
					   MemRead = 1'b0 ;
					   MemToReg = 1'bx ; 
					   branch = 1'b0 ;
					   Jr = 1'b0 ;
		end	
		else if(OpCode == 6'b000100)begin	 //beg
			           RegDst = 1'bx ;	 
					   RegWrite = 1'b0 ;
					   ALUSrc = 1'b1 ;
			 		   ALUOp = 3'b110 ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 1'bx ; 
					   branch = 1'b1 ;
					   Jr = 1'b0 ;
		end	
		else if(OpCode == 6'b000100)begin	 //beg
			           RegDst = 1'bx ;	 
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b1 ;
			 		   //AlUOp = 3'b110 ; fe signal httzwed 34an a5od el pc aktbo f reg	& a5er mux hyb2a 3*1
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 1'b0 ; 
					   branch = 1'b0 ;
					   Jr = 1'b1 ;
		end    
	end
	endmodule
		
		      
					   
			
			