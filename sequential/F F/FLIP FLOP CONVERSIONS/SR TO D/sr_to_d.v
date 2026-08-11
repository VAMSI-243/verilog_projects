module srff(clk,r,s,q);
input clk,r,s;
output reg q;
always@(posedge clk) begin
	if(s==0 && r==0) q<=q;
	else if(s==1 && r==0) q<=1;
	else if(s==0 && r==1) q<=0;
	else q<=1'bx;
end	
endmodule

module dff(clk,rst,d,q);
input clk,rst,d;
output q;
srff u0(clk,~d,d,q);
endmodule
