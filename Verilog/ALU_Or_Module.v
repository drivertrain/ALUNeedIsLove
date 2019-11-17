module OrModule(bigMuxIn4, inA, inB);

    output [7:0] bigMuxIn4;

    input [7:0] inA; 
    input [7:0] inB;

    or(bigMuxIn4[0], inA[0], inB[0]);
    or(bigMuxIn4[1], inA[1], inB[1]);
    or(bigMuxIn4[2], inA[2], inB[2]);
    or(bigMuxIn4[3], inA[3], inB[3]);
    or(bigMuxIn4[4], inA[4], inB[4]);
    or(bigMuxIn4[5], inA[5], inB[5]);
    or(bigMuxIn4[6], inA[6], inB[6]);
    or(bigMuxIn4[7], inA[7], inB[7]);
    or(bigMuxIn4[8], inA[8], inB[8]);
    or(bigMuxIn4[9], inA[9], inB[9]);
    or(bigMuxIn4[10], inA[10], inB[10]);
    or(bigMuxIn4[11], inA[11], inB[11]);
    or(bigMuxIn4[12], inA[12], inB[12]);
    or(bigMuxIn4[13], inA[13], inB[13]);
    or(bigMuxIn4[14], inA[14], inB[14]);
    or(bigMuxIn4[15], inA[15], inB[15]);

endmodule // OrModule

module testbench();

    // This wire is used for holding the result

    wire [7:0] bigMuxIn;

    // The 2 input registers

    reg [7:0] in1;
    reg [7:0] in2;

    // Instantiating the module 

    OrModule orModuleResult(bigMuxIn, in1, in2);

    // *** Something else should be done with bigMuxIn ***
    // *** bigMuxIn should go into gate number 4 in the multiplexer ***

endmodule // testbench