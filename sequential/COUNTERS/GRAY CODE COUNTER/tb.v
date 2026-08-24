`timescale 1ns/1ps
module tb;
reg clk;
wire [2:0]q;
gray_counter dut(clk,q);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
#500 $finish;
end
endmodule
