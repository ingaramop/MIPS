`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:59:45 07/16/2016
// Design Name:   Execute
// Module Name:   /home/maxi/Descargas/MIPS-master-New/Test_ExecuteStage.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Execute
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_ExecuteStage;

	// Inputs
	reg clock;
	reg reset;
	reg inBranch;
	reg inMemRead;
	reg inMemWrite;
	reg inMemToReg;
	reg inRegWrite;
	reg [9:0] inPC;
	reg [31:0] inData1;
	reg [31:0] inData2;
	reg [31:0] signExtend;
	reg [4:0] rt;
	reg [4:0] rd;
	reg [1:0] aluOp;
	reg aluSrc;
	reg inRegDst;
	reg [1:0] inForwardingA;
	reg [1:0] inForwardingB;
	reg inHazard;
	reg [31:0] outmux_WBEXE;
	reg [31:0] aluResult_MEMEXE;

	// Outputs
	wire [9:0] outPC;
	wire zero;
	wire [31:0] aluResult;
	wire [31:0] outData2;
	wire [4:0] wr;
	wire outBranch;
	wire outMemRead;
	wire outMemWrite;
	wire outMemToReg;
	wire outRegWrite;
	wire [9:0] outCurrentPC;

	// Instantiate the Unit Under Test (UUT)
	Execute uut (
		.clock(clock), 
		.reset(reset), 
		.inBranch(inBranch), 
		.inMemRead(inMemRead), 
		.inMemWrite(inMemWrite), 
		.inMemToReg(inMemToReg), 
		.inRegWrite(inRegWrite), 
		.inPC(inPC), 
		.inData1(inData1), 
		.inData2(inData2), 
		.signExtend(signExtend), 
		.rt(rt), 
		.rd(rd), 
		.aluOp(aluOp), 
		.aluSrc(aluSrc), 
		.inRegDst(inRegDst), 
		.inForwardingA(inForwardingA), 
		.inForwardingB(inForwardingB), 
		.inHazard(inHazard), 
		.outmux_WBEXE(outmux_WBEXE), 
		.aluResult_MEMEXE(aluResult_MEMEXE), 
		.outPC(outPC), 
		.zero(zero), 
		.aluResult(aluResult), 
		.outData2(outData2), 
		.wr(wr), 
		.outBranch(outBranch), 
		.outMemRead(outMemRead), 
		.outMemWrite(outMemWrite), 
		.outMemToReg(outMemToReg), 
		.outRegWrite(outRegWrite), 
		.outCurrentPC(outCurrentPC)
	);

initial begin
		// Initialize Inputs
		clock = 0;
	
		forever #50 clock = ~clock;
	end

	
	initial begin
//		and 	$t4, $t2, $t5;	#  t4 = t2 AND t5
//		000000 01010 01101 01100 000001 00100
//		#100;
	
//
//		reset = 1;
//		#100 ;
//		reset = 0;

		inBranch = 0;
		inMemRead = 0;
		inMemWrite = 0;
		inMemToReg = 0;
		inRegWrite = 0;
		inPC = 0;
		inHazard = 1;
//		#100 ;
		inData1 = 1;
		inData2 = 1;
		signExtend = 3;
		rt = 1;
		rd = 2;
		outmux_WBEXE = 4;
		aluResult_MEMEXE = 5;
		aluOp = 2'b10;
		aluSrc = 0;
		inRegDst = 1; // pasa RD
		inForwardingA = 2'b00; 
		inForwardingB = 2'b00;
		
		#100;
//    addi	$t5,$t8, 2;	#  $t5 = $t8 + 2;   #coloco un 2 en el registro t5 (t8=0)
//		001000 11000 01101 00000 00000000010
		aluOp = 2'b10;
		aluSrc = 1;
		rt = 1;
		rd = 2;
		signExtend = 16'b0000000000000010;
		inRegDst = 0;
		inForwardingA = 2'b01;
		inForwardingB = 0;

end
      
endmodule



