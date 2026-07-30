module d_latch(d,en,q);
input d,en;
output reg q;
always@(*) begin
if(en)
q=d;
else
q=q;
end
endmodule
