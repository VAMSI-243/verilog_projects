module dff(clk,rst,d,q);
input clk,rst,d;
output reg q;
always@(posedge clk) begin
if (rst)
q<=0;
else
q<=d;
end
endmodule

module srff(clk,s,r,q);
input clk,s,r;
output  q;
wire D,Qn;
assign D=s|((~r)&Qn);
dff u0(clk,1'b0,D,Qn);
assign q=Qn;
endmodule
