`timescale 1ns / 1ps

module IFTest;

	// Inputs
	reg [9:0]PCJump;
	reg PCSrc;
	reg clk;
	reg reset;
	reg writeIFID;
	reg opcjump;
	reg jumpAdd;
	// Outputs
	wire [31:0] Instruction;
	wire [9:0] PCNextReg;



// Instantiate the module
InstructionFetch instance_name (
    .clk(clk), 
    .reset(reset), 
    .PCJump(PCJump), 
    .jumpAdd(jumpAdd), 
    .PCSrc(PCSrc), 
    .writeIFID(writeIFID), 
    .opcjump(opcjump), 
    .Instruction(Instruction), 
    .PCNextReg(PCNextReg)
    );

initial begin
	// Initialize Inputs	
	PCJump = 0;
	PCSrc = 0;
	writeIFID = 1;
	opcjump = 0;
	jumpAdd = 0;
	clk = 1;
	reset = 1;
	#40;
	clk = 0;
	#10
	reset =0;
	forever #50 clk = ~clk;
		
end 
      
endmodule