module NotModule(bigMuxIn8, inA);

    output [7:0] bigMuxIn8;

    input [7:0] inA; 

    not(bigMuxIn8[0], inA[0]);
    not(bigMuxIn8[1], inA[1]);
    not(bigMuxIn8[2], inA[2]);
    not(bigMuxIn8[3], inA[3]);
    not(bigMuxIn8[4], inA[4]);
    not(bigMuxIn8[5], inA[5]);
    not(bigMuxIn8[6], inA[6]);
    not(bigMuxIn8[7], inA[7]);

endmodule // NotModule

module testbench();

    // This wire is used for holding the result

    wire [7:0] bigMuxIn;

    // The 2 input registers

    reg [7:0] in1;

    // Instantiating the module 

    NotModule notModuleResult(bigMuxIn, in1);

    // *** Something else should be done with bigMuxIn ***
    // *** bigMuxIn should go into gate number 8 in the multiplexer ***

endmodule // testbench