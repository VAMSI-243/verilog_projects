module tb;
parameter N = 8;
reg  [N-1:0] a,b;
reg  [3:0] opcode;

wire [N-1:0] result;
wire [2*N-1:0] product;
wire carry,zero,sign,overflow;

alu  dut(
    .a(a),
    .b(b),
    .opcode(opcode),
    .result(result),
    .carry(carry),
    .zero(zero),
    .sign(sign),
    .overflow(overflow),
    .product(product)
);

initial begin

    
    $monitor("time=%0t,a=%b,b=%b  result=%b  product=%b   carry= %b      opcode=%0d     zero=%b    sign=%b   overflow= %b", $time,a,b,result,product,carry,opcode,zero,sign,overflow);

    // ADD
    a=127; b=1; opcode=4'b0000; #10;

    // SUB
    a=128; b=2; opcode=4'b0001; #10;

    // MUL
    a=12; b=10; opcode=4'b0010; #10;

    // DIV
    a=100; b=5; opcode=4'b0011; #10;

    // MOD
    a=100; b=7; opcode=4'b0100; #10;

    // XOR
    a=8'hAA; b=8'hCC; opcode=4'b0101; #10;

    // NOT
    a=8'hF0; b=0; opcode=4'b0110; #10;

    // AND
    a=8'hAA; b=8'hCC; opcode=4'b0111; #10;

    // OR
    a=8'hAA; b=8'hCC; opcode=4'b1000; #10;

    // LEFT SHIFT
    a=8'b10000001; opcode=4'b1001; #10;

    // RIGHT SHIFT
    a=8'b10000001; opcode=4'b1010; #10;

    // INC
    a=8'd255; opcode=4'b1011; #10;

    // DEC
    a=8'd0; opcode=4'b1100; #10;

    // EQUAL
    a=25; b=25; opcode=4'b1101; #10;

    // LESS_EQ
    a=20; b=25; opcode=4'b1110; #10;

    $finish;
end

endmodule
