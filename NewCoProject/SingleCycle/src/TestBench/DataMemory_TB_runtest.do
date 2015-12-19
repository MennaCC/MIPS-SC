SetActiveLib -work
#Compiling UUT module design files

comp -include "$dsn\src\TestBench\DataMemory_TB.v"
asim +access +r DataMemory_tb

wave
wave -noreg inoutData
wave -noreg inoutData_bidir
wave -noreg inAddress
wave -noreg MemWrite
wave -noreg MemRead

run

#End simulation macro
