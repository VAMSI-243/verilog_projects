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
			delay=$urandom_range(1,15);
			#(delay);
			s=~s;
		end
	join
#500 $finish;
end
endmodule

