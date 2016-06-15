`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:41 11/19/2015 
// Design Name: 
// Module Name:    Mux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux5Bit(
				input [4:0]in1, 
				input [4:0]in2,
				input selector,
				output reg [4:0]out
    );
reg [4:0]auxOutMux;
always @(*)
	begin		
		out = selector? in2 : in1;
	end
endmodule
