module rotator #(parameter WIDTH = 8) (
    input wire[WIDTH-1:0] in,
    output wire[WIDTH-1:0] out,
    input wire[7:0] distance,
    input wire direction  
);

	// Declarations
	wire [2*WIDTH-1:0] double_in;
	wire [2*WIDTH-1:0] double_left;
	wire [2*WIDTH-1:0] double_right;
	wire [WIDTH-1:0] left;
	wire [WIDTH-1:0] right;
	
	// Rotating logic
	assign double_in = {in, in};
	assign double_left = double_in << distance;
	assign double_right = double_in >> distance;
	assign left = double_left[2*WIDTH-1:WIDTH];
	assign right = double_right[WIDTH-1:0];
	
	
	// Output mux logic
	assign out = direction ? left : right;
	
endmodule
