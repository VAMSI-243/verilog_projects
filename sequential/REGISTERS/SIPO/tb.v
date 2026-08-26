`timescale 1ns/1ps
module tb;
reg clk,rst,in;
wire [3:0]out;
sipo dut(clk,rst,in,out);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;#10;
rst=0;
in=1;#10;
in=0;#15;
in=1;#10;
in=1;#20;
#100 $finish;
end
endmodule

