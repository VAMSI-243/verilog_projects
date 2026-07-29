`timescale 1ns/1ps
module tb;
reg [3:0]d;
wire [6:0]y;
integer i;
bcd_7seg dut(d,y);
initial
begin
for(i=0;i<10;i=i+1) begin
d=i; 
#10;
$display($time,"d=%0d,y=%b",d,y);
end
end
endmodule
