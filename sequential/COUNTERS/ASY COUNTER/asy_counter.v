//ASY UPCOUNTER
module asy_counter(clk,rst,count);
parameter WIDTH=3;
input clk,rst;
output  reg[WIDTH-1:0] count;
always@(posedge clk  or posedge rst) begin
	if(rst)
		count[0]<=0;
	else
		count[0]<=~count[0];
end
always@(posedge ~count[0] or  posedge rst) begin   //COUNT[0] FOR DOWN COUNTER
	if(rst)
		count[1]<=0;
	else
		count[1]<=~count[1];
end
always@(posedge ~count[1] or posedge rst) begin     //COUNT[1] FOR DOWN COUNTER

	if(rst)
		count[2]<=0;
	else
		count[2]<=~count[2];
end
endmodule
