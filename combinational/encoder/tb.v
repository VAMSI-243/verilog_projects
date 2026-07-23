`timescale 1ns/1ps
module tb;
reg [3:0]i;
wire [1:0]y;
integer j;
encod dut(.*);
initial begin
for(j=0;j<16;j=j+1) begin
i=j;
#10;
$display("time=%0t,i=%b,y=%b",$time,i,y,);
end
end
endmodule

