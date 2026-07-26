
module tb;
reg i0,i1,i2,i3;
wire y0,y1;
wire v;
integer i;
encod dut({i3,i2,i1,i0},{y1,y0},v);
initial begin
for(i=0;i<16;i=i+1) begin
{i3,i2,i1,i0}=i;
#10;
$display("time=%0t,i3=%b, i2=%b, i1=%b, i0=%b, y1=%b, y0=%b, v=%b",$time,i3,i2,i1,i0,y1,y0,v);
end
end
endmodule
