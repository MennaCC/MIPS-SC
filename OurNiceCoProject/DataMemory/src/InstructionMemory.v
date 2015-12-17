module InstructionsMemory (instruction,inAddress); 
	
	//nets
	input [0:7] inAddress; 
	//
	reg [0:31] instrMem [0:1073741823]; 
	
	
	//continuous assignment
	if (MemRead)
		assign inoutData = dataMem[inAddress];
	
	//procedural assignment
	always @(MemWrite)
	begin		
		if (!MemRead) 
			dataMem[inAddress]<= inoutData;		
	end	
endmodule