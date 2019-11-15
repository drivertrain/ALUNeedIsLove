// You only use a wire when you do not know 
// its data type as either an input or output

// always is used mostly in behaviorial Verilog, not structural.

module AndModule(bigMuxIn3, inA, inB);

    output [7:0] bigMuxIn3;
    input [7:0] inA;
    input [7:0] inB;

    and(bigMuxIn3[0], inA[0], inB[0]);
    and(bigMuxIn3[1], inA[1], inB[1]);
    and(bigMuxIn3[2], inA[2], inB[2]);
    and(bigMuxIn3[3], inA[3], inB[3]);
    and(bigMuxIn3[4], inA[4], inB[4]);
    and(bigMuxIn3[5], inA[5], inB[5]);
    and(bigMuxIn3[6], inA[6], inB[6]);
    and(bigMuxIn3[7], inA[7], inB[7]);

endmodule // AndModule



module testbench();

    // This wire is used for holding the result

    wire [7:0] bigMuxIn;

    // The 2 input registers

    reg [7:0] in1;
    reg [7:0] in2;

    // Instantiating the module 

    AndModule andModuleResult(bigMuxIn, in1, in2);

    // *** Something else should be done with bigMuxIn ***
    // *** bigMuxIn should go into gate number 3 in the multiplexer ***

endmodule // testbench