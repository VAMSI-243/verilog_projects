`timescale 1ns/1ps
module tb;
reg [3:0]b;
wire [3:0]g;
integer i;
bin_to_gray dut(b,g);
initial
begin
for(i=0;i<16;i=i+1) begin
b=i; #10;
$display("time=%0t,b=%b,g=%b",$time,b,g);
end
end
endmodule
