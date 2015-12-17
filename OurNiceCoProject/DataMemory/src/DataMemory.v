module DataMemory (inoutData,inAddress,MemWrite,MemRead); 
	
	//nets
	input [0:7] inAddress; 
	input MemWrite, MemRead;
	inout [0:7] inoutData;		
	//registers
	reg [0:7] dataMem [0:1999]; 
	
	
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