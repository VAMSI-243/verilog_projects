`timescale 1ns/1ps
module tb;
reg clk,rst,j,k;
wire q;
integer jack,Kilby;
jkff dut(clk,rst,j,k,q);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin 
rst=1;#10;
rst=0;
j=0;
fork        // fork join used to run j and k  concurrently
repeat(40) begin
jack=$urandom_range(1,8);       //randomly generating j signal
#(jack);
j=~j;
end
k=0;
repeat(40) begin
Kilby=$urandom_range(1,10);   //randomly generating k signal
#(Kilby);
k=~k;
end
join
#50;
$finish;
end
endmodule

