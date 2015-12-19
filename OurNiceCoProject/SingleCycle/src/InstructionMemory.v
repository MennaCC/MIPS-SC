module InstructionsMemory (output instruction,input inAddress); 
	
	wire[0:31] instruction; 
	//1 G of (4 bytes instructions) = 4 GBytes
	reg [0:31] instrMem [0:1073741823]; 	
	
	assign instruction = instrMem[inAddress];
	
	initial $readmemb("C:/Users/Hamdy/Source/Repos/MIPS-SC/OurNiceCoProject/instructionMemoryFile.list",instrMem);
	
endmodule