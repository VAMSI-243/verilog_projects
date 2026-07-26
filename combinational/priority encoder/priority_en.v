//LSB priority encoder
module encod(i,y,v);
input [3:0]i;
output reg [1:0]y;
output reg v;
always @(*) begin
v=1'b1;
casex(i)
4'bxxx1:y=2'b00;
4'bxx10:y=2'b01;
4'bx100:y=2'b10;
4'b1000:y=2'b11;
default: begin
v=1'b0;
y=2'b00;
end
endcase
end
endmodule

// MSB priority encoder
module encod(i,y,v);
input [3:0]i;
output reg [1:0]y;
output reg v;
always @(*) begin
v=1'b1;
casex(i)
4'b0001:y=2'b00;
4'b001x:y=2'b01;
4'b01xx:y=2'b10;
4'b1xxx:y=2'b11;
default: begin
y=2'bxx;
v=1'b0;
end
endcase
end
endmodule

