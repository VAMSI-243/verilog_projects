//MOD 10 COUNTER
module mod_n(clk,rst,count);
parameter N=10;
parameter WIDTH=4;
input clk,rst;
output reg [WIDTH-1:0]count;
always @ (posedge clk) begin
	if(rst)
		count<=0;
	else if(count==N-1)
		count<=0;
	else
		count<=count+1;
end
endmodule
