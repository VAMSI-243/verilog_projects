`timescale 1ns/1ps
module tb;
reg clk,rst,d;
wire q;
integer delay;
dff dut(clk,rst,d,q);
initial begin
	clk = 0;
	d = 0;
	forever #5 clk = ~clk; 
end

initial begin
rst=1;#10;
rst=0;
	repeat(50) begin 
		delay = $urandom_range(1, 20); 	
		#(delay);
		d = ~d;
	end
 $finish;
end

endmodule
