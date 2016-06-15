`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:46 11/23/2015 
// Design Name: 
// Module Name:    Pipeline 
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
module Pipeline(
		input clk,
		input reset,
		//inputs if	 
		output PCSrc_MEMIF,//#29
		output [9:0] PCJump,//#24
		//outputs if - inputs id
		output [31:0] instruction,//#2
		output [9:0] PC_IFID,//#1
		//inputs id
		output regWrite_WBID,//#32
		output [4:0] writeRegister_WBID,//#36
		output [31:0] writeData_WBID,//#37
		//outputs id - inputs ex
		//(UC)
		output [1023:0] Registers,//#3
		output RegDst_IDEX,//#9
		output [1:0] ALUOp_IDEX,//#10
		output ALUSrc_IDEX,//#11
		output Branch_IDEX,//#6
		output MemRead_IDEX,//#7
		output MemWrite_IDEX,//#8
		output MemToReg_IDEX,//#4
		output RegWrite_IDEX,//#5
		output [9:0]PC_IDEX,//#12
		output [31:0] regA_IDEX,//#13
		output [31:0] regB_IDEX,//#14
		output [31:0] signExtend,//#15
		output [4:0] rt,//#16
		output [4:0] rd,//#17
		//outputs ex - inputs mem
		//UC
		output Branch_EXMEM,//#20
		output MemRead_EXMEM,//#21
		output MemWrite_EXMEM,//#22
		output MemToReg_EXMEM,//#18
		output RegWrite_EXMEM,//#19
		output [9:0]CurrentPC_EXMEM,//#23
		//
		output zero,//#25
		output [31:0] ALUResult_EXMEM,//#26
		output [31:0] regB_EXMEM,//#27
		output [4:0] wr_EXMEM,//#28
		//outputs mem inputs wb
		output [319:0] Memorias, //#30
		output MemToReg_MEMWB,//#31
		output [31:0] readData_MEMWB,//#34
		output [31:0] ALUResult_MEMWB,//#35
		output [9:0] CurrentPC_MEMWB//#33
    );


InstructionFetch IF (
    .clk(clk),  
    .PCJump(PCJump), 
    .PCSrc(PCSrc_MEMIF), 
    .Instruction(instruction), 
	 .PCCurrentReg(PC_IFID),
	 .reset(reset),
    .PCNextReg(PC_IFID)
    );

InstructionDecode ID (
	.clk(clk), 
	.Instruction(instruction), 
	.PCCount(PC_IFID),
	.reset(reset),	 
	.ALUOpOut(ALUOp_IDEX), 
	.RegDstOut(RegDst_IDEX), 
	.ALUSrcOut(ALUSrc_IDEX), 
	.BranchOut(Branch_IDEX), 
	.MemReadOut(MemRead_IDEX), 
	.MemWriteOut(MemWrite_IDEX), 
	.MemToRegOut(MemToReg_IDEX), 
	.RegWriteOut(RegWrite_IDEX), 
	.regA(regA_IDEX), 
	.regB(regB_IDEX), 
	.signExtendOut(signExtend), 
	.PcCountOut(PC_IDEX), 
	.rt(rt), 
	.rd(rd), 
	.regWrite(regWrite_WBID), 
	.writeRegister(writeRegister_WBID), 
	.writeData(writeData_WBID),
	.registers(Registers)
    );

Execute EX (
	.signExtend(signExtend), 
	.inData1(regA_IDEX), 
	.inData2(regB_IDEX), 
	.inPC(PC_IDEX), 
	.rt(rt), 
	.rd(rd), 
	.clock(clk), 
	.aluOp(ALUOp_IDEX), 
	.aluSrc(ALUSrc_IDEX), 
	.inRegDst(RegDst_IDEX),
	.inBranch(Branch_IDEX), 
	.inMemRead(MemRead_IDEX), 
	.inMemWrite(MemWrite_IDEX), 
	.inMemToReg(MemToReg_IDEX), 
	.inRegWrite(RegWrite_IDEX),
	.reset(reset),
	.outPC(PCJump), 
	.zero(zero), 
	.aluResult(ALUResult_EXMEM), 
	.outData2(regB_EXMEM), 
	.wr(wr_EXMEM),
	.outBranch(Branch_EXMEM), 
	.outMemRead(MemRead_EXMEM), 
	.outMemWrite(MemWrite_EXMEM), 
	.outMemToReg(MemToReg_EXMEM), 
	.outRegWrite(RegWrite_EXMEM),
	.outCurrentPC(CurrentPC_EXMEM)
    );

stage_mem MEM (
    .clk(clk), 
    .regWriteIn(RegWrite_EXMEM), 
    .memToRegIn(MemToReg_EXMEM), 
    .memWriteIn(MemWrite_EXMEM), 
    .memReadIn(MemRead_EXMEM), 
    .branchIn(Branch_EXMEM), 
    .zero(zero), 
    .aluResultIn(ALUResult_EXMEM), 
    .writeDataIn(regB_EXMEM), 
    .wrIn(wr_EXMEM), 
	 .reset(reset),
	 .inCurrentPC(CurrentPC_EXMEM),
    .regWriteOut(regWrite_WBID), 
    .memToRegOut(MemToReg_MEMWB), 
    .readDataOut(readData_MEMWB), 
    .aluResultOut(ALUResult_MEMWB), 
    .wrOut(writeRegister_MEMWB), 
    .PCSrcOut(PCSrc_MEMIF),
	 .outCurrentPC(CurrentPC_MEMWB),
	 .memorias(Memorias)
    );

stage_wb WB (
		.readData(readData_MEMWB), 
		.aluResult(ALUResult_MEMWB),
		.memReg(MemToReg_MEMWB), 
		.wrIn(writeRegister_MEMWB),
		.reset(reset),
		.dataOut(writeData_WBID),
		.wrOut(writeRegister_WBID)
    );

endmodule
