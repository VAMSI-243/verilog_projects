module bit_1com(a,b,l,e,g);
input a,b;
output  l,e,g;  //l=A less than B , e=A equal to B , g=A greater than B;
assign l=a<b; 
assign e=a==b;
assign g=a>b;
endmodule
