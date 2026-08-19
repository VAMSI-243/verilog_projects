`timescale 1ns/1ps
module tb;
parameter WIDTH=3;
reg clk,rst,m;
wire [WIDTH-1:0]count;
counter dut(clk,rst,m,count);
initial begin
	clk=0;
	forever #5 clk=~clk;
end
always@(posedge clk)
	 $strobe($time,"clk=%b,rst=%b,m=%b,count=%b",clk,rst,m,count);
initial begin
	 rst=1;
	#10 rst=0;m=1;
	#100 rst=1;
	#10 rst=0;m=0;
	#100 $finish;
end
endmodule


