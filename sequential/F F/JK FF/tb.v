`timescale 1ns/1ps
module tb;
reg clk,rst,j,k;
wire q;
integer jack,kibly;
jkff dut(clk,rst,j,k,q);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;#10;
rst=0;
j=0;
k=0;
fork
	repeat (10)begin
	jack=$urandom_range(1,10);        //randomly generating the j signal
	#(jack);
	j=~j;
	end
	repeat(10)begin
	kibly=$urandom_range(1,10);        //randomly generating the k signal
	#(kibly);
	k=~k;
	end
join

$finish;
end
endmodule


