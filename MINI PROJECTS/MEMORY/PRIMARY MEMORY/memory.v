module memory(clk,rst,addr,wdata,rdata,wr_rd,valid,ready);
parameter WIDTH=8;
parameter SIZE=8192;
parameter DEPTH=SIZE/WIDTH;
parameter ADDR_WIDTH=$clog2(DEPTH);
integer i;
input clk,rst;
input [ADDR_WIDTH-1:0]addr;
input [WIDTH-1:0]wdata;
output reg [WIDTH-1:0]rdata;
input wr_rd;
input valid;
output reg ready;
reg [WIDTH-1:0]mem[DEPTH-1:0];



always@(posedge clk) begin
if(rst) begin
ready=0;
rdata=0;
   for(i=0;i<DEPTH;i=i+1) 
   mem[i]=0;
   end
else begin
   if(valid) begin
   ready=1;
      if(wr_rd) 
      mem[addr]=wdata;
      else 
      rdata=mem[addr]; 
	  end
   else 
   ready=0;
end
end
endmodule
