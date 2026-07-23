 //data flow
module ha(a,b,s,c);
input a,b;
output  s;
output c;
assign {c,s}=a+b;
endmodule

// behavioural
module ha(a,b,s,c);
input a,b;
output reg s;
output reg c;
always @(*)
begin
s=a^b;
c=a&b;
end
endmodule 

//8bit adder using logic gates

module ha(a,b,s,c);
parameter N=8;
input [N-1:0]a,b;
output  [N-1:0]s,c;
genvar i;
for(i=0;i<N;i=i+1) begin
xor(s[i],a[i],b[i]);
and(c[i],a[i],b[i]);
end
endmodule 

//8 bit adder using half adder
module ha(a,b,s,c);
input a,b;
output  s;
output c;
assign {c,s}=a+b;
endmodule
module ha(a,b,s,c);
parameter N=8;
input [N-1:0]a,b;
output  [N-1:0]s,c;
genvar i;
for(i=0;i<N;i=i+1) begin
ha u0(a[i],b[i],s[i],c[i]);
end
endmodule 


