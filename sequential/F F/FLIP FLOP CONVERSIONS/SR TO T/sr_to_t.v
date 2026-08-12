module srff(clk,r,s,q);
input clk,r,s;
output reg q;
always@(posedge clk) begin
if(s==0 && r==0) q<=q;
else if(s==1 && r==0) q<=1;
else if(s==0 && r==1) q<=0;
else if(s==1 && r==1) q<=1'bx;
else q<=1'b0;
end
endmodule
module tff(clk,rst,t,q);
input clk,rst,t;
output q;
wire a,b;
assign a=t&~q;
assign b=t&q;
srff dut1(clk,b,a,q);
endmodule
