//4x4 multiplier using 4bit ripple adders
module  ripp(a,b,cin,s,c);
input [3:0]a,b;
input cin;
output [3:0]s;
output c;
assign {c,s}=a+b+cin;
endmodule

module multiplier4x4(a,b,p);
input [3:0]a;
input [3:0]b;
output [7:0]p;

assign p00=a[0]&b[0];
assign p01=a[1]&b[0];
assign p02=a[2]&b[0];
assign p03=a[3]&b[0];
assign p10=a[0]&b[1];
assign p11=a[1]&b[1];
assign p12=a[2]&b[1];
assign p13=a[3]&b[1];
assign p20=a[0]&b[2];
assign p21=a[1]&b[2];
assign p22=a[2]&b[2];
assign p23=a[3]&b[2];
assign p30=a[0]&b[3];
assign p31=a[1]&b[3];
assign p32=a[2]&b[3];
assign p33=a[3]&b[3];
assign p[0]=p00;

wire [3:0] a1,b1,s1;
wire [3:0] a2,b2,s2;
wire [3:0] a3,b3,s3;
wire c1,c2,c3;
assign a1={p13,p12,p11,p10};
assign b1={1'b0,p03,p02,p01};
ripp u1(.a(a1),.b(b1),.cin(1'b0),.s(s1),.c(c1));
assign a2={p23,p22,p21,p20};
assign b2={c1,s1[3],s1[2],s1[1]};
ripp u2(.a(a2),.b(b2),.cin(1'b0),.s(s2),.c(c2));
assign a3={p33,p32,p31,p30};
assign b3={c2,s2[3],s2[2],s2[1]};
ripp u3(.a(a3),.b(b3),.cin(1'b0),.s(s3),.c(c3));
assign p[1]=s1[0];
assign p[2]=s2[0];
assign p[3]=s3[0];
assign p[4]=s3[1];
assign p[5]=s3[2];
assign p[6]=s3[3];
assign p[7]=c3;
endmodule
//4x4 multipier using half adders and full adders
module ha(a,b,s,c);
input a,b;
output s,c;
assign {c,s}=a+b;
endmodule
module  fa(a,b,cin,s,c);
input a,b,cin;
output s,c;
assign {c,s}=a+b+cin;
endmodule

module mul4x4(a,b,p);
input [3:0]a;
input [3:0]b;
output [7:0]p;
assign p00=a[0]&b[0];
assign p01=a[1]&b[0];
assign p02=a[2]&b[0];
assign p03=a[3]&b[0];
assign p10=a[0]&b[1];
assign p11=a[1]&b[1];
assign p12=a[2]&b[1];
assign p13=a[3]&b[1];
assign p20=a[0]&b[2];
assign p21=a[1]&b[2];
assign p22=a[2]&b[2];
assign p23=a[3]&b[2];
assign p30=a[0]&b[3];
assign p31=a[1]&b[3];
assign p32=a[2]&b[3];
assign p33=a[3]&b[3];
assign p[0]=p00;
ha u1(p01,p10,p[1],c0);
fa u2(p11,p02,c0,s0,c1);
ha u3(s0,p20,p[2],c2);
fa u4(p03,p12,c1,s1,c3);
fa u5(p21,s1,c2,s2,c4);
ha u6(p30,s2,p[3],c5);
ha u7(p13,c3,s3,c6);
fa u8(p22,s3,c4,s4,c7);
fa u9(p31,s4,c5,p[4],c8);
fa u10(p23,c6,c7,s5,c9);
fa u11(p32,s5,c8,p[5],c10);
fa u12(p33,c9,c10,p[6],p[7]);
endmodule



