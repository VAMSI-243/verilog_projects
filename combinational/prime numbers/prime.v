module prime;
integer N;
integer i,j;
integer prime;
initial begin
$value$plusargs("N=%0d",N);
for(i=2;i<N;i=i+1) begin
prime=1;
for(j=2;j<i;j=j+1)begin
if(i%j==0)
prime=0;
end
if(prime==1)
$display("prime=%d",i);
end
$finish;
end
endmodule


