`timescale 1ns / 1ps
module tb;
reg a,b;
wire l,e,g;
integer i;
bit_1com dut(a,b,l,e,g);
initial begin
for(i=0;i<4;i=i+1)begin
{a,b}=i;#10;
$display("time=%0t,a=%b,b=%b,l=%b,e=%b,g=%b",$time,a,b,l,e,g);
end
end
endmodule
