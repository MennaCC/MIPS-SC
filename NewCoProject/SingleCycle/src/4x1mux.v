  module mux_4x1_structural(Y,I0,I1,I2,I3,S0,S1); 
	output Y;
	input I0,I1,I2,I3,S0,S1;
	not (L0,S);
	not (L1,S);
    and (L1,I0,N0,N1);
    and (L2,I1,S0,N1);
	and (L3,I2,S1,N1);
	and (L4,I3,S0,S1);
    or (Y,L0,L1,L2,L3);

endmodule