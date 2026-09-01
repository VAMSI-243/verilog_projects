//Dynamic pattern detection
module dynamic_pattern(clk,rst,din,dout,count);
input clk,rst,din;
output reg dout;
output reg [4:0]count;
parameter pattern_check=4'b1101;
reg [3:0]pattern;
always@(posedge clk)begin
	if(rst)begin
	dout=0;
	count=0;
	pattern=0;
	end
	else begin
		pattern={pattern[2:0],din};
		if(pattern==pattern_check)begin
			dout=1'b1;
			count=count+1;
		end
		else 
		dout=1'b0;
		
end
end
endmodule
