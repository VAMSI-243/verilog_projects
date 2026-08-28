`timescale 1ns/1ps
module tb;
reg clk,rst,load;
reg [3:0]in;
wire out;
piso dut(clk,rst,in,load,out);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;
load=0;
in=0;
#10;
rst=0;
load=1;
in=4'b0101;
#10;
load=0;#50;
$finish;
end
endmodule



