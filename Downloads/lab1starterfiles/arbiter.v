module arbiter (
    input wire[7:0] in,
    output reg[7:0] out
);
    always @ (*) begin
            casex (in)
                8'b00000000: out = 8'b00000000;
                8'bxxxxxxx1: out = 8'b00000001;
                8'bxxxxxx1x: out = 8'b00000010;
                8'bxxxxx1xx: out = 8'b00000100;
                8'bxxxx1xxx: out = 8'b00001000;
                8'bxxx1xxxx: out = 8'b00010000;
                8'bxx1xxxxx: out = 8'b00100000;
                8'bx1xxxxxx: out = 8'b01000000;
                8'b1xxxxxxx: out = 8'b10000000;
                
                default: out = 8'b00000000;//case c
            endcase
            
     end
endmodule
