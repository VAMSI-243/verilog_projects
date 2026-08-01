`timescale 1ns/1ps
module tb;
reg clk,s,r;
wire q;
integer set,reset;
srff dut(clk,s,r,q);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
fork
s=0;
	repeat(50)begin
		set=$urandom_range(1,5);
		#(set);
		s=~s;
	end
r=0;
	repeat(50)begin
		reset=$urandom_range(1,5);
		#(reset);
		r=~r;
	end
join
$finish;
end
endmodule

