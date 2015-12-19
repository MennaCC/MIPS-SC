#############################################################
# vsimsa environment configuration
set dsn $curdir
log $dsn/log/vsimsa.log
@echo
@echo #################### Starting C Code Debug Session ######################
cd $dsn/src
amap SingleCycle $dsn/SingleCycle.lib
set worklib SingleCycle
# simulation
asim -callbacks DataMemory_tb 
run 
#############################################################