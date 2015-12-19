//-----------------------------------------------------------------------------
//
// Title       : DataMemory_tb
// Design      : SingleCycle
// Author      : Hamdy
// Company     : ASU
//
//-----------------------------------------------------------------------------
//
// File        : DataMemory_TB.v
// Generated   : Fri Dec 18 00:37:25 2015
// From        : C:\Users\Hamdy\Source\Repos\MIPS-SC\OurNiceCoProject\SingleCycle\src\TestBench\DataMemory_TB_settings.txt
// By          : tb_verilog.pl ver. ver 1.2s
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps
module DataMemory_tb;


//Internal signals declarations:
tri [0:7]inoutData_bidir;
reg [0:7]inoutData;
//Continous assignment for inout port "inoutData".
assign inoutData_bidir = inoutData;

reg [0:11]inAddress;
reg MemWrite;
reg MemRead;



// Unit Under Test port map
	DataMemory UUT (
		.inoutData(inoutData_bidir),
		.inAddress(inAddress),
		.MemWrite(MemWrite),
		.MemRead(MemRead));

initial
	$monitor($realtime,,"ps %h %h %h %h ",inoutData_bidir,inAddress,MemWrite,MemRead);

endmodule
