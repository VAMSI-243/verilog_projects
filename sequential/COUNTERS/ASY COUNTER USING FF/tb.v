`timescale 1ns/1ps
module tb;
parameter WIDTH=3;
reg clk,rst;
wire [WIDTH-1:0]count;
asy_counter dut(clk,rst,count);
initial begin
	clk=0;
	forever #5 clk=~clk;
end
always@( posedge clk)
	 $strobe($time,"clk=%b,rst=%b,count=%b",clk,rst,count);
initial begin
	 rst=1;
	#10 rst=0;
	#100 rst=1;
	#10 rst=0;
	#100 $finish;
end
endmodule



