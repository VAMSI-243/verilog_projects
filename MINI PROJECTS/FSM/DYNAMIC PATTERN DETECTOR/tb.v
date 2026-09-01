`timescale 1ns/1ps
module tb;
reg clk,rst,din;
wire dout;
wire [4:0]count;
 dynamic_pattern dut(clk,rst,din,dout,count);
 initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;#10;
rst=0;
din=0;
repeat(50) begin
@(negedge clk);
din=$random;
end
$finish;
end
 endmodule
