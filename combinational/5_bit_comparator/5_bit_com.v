//5 bit comparator using 2 bit com
module bit_2com(a,b,l,e,g);
input [1:0]a,b;
output   l,e,g;
assign l=((a[1]<b[1])|(~(a[1]^b[1])&a[0]<b[0]));
assign e=(~(a[1]^b[1])&~(a[0]^b[0]));
assign g=((a[1]>b[1])|(~(a[1]^b[1])&a[0]>b[0]));
endmodule
module bit_5com(a,b,l,e,g);
input [4:0]a,b;
output l,e,g;
bit_2com u1(a[4:3],b[4:3],l1,e1,g1);
bit_2com u2(a[2:1],b[2:1],l2,e2,g2);
bit_2com u3({a[0],1'b0},{b[0],1'b0},l3,e3,g3);
assign g =g1|(e1&g2)|(e1&e2&g3);
assign e=e1&e2&e3;
assign l=l1|(e1&l2)|(e1&e2&l3);
endmodule
