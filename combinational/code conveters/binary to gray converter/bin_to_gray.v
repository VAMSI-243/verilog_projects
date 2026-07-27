module bin_to_gray(b,g);
parameter WIDTH=4;
input [WIDTH-1:0]b;
output [WIDTH-1:0]g;
//assign g=b^(b>>1);
assign g[3]=b[3];
assign g[2]=b[3]^b[2];
assign g[1]=b[2]^b[1];
assign g[0]=b[1]^b[0];
endmodule


