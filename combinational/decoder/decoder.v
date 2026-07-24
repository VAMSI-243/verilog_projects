
module decoder2x4(en,i,y);
input en;
input [1:0]i;
output [3:0]y;
assign y[0]=~i[1]&~i[0]&en;
assign y[1]=~i[1]&i[0]&en;
assign y[2]=i[1]&~i[0]&en;
assign y[3]=i[1]&i[0]&en;
endmodule
//3x8 decoder using 2x4 decoder
module decoder3x8(i,y);
input [2:0]i;
output [7:0]y;
decoder2x4  u1(~i[2],i[1:0],y[3:0]);
decoder2x4 u2(i[2],i[1:0],y[7:4]);
endmodule
