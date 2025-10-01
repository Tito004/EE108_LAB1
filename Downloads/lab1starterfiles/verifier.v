module verifier (
    input wire [63:0] username,
    input wire [63:0] password,
    output wire valid
   
);

	// FINISH HIM
	//wire declarations
	//password end variables
	wire [3:0] pwd_len;
	wire [31:0] pwd_hasher_out;
	wire out;
	
	//username end variables 
	wire [3:0] usr_len;
	wire [2:0] addr;
	wire cam_valid; 
	wire [31:0] ROM_out;
	
	
	// password end work
    length_finder length_finder_inst (
        .string(password),
        .length(pwd_len)
    );

    
    hasher hasher_inst (
        .data_len(pwd_len),
        .data(password),
        .hash(pwd_hasher_out)
    );
    
    //username end work
    length_finder length_finder_inst_2 (
        .string(username),
        .length(usr_len)
    );
    
    cam cam_inst (
        .data_len(usr_len),
        .data(username),
        .addr(addr),
        .valid(cam_valid)
    );
    
    hash_rom rom_inst (
        .addr(addr),
        .data(ROM_out)
    );
    
    assign out = (pwd_hasher_out == ROM_out);
    assign valid = (out & cam_valid);

endmodule
