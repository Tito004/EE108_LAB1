module hash_round #(
  parameter ROUND = 0
)(
  input  wire [7:0]  in_byte,
  input  wire [31:0] in_state,
  output wire [31:0] out_state
);   
  // Declarations
  wire [7:0] a, b, c, d;
  reg  [7:0] mix;
  wire [7:0] mixed_a;
  wire [7:0] rotated_mixed_a;	
	
  // State splitting
  assign {d, c, b, a} = in_state;
	
  // Mix function
  always @(*) begin
    if (ROUND <= 2)
      mix = (d & c) | (~d & b);
    else if (ROUND <= 4)
      mix = d ^ c ^ b;
    else
      mix = (d & b) | (c & ~b);
  end	

  assign mixed_a = a + in_byte + mix;
	
  // Rotator
  rotator #(.WIDTH(8)) rot_inst (
    .in (mixed_a),
    .out (rotated_mixed_a),
    .distance (ROUND),       
    .direction(1'b1)       
  );
	
  // Output state assignment
  assign out_state = {c, b, d, rotated_mixed_a};

endmodule
