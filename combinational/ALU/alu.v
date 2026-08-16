module alu(a,b,opcode,result,carry,product,overflow,zero,sign);
parameter N=8;
parameter ADD = 4'b0000;
parameter SUB = 4'b0001;
parameter MUL = 4'b0010;
parameter DIV = 4'b0011;
parameter MOD = 4'b0100;
parameter XOR = 4'b0101;
parameter NOT = 4'b0110;
parameter AND = 4'b0111;
parameter OR = 4'b1000;
parameter LEFT_SHIFT = 4'b1001;
parameter RIGHT_SHIFT = 4'b1010;
parameter INC = 4'b1011;
parameter DEC = 4'b1100;
parameter EQUAL = 4'b1101;
parameter LESS_EQ = 4'b1110;

input [N-1:0]a,b;
input [3:0]opcode;
output reg [N-1:0]result;
output reg[2*N-1:0]product;
output reg carry;
output zero;
output reg overflow;
output sign;

reg[N:0]tmp;

always@(*)begin
result=0;
product=0;
carry=0;
overflow=0;
tmp=0;
case(opcode)
ADD:begin
tmp=a+b;
result=tmp[N-1:0];
carry=tmp[N];
overflow=(~(a[N-1]^b[N-1])) & (a[N-1]^result[N-1]);
end
SUB:begin
tmp=a-b;
result=tmp[N-1:0];
carry=tmp[N];
overflow=(a[N-1]^b[N-1]) & (a[N-1]^result[N-1]);
end
MUL:begin
product=a*b;
result=product[N-1:0];
carry=|product[2*N-1:N];
overflow=|product[2*N-1:N];
end
DIV:begin
if(b!=0)
result=a/b;
else
result=0;
end
MOD:begin
if(b!=0)
result=a%b;
else
result=0;
end
XOR:begin
result=a^b;
end
NOT:begin
result=~a;
end
AND:begin
result=a&b;
end
OR:begin
result=a|b;
end
LEFT_SHIFT:begin
result=a<<1;
carry=a[N-1];
end
RIGHT_SHIFT:begin
result=a>>1;
carry=a[0];
end
INC:begin
tmp=a+1;
result=tmp[N-1:0];
carry=tmp[N];
overflow=(a=={1'b0,{(N-1){1'b1}}});
end
DEC:begin
tmp=a-1;
result=tmp[N-1:0];
carry=(a!=0);
overflow=(a=={1'b1,{(N-1){1'b0}}});
end
EQUAL:begin
result=(a==b)?1:0;
end
LESS_EQ:begin
result=(a<=b)?1:0;
end
default:begin
result=0;
product=0;
carry=0;
overflow=0;
end
endcase
end
assign zero=(result==0);
assign sign=result[N-1];
endmodule


