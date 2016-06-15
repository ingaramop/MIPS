`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:20:26 11/23/2015
// Design Name:   Pipeline
// Module Name:   E:/ID funca/Intruction-Decode/Intruction-Decode/PipelineTest1.v
// Project Name:  Intruction-Decode
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PipelineTest1;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		clk = 1;
		#100;
        
		// Add stimulus here

	end
      
endmodule

