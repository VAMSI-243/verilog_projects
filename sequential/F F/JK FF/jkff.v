module jkff(clk,rst,j,k,q);
input clk,rst,j,k;
output reg q;
always@(posedge clk) begin
if(rst) begin
q<=0;
end
else
case({j,k})
2'b00:q<=q;
2'b01:q<=0;
2'b10:q<=1;
default:q<=~q;
endcase
end
endmodule

