`timescale 1ns/1ps
module tb;
parameter WIDTH=3;
reg clk,rst;
wire [WIDTH-1:0]count;
ring_counter dut(clk,rst,count);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
	rst=1; #10;
	rst=0;#70;
	rst=1;#10;
	rst=0;
	#50 $finish;
end
endmodule
