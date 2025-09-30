module arbiter_tb ();
    reg [7:0] in;
    reg [7:0] expected;
    wire [7:0] out;
    arbiter dut (.in(in), .out(out));

    initial begin
        // Basic test case #1
        in = 8'b00000110;
        expected = 8'b00000010;
        #5
        $display("%b -> %b, expected %b", in, out, expected);

        // Basic test case #2
        in = 8'b00100000;
        expected = 8'b00100000;
        #5
        $display("%b -> %b, expected %b", in, out, expected);

        // Add more test cases here
        //student test case 1
        in = 8'b0001100;
        expected = 8'b0000100;
        #5
        $display("%b -> %b, expected %b", in, out, expected);
        
        //student test case 2
        in = 8'b00000000;
        expected = 8'b0000000;
        #5
        $display("%b -> %b, expected %b", in, out, expected);
        
        //student test case 3
        in = 8'b1101110;
        expected = 8'b0000010;
        #5
        $display("%b -> %b, expected %b", in, out, expected);

    end

endmodule
