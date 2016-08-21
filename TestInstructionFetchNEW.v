`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:34:52 08/21/2016
// Design Name:   InstructionFetchNEW
// Module Name:   E:/mips/MIPS/TestInstructionFetchNEW.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionFetchNEW
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestInstructionFetchNEW;

	// Inputs
	reg clk;
	reg reset;
	reg [5:0] opcjump;
	reg hazardFlag;
	reg branchFlag;
	reg [9:0] branchPC;
	reg [9:0] jumpPC;

	// Outputs
	wire [31:0] Instruction;
	wire [9:0] PC;

	// Instantiate the Unit Under Test (UUT)
	InstructionFetchNEW uut (
		.clk(clk), 
		.reset(reset), 
		.opcjump(opcjump), 
		.hazardFlag(hazardFlag), 
		.branchFlag(branchFlag), 
		.branchPC(branchPC), 
		.jumpPC(jumpPC), 
		.Instruction(Instruction), 
		.PC(PC)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		opcjump = 0;
		hazardFlag = 0;
		branchFlag = 0;
		branchPC = 0;
		jumpPC = 0;

		// Wait 100 ns for global reset to finish
		#125;
		reset = 0;
	end
	
	initial begin
		forever #50 clk = ~clk;
	end
      
endmodule

