module dff(clk,rst,d,q);
input clk,rst,d;
output reg q;
always@(posedge clk or posedge rst) begin
	if(rst)
		q<=1'b0;
	else
		q<=d;
end
endmodule
module asy_counter(clk,rst,count);
parameter WIDTH=3;
input clk,rst;
output [WIDTH-1:0]count;
wire [WIDTH-1:0]d;
assign d[0]=~count[0];
assign d[1]=~count[1];
assign d[2]=~count[2];
dff u0(clk,rst,d[0],count[0]);
dff u1(~count[0],rst,d[1],count[1]);
dff u2(~count[1],rst,d[2],count[2]);
endmodule


