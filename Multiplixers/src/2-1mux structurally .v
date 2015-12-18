module mux_2x1_structural(C,A,B,S); 
	output C;
	input A,B,S;
	not (L0,S);
    and (L2,S,B);
    and (L1,L0,A);
    or (C,L2,L1);

endmodule	


  
    