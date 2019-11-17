module XOR_8 (Y, A, B);
    output [7:0] Y;
    input [7:0] A;
    input [7:0] B;

    xor(Y[0], A[0], B[0]);
    xor(Y[1], A[1], B[1]);
    xor(Y[2], A[2], B[2]);
    xor(Y[3], A[3], B[3]);
    xor(Y[4], A[4], B[4]);
    xor(Y[5], A[5], B[5]);
    xor(Y[6], A[6], B[6]);
    xor(Y[7], A[7], B[7]);
endmodule

module NAND_8 (Y, A, B);
    output [7:0] Y;
    input [7:0] A;
    input [7:0] B;

    nand(Y[0], A[0], B[0]);
    nand(Y[1], A[1], B[1]);
    nand(Y[2], A[2], B[2]);
    nand(Y[3], A[3], B[3]);
    nand(Y[4], A[4], B[4]);
    nand(Y[5], A[5], B[5]);
    nand(Y[6], A[6], B[6]);
    nand(Y[7], A[7], B[7]);    
endmodule

module XNOR_8(Y, A, B);
    output [7:0] Y;
    input [7:0] A;
    input [7:0] B;

    xnor(Y[0], A[0], B[0]);
    xnor(Y[1], A[1], B[1]);
    xnor(Y[2], A[2], B[2]);
    xnor(Y[3], A[3], B[3]);
    xnor(Y[4], A[4], B[4]);
    xnor(Y[5], A[5], B[5]);
    xnor(Y[6], A[6], B[6]);
    xnor(Y[7], A[7], B[7]);
endmodule

module NOR_8(Y, A, B);
    output [7:0] Y;
    input [7:0] A;
    input [7:0] B;

    nor(Y[0], A[0], B[0]);
    nor(Y[1], A[1], B[1]);
    nor(Y[2], A[2], B[2]);
    nor(Y[3], A[3], B[3]);
    nor(Y[4], A[4], B[4]);
    nor(Y[5], A[5], B[5]);
    nor(Y[6], A[6], B[6]);
    nor(Y[7], A[7], B[7]);
end module

module testbench();
    wire [7:0] inputA = b'00111111;
    wire [7:0] inputB = b'11110010;
    reg [7:0] norTest;
    reg [7:0] xnorTest;
    reg [7:0] nandTest;
    reg [7:0] xorTest;


    nortester NOR_8(norTest, inputA, inputB);
    xnortester XNOR_8(xnorTest, inputA, inputB);
    xortester XOR_8(xorTest, inputA, inputB);
    nandtester NAND_8(nandTest, inputA, inputB);

    $display("|NOR  TEST  CASE|");
    $display("|7|6|5|4|3|2|1|0|");
    $display("|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|\n\n", norTest[7], norTest[6], norTest[5], norTest[4], norTest[3], norTest[2], norTest[1], norTest[0]);

    $display("|XNOR TEST  CASE|");
    $display("|7|6|5|4|3|2|1|0|");
    $display("|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|\n\n", xnorTest[7], xnorTest[6], xnorTest[5], xnorTest[4], xnorTest[3], xnorTest[2], xnorTest[1], xnorTest[0]);

    $display("|NAND TEST  CASE|");
    $display("|7|6|5|4|3|2|1|0|");
    $display("|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|\n\n", nandTest[7], nandTest[6], nandTest[5], nandTest[4], nandTest[3], nandTest[2], nandTest[1], nandTest[0]);

    $display("|XOR TEST  CASE|");
    $display("|7|6|5|4|3|2|1|0|");
    $display("|%1b|%1b|%1b|%1b|%1b|%1b|%1b|%1b|", xorTest[7], xorTest[6], xorTest[5], xorTest[4], xorTest[3], xorTest[2], xorTest[1], xorTest[0]);
endmodule