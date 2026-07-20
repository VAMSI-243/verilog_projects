`timescale 1ns / 1ps
module tb;
reg a,b,cin;
wire sum,cout;
integer i;
full_adder dut(a,b,cin,sum,cout);
initial begin
for(i=0;i<8;i=i+1) begin
{a,b,cin}=i; 
#10;
$display("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
end
#10 $finish;
end
endmodule


