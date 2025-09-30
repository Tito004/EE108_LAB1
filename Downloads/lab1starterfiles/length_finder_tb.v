module length_finder_tb ();

   reg [63:0] in;
   wire [3:0] len;
   
   length_finder dut (
      .string (in),
      .length (len)
   );
   
   initial begin
      in = 64'hAABBCCDDEEFFAA00;
      expected = 4'd0;
      #5
      $display("in=%h -> out=%d, expected=%d", in, out, expected);
      
      in = 64'hAABBCCDDEEFFAA99;
      expected = 4'd8;
      #5
      $display("in=%h -> out=%d, expected=%d", in, out, expected);
      
      in = 64'hAABBCCDDEEFF00AA;
      expected = 4'd1;
      #5
      $display("in=%h -> out=%d, expected=%d", in, out, expected);
      
      in = 64'hAABBCCDDEE00FFAA;
      expected = 4'd2;
      #5
      $display("in=%h -> out=%d, expected=%d", in, out, expected);
      
      in = 64'hAABBCC00EE00FFAA;
      expected = 4'd2;
      #5
      $display("in=%h -> out=%d, expected=%d", in, out, expected);
      
      in = 64'h00BBCCDDEE44FFAA;
      expected = 4'd7;
      #5
      $display("in=%h -> out=%d, expected=%d", in, out, expected);
      
      in = 64'h00BBCC00EE44FFAA;
      expected = 4'd3;
      #5
      $display("in=%h -> out=%d, expected=%d", in, out, expected);
      
      in = 64'h44BBC00DEE44FFAA;
      expected = 4'd4;
      #5
      $display("in=%h -> out=%d, expected=%d", in, out, expected);
      
      in = 0;
      expected = 4'd0;
      #5
      $display("in=%h -> out=%d, expected=%d", in, out, expected);
      
   end
   
endmodule
