`timescale 1ns/1ps
module tb;
reg clk,rst,t;
wire q;
integer delay;
tff dut(clk,rst,t,q);
initial begin
	clk = 0;
	t = 0;
	forever #5 clk = ~clk; 
end

initial begin
rst=1;#10;
rst=0;
	repeat(80) begin 
		delay = $urandom_range(1, 20); 	
		#(delay);
		t = ~t;
	end
 $finish;
end

endmodule

