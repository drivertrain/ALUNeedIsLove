module ha(a,b, sum, cout); //sub module for Half adder
input a,b;
output sum,cout;
xor m1(sum,a,b);
and m2(cout,a,b);
endmodule

module fa(a,b,cin, sum, cout); //full-adder
input a,b,cin;
output sum,cout;

wire s1,c1,c2;
ha m1(a,b,s1,c1);
ha m2(cin,w1,sum,c2);
or m3(cout,c1,c2);
endmodule

module fa_structural(a,b,cin,sum,cout); //done structurally
input [7:0] a,b;
input cin;
output [7:0] sum;
output cout;

wire c1,c2,c3,c4,c5,c6,c7;
fa m1(a[0], b[0], cin, sum[0], c1);
fa m2(a[1], b[1], c1, sum[1], c2);
fa m3(a[2], b[2], c2, sum[2], c3);
fa m4(a[3], b[3], c3, sum[3], c4);
fa m5(a[4], b[4], c4, sum[4], c5);
fa m6(a[5], b[5], c5, sum[5], c6);
fa m7(a[6], b[6], c6, sum[6], c7);
fa m8(a[7], b[7], c7, sum[7], cout);
endmodule

module add_sub(a, b, selector, sum, cout); //adder and subtractor
input [7:0] a,b;
input selector; //0 for add, 1 for sub
output [7:0] sum;
output cout;

wire x0, x1, x2, x3, x4, x5, x6, x7;
wire c1,c2,c3,c4,c5,c6,c7;

xor switch0(x0, selector, b[0]);
xor switch1(x1, selector, b[1]);
xor switch2(x2, selector, b[2]);
xor switch3(x3, selector, b[3]);
xor switch4(x4, selector, b[4]);
xor switch5(x5, selector, b[5]);
xor switch6(x6, selector, b[6]);
xor switch7(x7, selector, b[7]);

fa m1(a[0], b[0], selector, sum[0], c1);
fa m2(a[1], b[1], c1, sum[1], c2);
fa m3(a[2], b[2], c2, sum[2], c3);
fa m4(a[3], b[3], c3, sum[3], c4);
fa m5(a[4], b[4], c4, sum[4], c5);
fa m6(a[5], b[5], c5, sum[5], c6);
fa m7(a[6], b[6], c6, sum[6], c7);
fa m8(a[7], b[7], c7, sum[7], cout);
endmodule


module testbench(); //tester not working; need second eyes
  reg [7:0] inputA = 8'b00111111;
    reg [7:0] inputB = 8'b11110010;
    reg select = 0;
    wire [7:0] summer;
    wire c1;
add_sub m1(inputB, inputA, select, summer, c1);
initial begin
 $display ("|##|A|B|Select|Sum|Cout|");
  $display ("|==+=+=+=+=+==|"); 
$display ("|%2d|%1d|%1d|%1d|%1d|",inputA,inputB,select,summer,c1);
#5
$finish;
end
endmodule