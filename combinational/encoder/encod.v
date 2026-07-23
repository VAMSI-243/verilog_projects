 //Behavioural model
module encod(i,y);
input [3:0]i;
output reg [1:0]y;
always @(*) begin              
case(i)
4'b0001:y=2'b00;
4'b0010:y=2'b01;
4'b0100:y=2'b10;
4'b1000:y=2'b11;
default:y=2'bxx;
endcase
end
endmodule


//dataflow model
module encod(i,y);
input [3:0]i;
output  [1:0]y;
//assign y[1]=i[2]|i[3];
//assign y[0]=i[1]|i[3];
assign y=(i==4'b0001)?2'b00:(i==4'b0010)?2'b01:(i==4'b0100)?2'b10:(i==4'b1000)?2'b11:2'bxx;         
endmodule
