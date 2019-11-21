module shiftLeft(outA, inA);
	output [15:0] outA;
	
	input [15:0] inA;
	or(outA[15],low,inA[14]);
	or(outA[14],low,inA[13]);
	or(outA[13],low,inA[12]);
	or(outA[12],low,inA[11]);
	or(outA[11],low,inA[10]);
	or(outA[10],low,inA[9]);
	or(outA[9],low,inA[8]);
	or(outA[8],low,inA[7]);
	or(outA[7],low,inA[6]);
	or(outA[6],low,inA[5]);
	or(outA[5],low,inA[4]);
	or(outA[4],low,inA[3]);
	or(outA[3],low,inA[2]);
	or(outA[2],low,inA[1]);
	or(outA[1],low,inA[0]);
	or(outA[0],low,low);
	
endmodule

module shiftRight(outA, inA);
	output [15:0] outA;
	input [15:0] inA;
	
	or(outA[0],low,inA[1]);
	or(outA[1],low,inA[2]);
	or(outA[2],low,inA[3]);
	or(outA[3],low,inA[4]);
	or(outA[4],low,inA[5]);
	or(outA[5],low,inA[6]);
	or(outA[6],low,inA[7]);
	or(outA[7],low,inA[8]);
	or(outA[9],low,inA[10]);
	or(outA[10],low,inA[11]);
	or(outA[11],low,inA[12]);
	or(outA[12],low,inA[13]);
	or(outA[13],low,inA[14]);
	or(outA[14],low,inA[15]);
	or(outA[15],low,low);
endmodule
	
	