module ring_counter(clk,rst,count);
parameter WIDTH=3;
input clk,rst;
output reg [WIDTH-1:0]count;
always@(posedge clk) begin
if(rst)
count<=3'b001;
else
count<={count[0],count[2:1]};
end
endmodule
