module DataMemory (outData,inAddress,inData,MemWrite,MemRead); 
	
	
	input [0:7] inAddress, inData; 
	//Control Signals
	input MemWrite, MemRead;
	output [0:7] outData;
	
	reg [0:7] dataMem [0:255];
	
	if (MemRead)
		assign outData = dataMem[inAddress];
	else if (MemWrite) 
		assign dataMem[inAddress]= inData;	
	

endmodule