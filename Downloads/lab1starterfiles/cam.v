module cam (
    input wire[3:0] data_len,
    input wire[63:0] data,
    output wire valid,
    output wire[2:0] addr
    
);
	// wire declarations
    wire[67:0] data_word;
    wire[7:0] entry_matches;
    
	// data concatenation
	assign data_word = {data_len, data};
	
	// 8 equality comparisons
	assign entry_matches[0] = (data_word == 68'h300000000004F454C);
	assign entry_matches[1] = (data_word == 68'h50000004E4F524141);
	assign entry_matches[2] = (data_word == 68'h5000000594C4C4F48);
	assign entry_matches[3] = (data_word == 68'h50000004449564144);
	assign entry_matches[4] = (data_word == 68'h60000455249414C43);
	assign entry_matches[5] = (data_word == 68'h50000004B4E415246);
	assign entry_matches[6] = (data_word == 68'h500000045434E414C);
	assign entry_matches[7] = (data_word == 68'h4000000004E415952);
	
	// encoder instantiation
	encoder encoder_inst (
	   .in(entry_matches),
	   .out(addr)
	);
	
	// valid logic
	assign valid = |entry_matches;
	
endmodule
