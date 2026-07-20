//behavioural style using case statement
module mux8_1(i,s,y);
input [7:0]i;
input [2:0]s;
output reg y;
always @(*)
begin
case(s)
3'b000:y=i[0];
3'b001:y=i[1];
3'b010:y=i[2];
3'b011:y=i[3];
3'b100:y=i[4];
3'b101:y=i[5];
3'b110:y=i[6];
3'b111:y=i[7];
default: y=1'bx;
endcase
end
endmodule

//structural modelling using mux_4x1
module mux4x1(i,s,y);
input [3:0]i;
input [1:0]s;
output y;
assign y=(s[1]?(s[0]?i[3]:i[2]):(s[0]?i[1]:i[0]));
endmodule
module mux8_1(i,s,y);
input [7:0]i;
input [2:0]s;
output  y;
wire w1,w2;
mux4x1 m1(.i(i[3:0]),.s(s[1:0]),.y(w1));
mux4x1 m2(.i(i[7:4]),.s(s[1:0]),.y(w2));
mux4x1 m3(.i({2'b00, w2,w1}),.s({1'b0,s[2]}),.y(y));
endmodule

//structural modelling using mux_4x1 and mux_2x1
module mux2x1(i,s,y);
input [1:0]i;
input s;
output y;
assign y=s?i[1]:i[0];
endmodule
module mux4x1(i,s,y);
input [3:0]i;
input [1:0]s;
output y;
assign y=(s[1]?(s[0]?i[3]:i[2]):(s[0]?i[1]:i[0]));
endmodule
module mux8_1(i,s,y);
input [7:0]i;
input [2:0]s;
output y;
mux4x1 u1(i[3:0],s[1:0],y1);
mux4x1 u2(i[7:4],s[1:0],y2);
mux2x1 u3 ({y2,y1},s[2],y);
endmodule

//gate level modelling 
module mux8_1(i,s,y);
input [7:0]i;
input [2:0]s;
output y;
assign y=i[0]&~s[2]&~s[1]&~s[0]|i[1]&~s[2]&~s[1]&s[0]|i[2]&~s[2]&s[1]&~s[0]|i[3]&~s[2]&s[1]&s[0]|i[4]&s[2]&~s[1]&~s[0]|i[5]&s[2]&~s[1]&s[0]|i[6]&s[2]&s[1]&~s[0]|i[7]&s[2]&s[1]&s[0];
endmodule
