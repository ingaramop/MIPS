`timescale 1ns / 1ps

module Mux32Bit(
				input [31:0]in1, 
				input [31:0]in2,
				input selector,
				output reg [31:0]out
    );
always @(*)
	begin		
		out = selector? in2 : in1;
	end
endmodule
