`timescale 1ns / 1ps
module tb;
reg a,b;
wire y_not,y_buf,y_and,y_or,y_nor,y_nand,y_xor,y_xnor;
buf_gate dut1(a,y_buf);
not_gate dut2(a,y_not);
and_gate dut3(a,b,y_and);
or_gate dut4(a,b,y_or);
nor_gate dut5(a,b,y_nor);
nand_gate dut6(a,b,y_nand);
xor_gate dut7(a,b,y_xor);
xnor_gate dut8(a,b,y_xnor);

initial begin
$monitor($time,"a=%b,b=%b,y_buf=%b,y_not=%b,y_and=%b,y_or=%b,y_nor=%b,y_nand=%b,y_xor=%b,y_xnor=%b",a,b,y_buf,y_not,y_and,y_or,y_nor,y_nand,y_xor,y_xnor);
a=0; b=0; #10;
a=0; b=1; #10;
a=1; b=0; #10;
a=1; b=1; 
end
endmodule
