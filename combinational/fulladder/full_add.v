//full_adder using data flow
module full_adder(a,b,cin,sum,cout);
input a,b, cin;  
output sum, cout;
assign {cout,sum}=a+b+cin;
endmodule

// full adder using behavioural
/*module full_adder(a,b,cin,sum,cout);
input a,b, cin;
output  reg sum;
output reg cout;
always @(*) begin
sum=a^b^cin;
cout=a&b|b&cin|cin&a;
end
endmodule*/

// full adder using structural by logic gates
/*module full_adder(a,b,cin,sum,cout);
input a,b;
input cin;
output sum,cout;
wire w1,w2,w3;
xor(w1,a,b);
xor(sum,w1,cin);
and(w2,a,b);
and(w3,w1,cin);
or(cout,w2,w3);
endmodule
*/

