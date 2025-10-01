module hasher (
   input wire[63:0] data,
   input wire[3:0] data_len,
   output wire[31:0] hash
);

	// DO IT GORDON
	wire [31:0] zero, one, two, three, four, five, six, seven;
	wire [31:0] final_state;
	
	// hash_round
    hash_round #(.ROUND(0)) hash_round_0 (
        .in_byte (data[7:0]),
        .in_state (32'h55555555),
        .out_state (zero)           
    );
	hash_round #(.ROUND(1)) hash_round_1 (
        .in_byte (data[15:8]),
        .in_state (32'hAAAAAAAA),
        .out_state (one)           
    );
    hash_round #(.ROUND(2)) hash_round_2 (
        .in_byte (data[23:16]),
        .in_state (zero),
        .out_state (two)           
    );
    hash_round #(.ROUND(3)) hash_round_3 (
        .in_byte (data[31:24]),
        .in_state (one),
        .out_state (three)           
    );
    hash_round #(.ROUND(4)) hash_round_4 (
        .in_byte (data[39:32]),
        .in_state (two),
        .out_state (four)           
    );
    hash_round #(.ROUND(5)) hash_round_5 (
        .in_byte (data[47:40]),
        .in_state (three),
        .out_state (five)           
    );
    hash_round #(.ROUND(6)) hash_round_6 (
        .in_byte (data[55:48]),
        .in_state (four),
        .out_state (six)           
    );
    hash_round #(.ROUND(7)) hash_round_7 (
        .in_byte (data[63:56]),
        .in_state (five),
        .out_state (seven)           
    );
    
    assign final_state = six | seven;
    
    // Rotator
    rotator #(.WIDTH(32)) rot_inst (
        .in (final_state),
        .out (hash),
        .distance ({3'b000, final_state[4:0]}),       
        .direction(|data_len)       
    );
    
endmodule

