`timescale 1ns/1ps
module tb;
parameter WIDTH=8;
parameter SIZE=2**13;
parameter DEPTH=SIZE/WIDTH;
parameter ADDR_WIDTH=$clog2(DEPTH);
integer i;
reg clk,rst;
reg [ADDR_WIDTH-1:0]addr;
reg [WIDTH-1:0]wdata;
wire [WIDTH-1:0]rdata;
reg wr_rd;
reg valid;
wire  ready;
memory dut(clk,rst,addr,wdata,rdata,wr_rd,valid,ready);
initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin
reset ();
write_data ();
read_data ();
#200 $finish;
end


task reset ();
begin
rst=1;
repeat(2) @(posedge clk);
rst=0;
end
endtask

task write_data ();
begin
for(i=0;i<DEPTH;i=i+1) begin
@(posedge clk);
valid=1;
addr=i;
wdata=$random;
wr_rd=1;
wait(ready==1);
end
@(posedge clk);
valid=0;
addr=0;
wdata=0;
wr_rd=0;
end
endtask


task read_data ();
begin
for(i=0;i<DEPTH;i=i+1) begin
@(posedge clk);
valid=1;
addr=i;
wr_rd=0;
wait(ready==1);
end
@(posedge clk);
valid=0;
addr=0;
end
endtask
endmodule
