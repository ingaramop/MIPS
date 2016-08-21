`timescale 1ns / 1ps

module Test_InstruccFetch;

	// Inputs
	reg clk;
	reg reset;
	reg [9:0] PCJump;
	reg [9:0] jumpAdd;
	reg PCSrc;
	reg writeIFID;
	reg jump;

	// Outputs
	wire [31:0] Instruction;
	wire [9:0] PCNextReg;

	// Instantiate the Unit Under Test (UUT)
	InstructionFetch uut (
		.clk(clk), 
		.reset(reset), 
		.PCJump(PCJump), 
		.jumpAdd(jumpAdd), 
		.PCSrc(PCSrc), 
		.writeIFID(writeIFID), 
		.jump(jump), 
		.Instruction(Instruction), 
		.PCNextReg(PCNextReg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		PCJump = 0;
		jumpAdd = 2;
		PCSrc = 0;
		writeIFID = 1;
		jump = 1;
		forever #50 clk = ~clk;
	end
	initial begin
		#200;
		writeIFID = 0;
		#200;
		writeIFID = 1;
//		PCJump = 0;
//		jumpAdd = 2;
//		PCSrc = 0;
//		writeIFID = 0;
		jump = 0;

	end
      
endmodule

