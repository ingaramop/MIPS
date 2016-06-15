`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:56:03 04/15/2016
// Design Name:   stage_mem
// Module Name:   E:/ID funca/Intruction-Decode/Intruction-Decode/MEMTest.v
// Project Name:  Intruction-Decode
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: stage_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MEMTest;

	// Inputs
	reg clk;
	reg regWriteIn;
	reg memToRegIn;
	reg memWriteIn;
	reg memReadIn;
	reg branchIn;
	reg zero;
	reg reset;
	reg [31:0] aluResultIn;
	reg [31:0] writeDataIn;
	reg [4:0] wrIn;

	// Outputs
	wire regWriteOut;
	wire memToRegOut;
	wire [31:0] readDataOut;
	wire [31:0] aluResultOut;
	wire [4:0] wrOut;
	wire PCSrcOut;

	// Instantiate the Unit Under Test (UUT)
	stage_mem uut (
		.clk(clk), 
		.regWriteIn(regWriteIn), 
		.memToRegIn(memToRegIn), 
		.memWriteIn(memWriteIn), 
		.memReadIn(memReadIn), 
		.branchIn(branchIn), 
		.zero(zero), 
		.aluResultIn(aluResultIn), 
		.writeDataIn(writeDataIn), 
		.wrIn(wrIn), 
		.reset(reset),
		.regWriteOut(regWriteOut), 
		.memToRegOut(memToRegOut), 
		.readDataOut(readDataOut), 
		.aluResultOut(aluResultOut), 
		.wrOut(wrOut), 
		.PCSrcOut(PCSrcOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		regWriteIn = 0;
		memToRegIn = 0;
		memWriteIn = 0;
		memReadIn = 0;
		branchIn = 0;
		zero = 0;
		aluResultIn = 0;
		writeDataIn = 0;
		wrIn = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#125;
		reset = 0;
		
		//test1: escribo un 9 en la posición 3
		zero = 0;
      branchIn = 0;
		memWriteIn = 1;
		aluResultIn = 3;
		writeDataIn = 9;
		wrIn = 7;
		#100
		//test2: escribo un 99 en la posición 30
		zero = 0;
      branchIn = 1;
		memWriteIn = 1;
		aluResultIn = 30;
		writeDataIn = 99;
		wrIn = 7;
		#100
		//test3: escribo un 999 en la posición 300
		zero = 1;
      branchIn = 1;
		memWriteIn = 1;
		aluResultIn = 300;
		writeDataIn = 999;
		wrIn = 7;
		#100
		//test4: leo la posición 3
		zero = 0;
      branchIn = 0;
		memWriteIn = 0;
		memReadIn = 1;
		aluResultIn = 3;
		writeDataIn = 0;
		wrIn = 7;
		#100
		//test5: leo la posición 30
		zero = 0;
      branchIn = 0;
		memWriteIn = 0;
		memReadIn = 1;
		aluResultIn = 30;
		writeDataIn = 0;
		wrIn = 7;
		#100
		//test5: leo la posición 30
		zero = 0;
      branchIn = 0;
		memWriteIn = 0;
		memReadIn = 1;
		aluResultIn = 300;
		writeDataIn = 0;
		wrIn = 7;
		#100;
		

	end
	
	initial begin
    clk = 0;
    forever #50 clk = ~clk;
end
      
endmodule

