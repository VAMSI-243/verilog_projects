`timescale 1ns/1ps
module tb;
reg a,b;
wire s,c;
integer i;
ha dut (a,b,s,c);
initial
begin
for(i=0;i<4;i=i+1) begin
{a,b}=i; #10;
$display("$time=%0t,a=%b,b=%b,s=%b,c=%b",$time,a,b,s,c);
end
end
endmodule


//Test bench for ripple carry adder
module tb;
reg [7:0]a,b;
wire [7:0]s;
 wire [7:0]c;
ha dut (a,b,s,c);
initial
begin
repeat(10) begin
{a,b}=$random; #10;
$display("$time=%0t,a=%b,b=%b,s=%b,c=%b",$time,a,b,s,c);
end
end
endmodule

