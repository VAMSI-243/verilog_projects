//multiple seq detect 001,011,111
module multi_seq_moore(clk,rst,din,dout);
input clk,rst,din;
output reg dout;
parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;
parameter s5=3'b101;



reg[2:0]p_state,n_state;
always@(posedge clk)begin
if(rst)begin
p_state<=s0;
end
else begin
p_state<=n_state;
end
end
always@(*)begin
case(p_state)
//OVERLAPPING
s0:n_state=din?s5:s1;
s1:n_state=din?s4:s2;
s2:n_state=din?s3:s2;
s3:n_state=din?s3:s1;
s4:n_state=din?s3:s1;
s5:n_state=din?s4:s1;

//NON_OVERLAPPING
s0:n_state=din?s5:s1;
s1:n_state=din?s4:s2;
s2:n_state=din?s3:s2;
s3:n_state=din?s5:s1;
s4:n_state=din?s3:s1;
s5:n_state=din?s4:s1;

default:n_state=s0;
endcase
end
always@(*)begin
dout=((p_state==s3 ))?1:0;
end
endmodule
