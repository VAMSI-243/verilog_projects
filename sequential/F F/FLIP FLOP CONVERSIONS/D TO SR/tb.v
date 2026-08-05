`timescale 1ns/1ps
module tb;
reg clk,s,r;
wire q;
integer reset,delay;
srff dut(clk,s,r,q);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin 
fork
	r=0;
	repeat(50) begin
		reset=$urandom_range(1,15);
		#(reset);
		r=~r;
	end
	s=0;
	repeat(50) begin
		set=$urandom_range(1,15);
		#(set);
		s=~s;
	end
join
#100 $finish;
end
endmodule
