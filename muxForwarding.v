`timescale 1ns / 1ps

module muxForwarding(
				input [31:0]in1, 
				input [31:0]in2,
				input [31:0]in3,
				input [1:0]selector,
				output reg [31:0]out
    );
	 
always @(*)
	begin		
		if (selector[1] == 1)
			out = in3;
			else if (selector[0] == 1)
				out = in2;
		else 
			out = in1;
	end

endmodule
