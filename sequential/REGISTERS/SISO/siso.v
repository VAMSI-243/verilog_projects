//serial-in-serial-out
module siso(clk,rst,in,out);
input clk,rst,in;
output reg out; 
reg [3:0]q;
always@(posedge clk) begin
if(rst) begin
q<=4'b0000;
out<=0;
end
else begin
q<={in,q[3:1]};
out<=q[0];
end
end
endmodule
