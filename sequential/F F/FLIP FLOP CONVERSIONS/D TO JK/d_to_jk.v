module dff(clk,rst,d,q);
input clk,rst,d;
output reg q;
always@(posedge clk) begin
if(rst)
q<=0;
else
q<=d;
end
endmodule

module jkff(clk,rst,j,k,q);
input clk,rst,j,k;
output  q;
wire D,Qn;
assign D=j&~Qn|~k&Qn;
dff u0(clk,rst,D,Qn);
assign q=Qn;
endmodule
