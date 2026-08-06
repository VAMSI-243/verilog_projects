//T FLIP FLOP USING D FLIP FLOP
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
module tff(clk,rst,t,q);
input clk,rst,t;
output q;
wire D,Qn;
assign D=t^Qn;
dff u0(clk,rst,D,Qn);
assign q=Qn;
endmodule
