//LFSR

module LFSR(
   output [7:0] out,  // Output of the counter
	input clk,  // clock input
	input reset              // reset input
	);
  
  wire linear_feedback;
  
  assign linear_feedback =  ! (out[7] ^ out[3]);
  
  always @(posedge clk)
  if (reset) begin // active high reset
    out <= 8'b0 ;
  end else begin
    out <= {out[6],out[5],
				out[4],out[3],
            out[2],out[1],
            out[0], linear_feedback};
  end 
  
 endmodule // End Of Module counter