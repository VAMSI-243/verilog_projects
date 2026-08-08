module jkff(clk,rst,j,k,q);
input clk,rst,j,k;
output reg q;
always @(posedge clk) begin
	if(rst)
		q<=0;
	else begin
		case ({j,k})
			2'b00:q<=q;
			2'b01:q<=0;
			2'b10:q<=1;
			2'b11:q<=~q;
			default:q<=1'bx;
		endcase
		end
end
endmodule
 
 module srff(clk,s,r,q);
 input clk,s,r;
 output q;
 jkff u0(clk,1'b0,s,r,q);
 endmodule
