`timescale 1ns/1ps
module tb;
reg clk,rst;
reg [3:0]in;
wire [3:0]out;
pipo dut(clk,rst,in,out);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;#10;
rst=0;
in=4'b0101;#10;

in=0011;#15;
#100 $finish;
end
endmodule


