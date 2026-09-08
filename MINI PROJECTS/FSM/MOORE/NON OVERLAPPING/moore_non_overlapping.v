//moore non_overlapping 1011 sequence
module moore(clk,rst,din,dout);
input clk,rst;
input din;
output dout;
parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;
reg [2:0]p_state,n_state;
/////////////////////////////////////////
//state register logic
/////////////////////////////////////////
always@(posedge clk)begin
if(rst)
p_state<=s0;
else
p_state<=n_state;
end
////////////////////////////////////////
//next state logic
////////////////////////////////////////
always@(*)begin
case(p_state)
s0:begin
	if(din)
	n_state=s1;
	else
	n_state=s0;
end
s1:begin
	if(din)
	n_state=s1;
	else
	n_state=s2;
end
s2:begin
	if(din)
	n_state=s3;
	else
	n_state=s0;
end
s3:begin
	if(din)
	n_state=s4;
	else 
	n_state=s2;
end
s4:n_state=s0;
default:n_state=s0;
endcase
end
assign dout=(p_state==s4)?1:0;
endmodule

