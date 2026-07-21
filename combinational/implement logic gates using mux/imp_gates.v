module mux2x1(i0,i1,s,y);
input i0,i1,s;
output y;
assign y=s?i1:i0;
endmodule
//and gate using mux

module andgate(a,b,y);
input a,b;                   
output y;   
wire y1;      
mux2x1 g1(.i0(1'b0),.i1(1'b1),.s(a),.y(y1));
mux2x1 g2(.i0(1'b0),.i1(a),.s(b),.y(y));
endmodule
//or gate
module orgate(a,b,y);
input a,b;            
output y;
mux2x1 g1(.i0(1'b0),.i1(1'b1),.s(a),.y(y1));
mux2x1 ge(.i0(y1),.i1(1'b1),.s(b),.y(y));
endmodule
//nand gate
module nandgate(a,b,y);
input a,b;                    
output y;
mux2x1 g1(.i0(1'b1),.i1(1'b0),.s(a),.y(y1));
mux2x1 g2(.i0(1'b1),.i1(y1),.s(b),.y(y));
endmodule

//nor  gate
module norgate(a,b,y);
input a,b; 
output y;           
mux2x1 g1(.i0(1'b1),.i1(1'b0),.s(a),.y(y1));
mux2x1 g2(.i0(y1),.i1(1'b0),.s(b),.y(y));
endmodule 
//xor gate
module xorgate(a,b,y);
input a,b;
output y;
mux2x1 g1(.i0(1'b0),.i1(1'b1),.s(a),.y(y1));
mux2x1 g2(.i0(1'b1),.i1(1'b0),.s(a),.y(y2));
mux2x1 g3(.i0(y1),.i1(y2),.s(b),.y(y));
endmodule 
//xnor gate
module xnorgate(a,b,y);
input a,b;
output y;
mux2x1 g1(.i0(1'b0),.i1(1'b1),.s(a),.y(y1));
mux2x1 g2(.i0(1'b1),.i1(1'b0),.s(a),.y(y2));
mux2x1 g3(.i0(y2),.i1(y1),.s(b),.y(y));
endmodule 

