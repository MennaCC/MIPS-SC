module ControlUnit(clk,OpCode,Funct,RegDst,RegWrite,ALUSrc,ALUOp,MemWrite,MemRead,MemToReg,Branch,Jump,Jr);
	input [5:0] OpCode ; 
	input [5:0] Funct ;  
	input clk;
	output RegDst,RegWrite,ALUSrc,ALUOp,MemWrite,MemRead,MemToReg,Branch,Jump ,Jr;
	reg  RegWrite,ALUSrc,MemWrite,MemRead,Branch,Jump, Jr;	
	reg [2:0] ALUOp ; 
	reg [1:0] RegDst;
	reg [1:0] MemToReg ;
	
	always @ (posedge clk )begin
		
		if(OpCode == 6'b000000)	begin
			case(Funct)
	           100000: begin RegDst = 2'b01 ;	 //add
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b0 ;
			 		   ALUOp = 3'b010 ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 2'b00 ; 
					   Branch = 1'b0 ;
					   Jump = 1'b0 ;
					   Jr = 1'b0 ;	end
		       100100: begin RegDst = 2'b01 ;	 //and
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b0 ;
			 		   ALUOp = 3'b000 ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 2'b00 ; 
					   Branch = 1'b0 ;
					   Jump = 1'b0 ;
					   Jr = 1'b0 ; end 
		       100111: begin RegDst = 2'b01 ;	 //nor
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b0 ;
			 		   //AlUOp = 3'b000 ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 2'b00 ; 
					   Branch = 1'b0 ; 
					   Jump = 1'b0 ;
					   Jr = 1'b0 ; end
			   001000: begin RegDst = 2'b00 ;	 //Jr
					   RegWrite = 1'b0 ;
					   ALUSrc = 1'bx ;
			 		   ALUOp = 3'bxxx ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 2'bxx ; 
					   Branch = 1'b0 ;
					   Jump = 1'b0 ;
					   Jr = 1'b1 ; end
			   101010: begin RegDst = 2'b01 ;	 //slt
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b0 ;
			 		   ALUOp = 3'b111 ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 2'b00 ; 
					   Branch = 1'b0 ;
					   Jump = 1'b0 ;
					   Jr = 1'b0 ; end
			endcase	
		  end
		else if(OpCode == 6'b001000)begin 	//addi
			           RegDst = 2'b01 ;	 
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b1 ;
			 		   ALUOp = 3'b010 ;	   //same as add ?
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 2'b00 ; 
					   Branch = 1'b0 ;
					   Jump = 1'b0 ;
					   Jr = 1'b0 ; 
		end
		else if(OpCode == 6'b001100)begin //andi 
			           RegDst = 2'b01 ;	 
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b1 ;
			 		   ALUOp = 3'b010 ; //same as and ?
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 2'b00 ; 
					   Branch = 1'b0 ;
					   Jump = 1'b0 ;
					   Jr = 1'b0 ; 	
		end	
	   else if(OpCode == 6'b100011)begin //lw
			           RegDst = 2'b00 ;	
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'b1 ;
			 		   ALUOp = 3'b010 ;	 //same as add ?
					   MemWrite = 1'b0 ;
					   MemRead = 1'b1 ;
					   MemToReg = 2'b01 ; 
					   Branch = 1'b0 ;
					   Jump = 1'b0 ;
					   Jr = 1'b0 ;
		end 
		else if(OpCode == 6'b101011)begin	 //sw
			           RegDst = 2'bxx ;	 
					   RegWrite = 1'b0 ;
					   ALUSrc = 1'b1 ;
			 		   ALUOp = 3'b010 ;	//same as add ?
					   MemWrite = 1'b1 ;
					   MemRead = 1'b0 ;
					   MemToReg = 2'bxx ; 
					   Branch = 1'b0 ; 
					   Jump = 1'b0 ;
					   Jr = 1'b0 ;
		end	
		else if(OpCode == 6'b000100)begin	 //beq
			           RegDst = 2'bxx ;	 
					   RegWrite = 1'b0 ;
					   ALUSrc = 1'b0 ;
			 		   ALUOp = 3'b110 ;		//same as sub ?
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 2'bxx ; 
					   Branch = 1'b1 ;
					   Jump = 1'b0 ;
					   Jr = 1'b0 ;
		end	
		else if(OpCode == 6'b000011)begin	 //Jr
			           RegDst = 2'bxx ;	 
					   RegWrite = 1'b1 ;
					   ALUSrc = 1'bx ;
			 		   ALUOp = 3'bxxx ;
					   MemWrite = 1'b0 ;
					   MemRead = 1'b0 ;
					   MemToReg = 2'b10 ; 
					   Branch = 1'b0 ;
					   Jump = 1'b0 ;
					   Jr = 1'b1 ;
		end    
	end
	endmodule
		
		      
					   
			
			