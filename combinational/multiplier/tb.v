module tb;
reg [3:0] a,b;
wire [7:0] p;
multiplier4x4 dut(a,b,p);
initial begin
    $monitor("A=%d B=%d Product=%d (%b)",a,b,p,p);
a=4'd3;b=4'd2;#10;
a=4'd15;b=4'd15;
end
endmodule
