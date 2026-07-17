module tb;
reg a,b,cin;
wire sum,cout;
full_adder dut(a,b,cin,sum,cout);
initial begin
$monitor("a=%b,b=%b,cin=%b,sum=%b,cout=%b",a,b,cin,sum,cout);
repeat(20) begin
{a,b,cin}=$random; #1;
end
end
endmodule

