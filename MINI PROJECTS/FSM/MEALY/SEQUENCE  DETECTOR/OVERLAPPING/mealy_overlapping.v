//MEALY  1011  SEQUENCE OVERLAPPING
module mealy_1011(clk,rst,din,dout);
input clk,rst;
input din;
output dout;
parameter s0=4'b0001;
parameter s1=4'b0010;
parameter s2=4'b0100;
parameter s3=4'b1000;
reg [3:0]p_state,n_state;

//=========================================
//state register logic
//=========================================
always@(posedge clk)begin
	if(rst)
		p_state<=s0;
	else
		p_state<=n_state;
end
//=========================================
//next state logic
//=========================================

always@(*)begin
	case(p_state)
	s0:if(din)
		n_state=s1;
	else
		n_state=s0;
	s1:if(din)
		n_state=s1;
	else
		n_state=s2;
	s2:if(din)
		n_state=s3;
	else
		n_state=s0;
	s3:if(din)
		n_state=s1;
	else
		n_state=s2;
	default:n_state=s0;
endcase
end
///////////////////////////////////////
//output logic
//////////////////////////////////////
assign dout=((p_state==s3)&& (din))?1:0;
endmodule

