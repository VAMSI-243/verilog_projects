module buf_gate(input a,output y);
buf (y,a);
endmodule

module not_gate(input a,output y);
not (y,a);
endmodule

module and_gate(input a,b,output y);
and g1(y,a,b);
endmodule

module or_gate(input a,b,output y);
or (y,a,b);
endmodule

module nor_gate(input a,b,output y);
nor (y,a,b);
endmodule

module nand_gate(input a,b,output y);
nand (y,a,b);
endmodule

module xor_gate(input a,b,output y);
xor (y,a,b);
endmodule

module xnor_gate(input a,b,output y);
xnor (y,a,b);
endmodule


