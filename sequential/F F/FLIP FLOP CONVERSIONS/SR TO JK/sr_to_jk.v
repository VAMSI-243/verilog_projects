//JK FLIP FLOP USIG SR FLIP FLOP
module srff(clk,r,s,q);
input clk,r,s;
output reg q;
always@(posedge clk) begin
	if(s==1 && r==0) q<=1;
	else if(s==0 && r==0) q<=q;
	else if(s==0 && r==1) q<=0;
	else if (s==1 && r==1)q<=1'bx;
	else q<=0;
end
endmodule

module jkff(clk,j,k,q);
input clk,j,k;
output q;
wire s,r,Qn;
assign s=j&~Qn;  
assign r=k&Qn;   
srff u0(clk,b,a,Qn);
assign q=Qn;
endmodule
