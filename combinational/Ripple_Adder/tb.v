
module tb;
parameter N=8;
reg [N-1:0]a,b;
reg cin;
wire [N-1:0]sum;
wire cout;
ripple_adder dut(a,b,cin,sum,cout);
initial begin
$monitor("time=%0d,a=%h,b=%h,cin=%b,sum=%h,cout=%b",$time,a,b,cin,sum,cout);
repeat(10) begin
{a,b,cin}=$random; #10;
end
end
endmodule
