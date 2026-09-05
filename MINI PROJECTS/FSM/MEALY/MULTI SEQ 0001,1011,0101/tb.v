`timescale 1ns/1ps
module tb;
reg clk,rst;
reg din;
wire  dout;
multi_seq_mealy dut(clk,rst,din,dout);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin

din=0;
rst=1;
#10;
rst=0;
 repeat(100)begin
  @(posedge clk);
  din=$random;
  end
#10 $finish;
end
endmodule





