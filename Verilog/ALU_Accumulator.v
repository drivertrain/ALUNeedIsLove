// Add DFF module 
// Put in full adder module 
// TODO: Basically translate what you did in the lab into Verilog

module DFlipFlop (clk, in, out, clr, pre);
    parameter n = 16; 
    
    input clk; 
    input [n-1:0] in;
    
    output [n-1:0] out;
    
    reg [n-1:0] out;

    always @ (posedge clk)
    out = in;

endmodule // DFlipFlop