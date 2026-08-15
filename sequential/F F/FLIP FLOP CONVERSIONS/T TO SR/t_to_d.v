module tff(clk,rst,t,q);
input clk,rst,t;
output reg q;
always @(posedge clk) begin
	if(rst)
		q<=0;
	else if(t==0)
		q<=q;
	else
		q<=~q;
end
endmodule

module dff(clk,rst,d,q);
input clk,rst,d;
output q;
wire T;
assign T=d^q;
tff dut1(clk,rst,T,q);
endmodule

