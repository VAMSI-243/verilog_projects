`timescale 1ns/1ps
module tb;
reg a,b;
wire y_and, y_or, y_nand, y_nor, y_xor, y_xnor;
integer j;
 andgate dut0(a,b,y_and);
 orgate dut1(a,b,y_or);
 nandgate dut2(a,b,y_nand);
 norgate dut3(a,b,y_nor);
 xorgate dut4(a,b,y_xor);
xnorgate dut5(a,b,y_xnor);
initial
begin
for(j=0;j<4;j=j+1) begin
{a,b}=j;
#10;
$display("time=%0t,a=%b,b=%b,y_and=%b, y_or=%b, y_nand=%b, y_nor=%b, y_xor=%b, y_xnor=%b",$time,a,b,y_and, y_or, y_nand, y_nor, y_xor, y_xnor);
end
$finish;
end
endmodule
