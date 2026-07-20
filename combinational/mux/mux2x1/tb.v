module tb;
reg [1:0]i;
reg s;
wire y;
integer j;
mux2_1 dut(i,s,y);
initial begin
for(j=0;j<8;j=j+1) begin
{i,s}=j; #10;
$display($time,"i=%b,s=%b,y=%b",i,s,y);
end
$finish;
end
endmodule
