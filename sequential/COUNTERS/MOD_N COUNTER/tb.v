`timescale 1ns/1ps
module tb;
parameter WIDTH=4;
reg clk,rst;
wire [WIDTH-1:0]count;
mod_n dut(.*);
initial begin
	clk=0;
	forever #5 clk=~clk;
end
always@(posedge clk)
	$strobe($time,"clk=%b,rst=%b,count=%b",clk,rst,count);
initial begin
	 rst=1;
	#10 rst=0;
	#120 rst=1;
	#10 rst=0;
	#50 $finish;
end
endmodule


