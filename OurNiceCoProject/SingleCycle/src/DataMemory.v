module DataMemory (inoutData,inAddress,MemWrite,MemRead); 
	
	//nets 
	//Address for 2000 bytes is stored in 11 bits
	input [0:11] inAddress; 
	input MemWrite, MemRead;
	inout [0:7] inoutData;		
	//storage elemnts -> 8 bits each, and 2000 Bytes of them
	reg [0:7] dataMem [0:1999]; 
	
	
	//continuous assignment
	assign inoutData = dataMem[inAddress];

	//reads the binary contents of the file into the memory
	initial $readmemb("C:/Users/Hamdy/Source/Repos/MIPS-SC/OurNiceCoProject/dataMemoryFile.list",dataMem);
	
	//procedural assignment	
	
	always @(MemWrite) if(!MemRead) dataMem[inAddress]<= inoutData;		
		
endmodule