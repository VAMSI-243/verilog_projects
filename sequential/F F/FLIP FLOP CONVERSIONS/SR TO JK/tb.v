`timescale 1ns/1ps
module tb;
reg clk,j,k;
wire q;
integer jack,Kilby;
jkff dut(clk,j,k,q);
initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin 
fork
	j=0;
	repeat(100) begin
		jack=$urandom_range(1,5);
		#(jack);
		j=~j;
	end
	k=0;
	repeat(80) begin
		Kilby=$urandom_range(1,10);
		#(Kilby);
		k=~k;
	end
join
$finish;
end
endmodule


