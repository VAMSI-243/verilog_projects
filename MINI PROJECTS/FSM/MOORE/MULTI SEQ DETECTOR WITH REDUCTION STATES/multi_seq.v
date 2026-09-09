//MULTI SEQUENCE 001 , 011 , 111
module multi_seq_moore(clk,rst,din,dout);
input clk,rst,din;
output reg dout;
parameter s0=4'b0000;
parameter s1=4'b0001;
parameter s2=4'b0010;
parameter s3=4'b0011;
parameter s4=4'b0100;
parameter s5=4'b0101;
parameter s6=4'b0110;
parameter s7=4'b0111;
parameter s8=4'b1000;


reg[3:0]p_state,n_state;
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
/*
//OVERLAPPING
s0:n_state=din?s6:s1;
s1:n_state=din?s4:s2;
s2:n_state=din?s3:s2;
s3:n_state=din?s5:s1;  
s4:n_state=din?s5:s1;
s5:n_state=din?s8:s1; 
s6:n_state=din?s7:s1;
s7:n_state=din?s8:s1;
s8:n_state=din?s8:s1;  
*/
//NON-OVERLAPPING
s0:n_state=din?s6:s1;
s1:n_state=din?s4:s2;
s2:n_state=din?s3:s2;
s3:n_state=din?s6:s1;  
s4:n_state=din?s5:s1;
s5:n_state=din?s6:s1; 
s6:n_state=din?s7:s1;
s7:n_state=din?s8:s1;
s8:n_state=din?s6:s1; 
default:n_state=s0;

endcase
end
always@(*)begin
dout=((p_state==s3 )||(p_state==s5)||(p_state==s8 ))?1:0;
end
endmodule




