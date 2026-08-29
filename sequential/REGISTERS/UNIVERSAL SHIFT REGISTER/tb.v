module tb;

reg clk;
reg reset;
reg [1:0] sel;
reg serial_right;
reg serial_left;
reg [3:0] parallel_in;
wire [3:0] q;

universal_shift_register dut (clk,reset,sel,serial_right,serial_left,parallel_in,q);
    
// Clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    sel = 2'b00;
    serial_right = 0;
    serial_left = 0;
    parallel_in = 4'b0000;

    #10;
    reset = 0;

    // Parallel Load
    sel = 2'b11;
    parallel_in = 4'b1010;
    #10;

    // Shift Right
    sel = 2'b01;
    serial_left = 1;
    #10;

    // Shift Right again
    serial_left = 0;
    #10;

    // Shift Left
    sel = 2'b10;
    serial_right = 1;
    #10;

    // Hold
    sel = 2'b00;
    #10;

    $finish;
end

initial begin
    $monitor("Time=%0t reset=%b sel=%b parallel_in=%b serial_left=%b serial_right=%b q=%b",
             $time, reset, sel, parallel_in, serial_left, serial_right, q);
end

endmodule
