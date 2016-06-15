`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:34:17 04/12/2016
// Design Name:   UC
// Module Name:   E:/ID funca/Intruction-Decode/Intruction-Decode/UCTest.v
// Project Name:  Intruction-Decode
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UCTest;

	// Inputs
	reg [5:0] Opcode;
	reg reset;

	// Outputs
	wire RegDst;
	wire [1:0] ALUOp;
	wire ALUSrc;
	wire Branch;
	wire MemRead;
	wire MemWrite;
	wire MemToReg;
	wire RegWrite;

	// Instantiate the Unit Under Test (UUT)
	UC uut (
		.Opcode(Opcode), 
		.reset(reset), 
		.RegDst(RegDst), 
		.ALUOp(ALUOp), 
		.ALUSrc(ALUSrc), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.MemToReg(MemToReg), 
		.RegWrite(RegWrite)
	);

	initial begin
		// Initialize Inputs
		Opcode = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

