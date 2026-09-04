//multiple seq detect 1101,1011
module multi_seq_mealy(clk,rst,din,dout);
input clk,rst,din;
output reg dout;
// one hot encode
parameter s0=6'b000001;
parameter s1=6'b000010;
parameter s2=6'b000100;
parameter s3=6'b001000;
parameter s4=6'b010000;
parameter s5=6'b100000;
reg[5:0]p_state,n_state;
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
s0:n_state=din?s1:s0;
s1:n_state=din?s2:s4;
s2:n_state=din?s2:s3;
s3:n_state=din?s5:s0;
s4:n_state=din?s5:s0;
s5:n_state=din?s2:s4;
//NON_OVERLAPPING
/*
s0:n_state=din?s1:s0;
s1:n_state=din?s2:s4;
s2:n_state=din?s2:s3;
s3:n_state=din?s0:s0;
s4:n_state=din?s5:s0;
s5:n_state=din?s0:s4;   */
default:n_state=s0;
endcase
end
always@(*)begin
dout=((p_state==s3 && din)||(p_state==s5 && din))?1:0;
end
endmodule
