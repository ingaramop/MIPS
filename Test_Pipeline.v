`timescale 1ns / 1ps

module Test_pipeline;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire branchFlag;
	wire [9:0] branchPC;
	wire [31:0] instruction;
	wire [9:0] PC_IFID;
	wire regWrite_WBID;
	wire [4:0] writeRegister_WBID;
	wire [31:0] writeData_WBID;
	wire [1023:0] Registers;
	wire RegDst_IDEX;
	wire [1:0] ALUOp_IDEX;
	wire ALUSrc_IDEX;
	wire Branch_IDEX;
	wire MemRead_IDEX;
	wire MemWrite_IDEX;
	wire MemToReg_IDEX;
	wire RegWrite_IDEX;
	wire [9:0] PC_IDEX;
	wire [31:0] regA_IDEX;
	wire [31:0] regB_IDEX;
	wire [31:0] signExtend;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [4:0] rs;
	wire Branch_EXMEM;
	wire MemRead_EXMEM;
	wire MemWrite_EXMEM;
	wire MemToReg_EXMEM;
	wire RegWrite_EXMEM;
	wire [9:0] CurrentPC_EXMEM;
	wire zero;
	wire [31:0] ALUResult_EXMEM;
	wire [31:0] regB_EXMEM;
	wire [4:0] wr_EXMEM;
	wire [319:0] Memorias;
	wire MemToReg_MEMWB;
	wire [31:0] readData_MEMWB;
	wire [31:0] ALUResult_MEMWB;
	wire [9:0] CurrentPC_MEMWB;

	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.clk(clk), 
		.reset(reset), 
		.branchFlag(branchFlag), 
		.branchPC(branchPC), 
		.instruction(instruction), 
		.PC_IFID(PC_IFID), 
		.regWrite_WBID(regWrite_WBID), 
		.writeRegister_WBID(writeRegister_WBID), 
		.writeData_WBID(writeData_WBID), 
		.Registers(Registers), 
		.RegDst_IDEX(RegDst_IDEX), 
		.ALUOp_IDEX(ALUOp_IDEX), 
		.ALUSrc_IDEX(ALUSrc_IDEX), 
		.Branch_IDEX(Branch_IDEX), 
		.MemRead_IDEX(MemRead_IDEX), 
		.MemWrite_IDEX(MemWrite_IDEX), 
		.MemToReg_IDEX(MemToReg_IDEX), 
		.RegWrite_IDEX(RegWrite_IDEX), 
		.PC_IDEX(PC_IDEX), 
		.regA_IDEX(regA_IDEX), 
		.regB_IDEX(regB_IDEX), 
		.signExtend(signExtend), 
		.rt(rt), 
		.rd(rd), 
		.rs(rs), 
		.Branch_EXMEM(Branch_EXMEM), 
		.MemRead_EXMEM(MemRead_EXMEM), 
		.MemWrite_EXMEM(MemWrite_EXMEM), 
		.MemToReg_EXMEM(MemToReg_EXMEM), 
		.RegWrite_EXMEM(RegWrite_EXMEM), 
		.CurrentPC_EXMEM(CurrentPC_EXMEM), 
		.zero(zero), 
		.ALUResult_EXMEM(ALUResult_EXMEM), 
		.regB_EXMEM(regB_EXMEM), 
		.wr_EXMEM(wr_EXMEM), 
		.Memorias(Memorias), 
		.MemToReg_MEMWB(MemToReg_MEMWB), 
		.readData_MEMWB(readData_MEMWB), 
		.ALUResult_MEMWB(ALUResult_MEMWB), 
		.CurrentPC_MEMWB(CurrentPC_MEMWB)
	);
	initial begin
		// Initialize Inputs
		clk = 0;
		forever #50 clk = ~clk;
	end
	initial begin
		reset = 1;
		#125;
		reset = 0;
		#4000;
		reset = 1;
		#125;
		reset = 0;
	end
      
endmodule

