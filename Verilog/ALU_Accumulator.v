
// Put in full adder module 
// TODO: Basically translate what you did in the lab into Verilog

module DFlipFlop (clk, in, out, clr, pre, S);
    parameter n = 4; 
    
    input clk; 
    input [n-1:0] in;

    input [n-1:0] S;

    //input clr;
    //input pre;
    
    output [n-1:0] out;
    
    reg [n-1:0] out;

    always @ (posedge clk)
    out = in;

    // Connecting the DFF back to the adder 

    wire [3:0] B;

    wire [1:0] Cout;

    Adder addThem (out, B, 1'b0, Cout, S);

endmodule // DFlipFlop

module Adder(input [3:0] A, B, input carryIn, output carryOut, output [3:0] summation);

    wire [3:0] t;
    wire cin1, cin2, cin3, cin4;

    // Adding the bits of A and B together

    xor xorGateOne(t[0], carryIn, B[0]);
    xor xorGateTwo(t[1], carryIn, B[1]);
    xor xorGateThree(t[2], carryIn, B[2]);
    xor xorGateFour(t[3], carryIn, B[3]);

    Full_Adder S0 (.A(A[0]), .B(t[0]), .c_in(carryIn), .c_out(cin1), .sum(summation[0]));
    Full_Adder S1 (.A(A[1]), .B(t[1]), .c_in(cin1), .c_out(cin2), .sum(summation[1]));
    Full_Adder S2 (.A(A[2]), .B(t[2]), .c_in(cin2), .c_out(cin3), .sum(summation[2]));
    Full_Adder S3 (.A(A[3]), .B(t[3]), .c_in(cin3), .c_out(carryOut), .sum(summation[3]));
    
    // Connecting the adder to the D Flip Flop

    wire [3:0] transfer; 

    transfer[0] = summation[0];
    transfer[1] = summation[1]; 
    transfer[2] = summation[2];
    transfer[3] = summation[3];

    wire [3:0] Q; 

    // FIXME: 

    DFlipFlop DFF (3'b001, transfer, Q, 1'b1, 1'b1, summation);

endmodule // Adder

module testbench();

    input [3:0] A; 
    input [3:0] B;

    

endmodule // Testbench