module length_finder (
    input wire [63:0] string,
    output wire [3:0] length
);

    // wire declarations
    wire [7:0] is_character_null;
    wire [7:0] arbiter_out;

    // is_character_null logic (8 lines of it!)
    assign is_character_null[0] = ~|string[7:0];
    assign is_character_null[1] = ~|string[15:8];
    assign is_character_null[2] = ~|string[23:16];
    assign is_character_null[3] = ~|string[31:24];
    assign is_character_null[4] = ~|string[39:32];
    assign is_character_null[5] = ~|string[47:40];
    assign is_character_null[6] = ~|string[55:48];
    assign is_character_null[7] = ~|string[63:56];

    // arbiter
    arbiter arbiter_inst (
        .in(is_character_null),
        .out(arbiter_out)
    );

    // encoder
    encoder encoder_inst (
        .in(arbiter_out),
        .out(length[2:0])
    );

    assign length[3] = (is_character_null == 8'b00000000);

endmodule

