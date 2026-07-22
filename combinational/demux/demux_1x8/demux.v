//implement 1x8 demux using 1x2 demux
module demux1x2(i,en,s,y);
input en,i,s;
output [1:0]y;
assign y[0]=en&i&~s;
assign y[1]=en&i&s;
endmodule

module demux1x8(i,s,y); 
input i;
input [2:0]s;
output [7:0]y;
demux1x2 u1(i,1'b1,s[2],{n2,n1});
demux1x2 u2(i,n1,s[1],{n4,n3});
demux1x2 u3(i,n2,s[1],{n6,n5});
demux1x2 u4(i,n3,s[0],y[1:0]);
demux1x2 u5(i,n4,s[0],y[3:2]);
demux1x2 u6(i,n5,s[0],y[5:4]);
demux1x2 u7(i,n6,s[0],y[7:6]);
endmodule

//implement 1x8 demux
module demux1x8(
    input i,
    input [2:0] s,
    output reg [7:0] y);

always @(*) begin
    y = 8'b0;
    y[s] = i;
end
endmodule

//implement 1x8 demux using 1x4 demux
module demux1x4(en,i,s,y);
input en,i;
input [1:0]s;
output [3:0]y;
assign y[0]=en&i&~s[1]&~s[0];
assign y[1]=en&i&~s[1]&s[0];
assign y[2]=en&i&s[1]&~s[0];
assign y[3]=en&i&s[1]&s[0];
endmodule

module demux1x8(i,s,y);
input i;
input [2:0]s;
output [7:0]y;
demux1x4 u1(~s[2],i,s[1:0],y[3:0]);
demux1x4 u2(s[2],i,s[1:0],y[7:4]);
endmodule


