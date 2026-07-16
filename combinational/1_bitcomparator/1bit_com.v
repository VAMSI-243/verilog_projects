module bit_1com(a,b,l,e,g);
input a,b;
output  l,e,g;
/*assign l=a<b; //data flow
assign e=a==b;
assign g=a>b;*/
/*always @(*) begin
l=a<b;
e=a==b;    //behavioural
g=a>b;
end*/
not g1(a1,a);
not g2(b1,b);  //structural
and g3(l,a1,b);
xnor g4(e,a,b);
and g5(g,a,b1);
endmodule
