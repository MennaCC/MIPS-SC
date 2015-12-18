module SignExtend(clk ,In , Out );
	input [15:0] In ;
	input clk ;
	output [31:0] Out ;
	reg [31:0] Out ;
	
	always @(posedge clk)begin 	
		Out[15:0] <= In;
		Out[31:16] <= {16{In[15]}};
	end 
	endmodule