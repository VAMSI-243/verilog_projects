//COUNTER USING DFF
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
module counter(clk,rst,m,count);
parameter WIDTH=3;
input clk,rst,m;
output [WIDTH-1:0]count;
wire [WIDTH-1:0]q;
wire [WIDTH-1:0]d;
assign d=(m==1)?q-3'd1:q+3'd1;    //If m==1 it acts as upcounter else down counter
dff u0(clk,rst,d[0],q[0]);
dff u1(clk,rst,d[1],q[1]);
dff u2(clk,rst,d[2],q[2]);
assign count=q;
endmodule

