module tb;
reg [3:0]i;
reg s1,s0;
wire y;
mux4_1 dut(i,s1,s0,y);
initial begin
repeat(10) begin
{i,s1,s0}=$random; #10;
$display($time,"i=%b,s1=%b,s0=%b,y=%b",i,s1,s0,y);
end
$finish;
end
endmodule
