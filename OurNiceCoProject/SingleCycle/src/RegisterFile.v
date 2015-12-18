module RegisterFile (rdData1,rdData2,
	                 rdReg1,rdReg2,wtReg,wtData,regWrite);
	
	input  rdReg1, rdReg2, wtReg,wtData,regWrite;
	output rdData1,rdData2;	
	
	reg [0:31] registers [0:31];
	
	assign rdData1 = registers[rdReg1];
	assign rdData2 = registers[rdReg2];
	
	always @(regWrite)
	begin
		if(regWrite)
			registers[wtReg] = wtData;
	end	
	
	
endmodule	   