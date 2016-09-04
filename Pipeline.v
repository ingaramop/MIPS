`timescale 1ns / 1ps

module Pipeline(
		input clk,
		input clkEnable, 
		input reset,
		//inputs if	 
		output branchFlag,//#29
		output [9:0] branchPC,//#24
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
		output [4:0] rs,//#17BIS
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

wire [4:0] writeRegister_MEMWB;
wire [31:0] outmuxForwardingA;
wire [31:0] outmuxForwardingB;
wire regWrite_MEMWB;
wire outHazard;
wire hazardFlag;
wire jump_IDIF;
wire [1:0] outFowardingA;
wire [1:0] outFowardingB;


	InstructionFetchNEW IF (
		.clk(clk), 
		.clkEnable(clkEnable),
		.reset(reset), 
		.jumpFlag(jumpFlag), 
		.hazardFlag(hazardFlag), 
		.branchFlag(branchFlag), 
		.branchPC(branchPC), 
		.jumpPC(instruction[9:0]), 
		.Instruction(instruction), 
		.PC(PC_IFID)
	);

InstructionDecode ID (
		.clk(clk), 
		.clkEnable(clkEnable),
		.Instruction(instruction), 
		.PCCount(PC_IFID),
		.reset(reset),
		.inHazard(outHazard),
		.PCSrc(branchFlag),		
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
		.rs(rs),	
		.rt(rt), 
		.rd(rd), 
		.regWrite(regWrite_WBID), 
		.writeRegister(writeRegister_WBID), 
		.writeData(writeData_WBID),
		.registers(Registers),
		.jumpFlag(jumpFlag)
    );
	
Execute EX (
		.clock(clk), 
		.clkEnable(clkEnable),
		.reset(reset), 
		.PCSrc(branchFlag), 
		.inBranch(Branch_IDEX), 
		.inMemRead(MemRead_IDEX), 
		.inMemWrite(MemWrite_IDEX), 
		.inMemToReg(MemToReg_IDEX), 
		.inRegWrite(RegWrite_IDEX), 
		.inPC(PC_IDEX), 
		.inData1(regA_IDEX), 
		.inData2(regB_IDEX), 
		.signExtend(signExtend), 
		.rt(rt), 
		.rd(rd), 
		.aluOp(ALUOp_IDEX), 
		.aluSrc(ALUSrc_IDEX), 
		.inRegDst(RegDst_IDEX), 
		.inForwardingA(outFowardingA), 
		.inForwardingB(outFowardingB),  
		.outmux_WBEXE(writeData_WBID), 
		.aluResult_MEMEXE(ALUResult_EXMEM), 
		.outPC(branchPC), 
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
		.clkEnable(clkEnable),
		.regWriteIn(RegWrite_EXMEM), 
		.memToRegIn(MemToReg_EXMEM), 
		.memWriteIn(MemWrite_EXMEM), 
		.branchIn(Branch_EXMEM), 
		.zero(zero), 
		.aluResultIn(ALUResult_EXMEM), 
		.writeDataIn(regB_EXMEM), 
		.wrIn(wr_EXMEM), 
		.reset(reset),
		.PCSrc(branchFlag),
		.inCurrentPC(CurrentPC_EXMEM),
		.regWriteOut(regWrite_MEMWB), 
		.memToRegOut(MemToReg_MEMWB), 
		.readDataOut(readData_MEMWB), 
		.aluResultOut(ALUResult_MEMWB), 
		.wrOut(writeRegister_MEMWB), 
		.PCSrcOut(branchFlag),
		.outCurrentPC(CurrentPC_MEMWB),
		.memorias(Memorias)
    );

stage_wb WB (
		.readData(readData_MEMWB), 
		.aluResult(ALUResult_MEMWB),
		.memReg(MemToReg_MEMWB),
		.regWrite(regWrite_MEMWB), 		
		.wrIn(writeRegister_MEMWB),
		.reset(reset),
		.regWrite_WBID(regWrite_WBID), 
		.dataOut(writeData_WBID),
		.wrOut(writeRegister_WBID)
    );

//======Forwarding Unit====================
Forwarding_Unit Forwarding (
		.regRt_IDEX(rt), //[4:0]
		.regRs_IDEX(rs), //[4:0]
		.regRd_EXMEM(wr_EXMEM), //[4:0]
		.regRd_MEMWB(writeRegister_MEMWB), //[4:0]
		.RegWrite_EXMEM(RegWrite_EXMEM), // 1
		.RegWrite_MEMWB(regWrite_MEMWB), // 1
		.FowardingA(outFowardingA), //[1:0]
		.FowardingB(outFowardingB)  //[1:0]
    );
	 
//======Hazard Detection Unit===============
Hazard_Unit Hazard (
		.memreadMEM(MemRead_IDEX), 
		.rs_IFID(instruction[25:21]), 
		.rt_IFID(instruction[20:16]), 
		.rt_IDEX(rt),
		.muxCtrlSignal(outHazard), 
		.IFIDWrite(hazardFlag)
    );
	
endmodule
