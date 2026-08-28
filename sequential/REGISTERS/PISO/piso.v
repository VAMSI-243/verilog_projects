
module piso(clk,rst,in,load,out);
parameter WIDTH=4;
input clk,rst,load;
input [WIDTH-1:0]in;
output reg out; 
reg [3:0]q;
always@(posedge clk) begin
if(rst) begin
q<=4'b0000;
out<=1'b0;
end
else if(load)
q<=in;
else begin
q<={q[2:0],1'b0}; //left shift
out<=q[3];
end
end
endmodule



