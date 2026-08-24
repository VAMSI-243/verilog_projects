
//gray code counter using gatelevel using srFF

module srff(clk,s,r,Q);
input clk,s,r;
output reg Q;
always@(posedge clk) begin
if(s==1 && r==1) Q<=1'bx;
else if(s) Q<=1;
else if(r) Q<=0;
else  Q<=Q;

end
endmodule

module gray_counter( clk,q);
input clk;
output [2:0]q;
wire q2b,q1b,q0b,n1,n2,n3,n4,n5,n6;
not(q2b,q[2]);
not(q1b,q[1]);
not(q0b,q[0]);

and(n1,q[1],q0b);
and(n2,q1b,q0b);
and(n3,q2b,q[0]);
and(n4,q[2],q[0]);
xnor(n5,q[1],q[2]);
xor(n6,q[1],q[2]);
 srff dut2(clk,n1,n2,q[2]);
 srff dut1(clk,n3,n4,q[1]);
 srff dut0(clk,n5,n6,q[0]);
endmodule
