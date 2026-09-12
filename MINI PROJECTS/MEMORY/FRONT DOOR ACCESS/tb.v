`timescale 1ns/1ps
module tb;
parameter WIDTH=8;
parameter SIZE=2**6;
parameter DEPTH=SIZE/WIDTH;
parameter ADDR_WIDTH=$clog2(DEPTH);
integer i;
reg clk,rst;
reg [ADDR_WIDTH-1:0]addr;
reg [WIDTH-1:0]wdata;
wire [WIDTH-1:0]rdata;
reg wr_rd;
reg valid;
wire ready;
memory dut(clk,rst,addr,wdata,rdata,wr_rd,valid,ready);

initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
reset_memory();
write_memory_fd(0,DEPTH);
read_memory_fd(0,DEPTH);
#50;
$finish;
end
task reset_memory();
begin
rst=1;
repeat(2) @(posedge clk);
rst=0;
end
endtask
task write_memory_fd(input reg [ADDR_WIDTH-1:0]start_mem,input reg [ADDR_WIDTH:0]num_writes);
begin
for(i=start_mem;i<start_mem+num_writes;i=i+1) begin
@(posedge clk);
valid=1;
addr=i;
wdata=$random;
wr_rd=1;
wait(ready==1);
end
@(posedge clk);
valid=0;
end
endtask

task read_memory_fd(input reg [ADDR_WIDTH-1:0]start_mem,input reg [ADDR_WIDTH:0]num_reads);
begin
for(i=start_mem;i<start_mem+num_reads;i=i+1) begin
@(posedge clk);
valid=1;
addr=i;
wr_rd=0;
wait(ready==1);
end
@(posedge clk);
valid=0;
end
endtask
endmodule
