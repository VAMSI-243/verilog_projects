module tb;
reg a,b;
wire l,e,g;
bit_1com dut(a,b,l,e,g);
initial begin
$monitor($time,"a=%b,b=%b,l=%b,e=%b,g=%b",a,b,l,e,g);
repeat(10) begin
{a,b}=$random;
#1;
end
end
endmodule
