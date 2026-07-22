`timescale 1ns/1ps
module tb;
reg i;
reg [2:0]s;
wire [7:0]y;
demux1x8 dut (i,s,y);
initial begin
repeat(20) begin
i=1;s=$random;
#10;
$display($time,"i=%b,s=%b,y=%b",i,s,y);
end
end
endmodule
 
