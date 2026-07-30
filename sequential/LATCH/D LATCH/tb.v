`timescale 1ns/1ps
module tb;
reg d,en;
wire q;
integer enable,delay;
d_latch dut(d,en,q);
initial begin
d=0;
en=0;
repeat(20)begin
enable=$urandom_range(1,10);
#(enable);
en=~en;

delay=$urandom_range(1,10);
#(delay);
d=~d;
end
$finish;
end
endmodule
