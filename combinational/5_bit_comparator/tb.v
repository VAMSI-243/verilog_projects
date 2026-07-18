`timescale 1ns/1ps
module tb;
reg[4:0] a,b;
wire l,e,g;
integer i;
bit_5com dut(a,b,l,e,g);
initial begin
for(i=0;i<1024;i=i+1)begin
{a,b}=i;#1;
$display("time=%0t,a=%0d,b=%0d,l=%0d,e=%0d,g=%0d",$time,a,b,l,e,g);
end
end
endmodule

