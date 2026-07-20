//structural modelling
module mux2_1(i,s,y);       
input [1:0]i;
input s;
output y;
assign y=s?i[1]:i[0];
endmodule


module mux4_1(i,s1,s0,y);
input [3:0]i;
input s1,s0;
output y;
mux2_1 u1(.i(i[1:0]),.s(s0),.y(y0));
mux2_1 u2(.i(i[3:2]),.s(s0),.y(y1));
mux2_1 u3(.i({y1,y0}),.s(s1),.y(y));
endmodule

//dataflow style
module mux4_1(i,s,y);
input [3:0]i;
input [1:0]s;               
output  y;
assign y=(s[1]?(s[0]?i[3]:i[2]):(s[0]?i[1]:i[0]));

endmodule
//behavioural style using if condition
module mux4_1(i,s,y);
input [3:0]i;
input [1:0]s;
output reg y;
always @(*)    begin
if(s==2'b00)        y=i[0];
else if (s==2'b01)  y=i[1];
else if (s==2'b10)  y=i[2];
else if (s==2'b11)  y=i[3];
else y=1'bx;
end
endmodule 
  // behavioural style using case statement
module mux4_1(i,s,y);
input [3:0]i;
input [1:0]s;
output reg y;
always @(*)
begin
case(s)
2'b00:y=i[0];
2'b01:y=i[1];
2'b10:y=i[2];
2'b11:y=i[3];
default: y=1'bx;
endcase
end
endmodule

//mux4x_1 using  boolean expression
module mux4_1(i,s1,s0,y);
input [3:0]i;
input s1,s0;
output y;
assign y=((~s1&~s0&i[0])|(~s1&s0&i[1])|(s1&~s0&i[2])|(s1&s0&i[3]));
endmodule

