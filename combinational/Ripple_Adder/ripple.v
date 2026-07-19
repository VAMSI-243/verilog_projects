/*module ripple_adder(a,b,cin,sum,cout);
parameter N=8;
input [N-1:0]a,b;
input cin;
output [N-1:0]sum;
output cout;
assign {cout,sum}=a+b+cin;
endmodule */
 
//ripple adder using full adder
/*module full_adder(a,b,cin,sum,cout);
input a,b, cin;   
output sum, cout;
assign {cout,sum}=a+b+cin;
endmodule
module ripple_adder(a,b,cin,sum,cout);
parameter N=8;
input [N-1:0]a,b;
input cin;
output [N-1:0]sum;
output cout;
wire c0,c1,c2,c3,c4,c5,c6;
full_adder u0(a[0],b[0],cin,sum[0],c0);
full_adder u1(a[1],b[1],c0,sum[1],c1);
full_adder u2(a[2],b[2],c1,sum[2],c2);
full_adder u3(a[3],b[3],c2,sum[3],c3);
full_adder u4(a[4],b[4],c3,sum[4],c4);
full_adder u5(a[5],b[5],c4,sum[5],c5);
full_adder u6(a[6],b[6],c5,sum[6],c6);
full_adder u7(a[7],b[7],c6,sum[7],cout);
endmodule
*/

//ripple adder using genvar

module full_adder(a,b,cin,sum,cout);
input a,b, cin;   
output sum, cout;
assign {cout,sum}=a+b+cin;
endmodule
module ripple_adder(a,b,cin,sum,cout);
parameter N=8;
input [N-1:0]a,b;
input cin;
output [N-1:0]sum;
output cout;
wire [N:0] c;
genvar i;
for(i=0;i<N;i=i+1) begin
full_adder u0(a[i],b[i],c[i],sum[i],c[i+1]);
end
assign c[0]=cin;
assign cout=c[N];
endmodule 


