`timescale 1ns/1ps
module tb;
reg clk,rst;
reg din;
wire  dout;
mealy_1011 dut(clk,rst,din,dout);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
	rst=1;
	#10;
	rst=0;
	repeat(100)begin
	  @(posedge clk);
	  din=$random;
	end
#10 $finish;
end
endmodule




