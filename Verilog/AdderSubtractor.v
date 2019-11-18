module Half_Adder (input A, B, output c_out, sum);
	xor G1 (sum, A, B);
	and G2 (c_out, A, B);
endmodule

module Full_Adder (input A, B, c_in, output c_out, sum);
	wire w1, w2, w3; // w1 = c_out, w2 = sum
	Half_Adder M1 (A, B, w1, w2);
	Half_Adder M2 (w2, c_in, w3, sum);
	or (c_out, w1, w3);
endmodule

module Adder_Subtractor(input [7:0] A, B, input c_in, output c_out, output [7:0] sum); //done structurally

wire [7:0] f;
wire c_in1, c_in2, c_in3, c_in4, c_in5, c_in6, cin_7;

	xor G1(f[0], c_in, B[0]);
	xor G2(f[1], c_in, B[1]);
	xor G3(f[2], c_in, B[2]);
	xor G4(f[3], c_in, B[3]);
	xor G5(f[4], c_in, B[4]);
	xor G6(f[5], c_in, B[5]);
	xor G7(f[6], c_in, B[6]);
	xor G8(f[7], c_in, B[7]);

	Full_Adder M0 (.A(A[0]), .B(f[0]), .c_in(c_in), .c_out(c_in1), .sum(sum[0]));
	Full_Adder M1 (.A(A[1]), .B(f[1]), .c_in(c_in1), .c_out(c_in2), .sum(sum[1]));
	Full_Adder M2 (.A(A[2]), .B(f[2]), .c_in(c_in2), .c_out(c_in3), .sum(sum[2]));
	Full_Adder M3 (.A(A[3]), .B(f[3]), .c_in(c_in3), .c_out(c_in4), .sum(sum[3]));
	Full_Adder M4 (.A(A[4]), .B(f[4]), .c_in(c_in4), .c_out(c_in5), .sum(sum[4]));
	Full_Adder M5 (.A(A[5]), .B(f[5]), .c_in(c_in5), .c_out(c_in6), .sum(sum[5]));
	Full_Adder M6 (.A(A[6]), .B(f[6]), .c_in(c_in6), .c_out(c_in7), .sum(sum[6]));
	Full_Adder M7 (.A(A[7]), .B(f[7]), .c_in(c_in7), .c_out(c_out), .sum(sum[7]));
endmodule


module testBench(); //tester working
	reg [7:0] A, B; 
    reg c_in;
    wire [7:0] sum;
    wire c_out;
	
	Adder_Subtractor testing(A, B, c_in, c_out, sum);
	initial begin
	
		$monitor ("A = %1d, B = %1d, c_in = %1d, c_out = %B, sum = %d", A, B, c_in, c_out, sum);

		A = 13; B = 7; c_in = 0; #100
		A = 64; B = 32; c_in = 1; #100

		$finish;
	end
endmodule
