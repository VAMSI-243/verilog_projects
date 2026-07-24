`timescale 1ns/1ps
module tb;
reg [2:0]i;
wire [7:0]y;
integer j;
decoder3x8 dut(i,y);
initial
begin
for(j=0;j<8;j=j+1) begin
i=j;#10;
$display($time,"i=%b,y=%b",i,y);

end
$finish;
end
endmodule

