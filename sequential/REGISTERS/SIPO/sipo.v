//SERIAL-IN-PARALLEL-OUT 
module sipo(clk,rst,in,out);
parameter WIDTH=4;
input clk,rst,in;
output reg [WIDTH-1:0]out; 
always@(posedge clk) begin
if(rst) 
out<=4'b0000;
else 
out<={in,out[3:1]};
end
endmodule

