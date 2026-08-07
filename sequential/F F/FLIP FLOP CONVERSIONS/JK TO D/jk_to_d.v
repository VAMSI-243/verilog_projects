//D FLIP FLOP USING JK FF
module jkff(clk,rst,j,k,q);
input clk,rst,j,k;
output reg q;
always @(posedge clk) begin
if(rst) q<=0;
else 
case ({j,k})
2'b00:q<=q;
2'b01:q<=0;
2'b10:q<=1;
2'b11:q<=~q;
default:q<=1'bx;
endcase
end
endmodule

module dff(clk,rst,d,q);
input clk,rst,d;
output q;
jkff u0(clk,rst,d,~d,q);
endmodule

