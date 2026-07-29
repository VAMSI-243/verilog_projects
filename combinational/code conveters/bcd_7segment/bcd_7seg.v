/*module bcd_7seg(d,y);
input [3:0]d;
output  [6:0]y;
assign y=d==0?7'b1111110:d==1?7'b0110000:d==2?7'b1101101:d==3?7'b1111001:d==4?7'b0110011:d==5?7'b1011011:d==6?7'b1011111:d==7?7'b1110000:d==8?7'b1111111:d==9?7'b1111011:7'bxxxxxxx;
endmodule
*/
module bcd_7seg(d,y);
input [3:0]d;
output reg [6:0]y;
always @(*) begin
case(d)
4'd0:y=7'b1111110;
4'd1:y=7'b0110000;
4'd2:y=7'b1101101;
4'd3:y=7'b1111001;
4'd4:y=7'b0110011;
4'd5:y=7'b1011011;
4'd6:y=7'b1011111;
4'd7:y=7'b1110000;
4'd8:y=7'b1111111;
4'd9:y=7'b1111011;
default :y=7'bxxxxxxx;
endcase
end
endmodule
