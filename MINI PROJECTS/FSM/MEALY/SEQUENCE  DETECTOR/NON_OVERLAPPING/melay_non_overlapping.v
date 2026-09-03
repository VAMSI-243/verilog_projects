//mealy non_overlapping 1011  sequence
module mealy_1011(clk,rst,din,dout);
input clk,rst;
input din;
output dout;
parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;
reg [1:0]p_state,n_state;
//////////////////////////////////////
//state register logic
//////////////////////////////////////
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
s0:n_state=din?s1:s0;
s1:n_state=din?s1:s2;
s2:n_state=din?s3:s0;
s3:	n_state=din?s0:s2;
default:n_state=s0;
endcase
end
assign dout=((p_state==s3) && (din))?1:0;
endmodule
