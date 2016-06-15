`timescale 1ns / 1ps

module IFTest;

	// Inputs
	reg [9:0]PCJump;
	reg PCSrc;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] Instruction;
	wire [9:0] PCNextReg;


	// Instantiate the Unit Under Test (UUT)
	InstructionFetch uut ( 
		.PCJump(PCJump), 
		.PCSrc(PCSrc), 
		.clk(clk), 
		.reset(reset),
		.PCCurrentReg(PCNextReg),
		.Instruction(Instruction), 
		.PCNextReg(PCNextReg)
	);

initial begin
	// Initialize Inputs	
	PCJump = 0;
	PCSrc = 0;
	clk = 1;
	reset = 1;
	#40;
	clk = 0;
	#10
	reset =0;
	forever #50 clk = ~clk;
		
end 
      
endmodule