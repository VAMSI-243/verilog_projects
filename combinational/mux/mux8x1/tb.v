`timescale 1ns / 1ps
module tb;
reg [7:0]i;
reg [2:0]s;
wire y;
mux8_1 dut(i,s,y);
initial
begin
$monitor("i=%b,s=%b,y=%b",i,s,y);
repeat(10) begin
{i,s}=$random; #1;
end
$finish;
end
endmodule
