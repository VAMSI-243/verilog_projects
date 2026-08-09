`timescale 1ns/1ps
module tb;
reg clk,rst,t;
wire q;
integer toggle;
tff dut(clk,rst,t,q);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
rst=1;#10;
rst=0;
t=0;
repeat(50) begin
toggle=$urandom_range(1,15);
#(toggle);
t=~t;
end 
 $finish;
 end
endmodule


