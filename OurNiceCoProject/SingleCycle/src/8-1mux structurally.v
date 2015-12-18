	module mux_8x1_structural(f,E0,E1,E2,E3,E4,E5,E6,E7,A,B,C); 
	output f;
	input E0,E1,E2,E3,E4,E5,E6,E7,A,B,C;
	not (n0,A);	 
	not (n1,B);
	not (n2,C);
    and (L0,E0,n0,n1,n2);
    and (L1,E1,n0,n1,C);
	and (L2,E2,n0,B,n2);
	and (L3,E3,n0,B,C);
	and (L4,E4,A,n1,n2);
	and (L5,E5,A,n1,C);
	and (L6,E6,A,B,n2);
	and (L7,E7,A,B,C);
    or (f,L0,L1,L2,L3,L4,L5,L6,L7);

endmodule