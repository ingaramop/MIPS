`timescale 1ns / 1ps

module InstructionDecode(
		input clk,
		input [31:0] Instruction,
		input [9:0] PCCount,
		input regWrite,
		input [4:0]writeRegister,
		input [31:0]writeData,
		input reset,
		//Control Unit
		output reg [1:0]ALUOpOut,
		output reg RegDstOut,
		output reg ALUSrcOut,
		output reg BranchOut,
		output reg MemReadOut,
		output reg MemWriteOut,
		output reg MemToRegOut,
		output reg RegWriteOut,
		//Banco de Registros
		output reg [31:0] regA,
		output reg [31:0] regB,
		//Sign Extend
		output reg [31:0] signExtendOut,
		//IntructionDecode
		output reg [9:0] PcCountOut,
		output reg [4:0] rt, //Instruction [20:16]
		output reg [4:0] rd,  //Instruction [15:11]
		output wire [1023:0] registers
    );
	 
		wire  [1:0]ALUOpWire;
		wire  RegDstWire;
		wire  ALUSrcWire;
		wire  BranchWire;
		wire  MemReadWire;
		wire  MemWriteWire;
		wire  MemToRegWire;
		wire  RegWriteWire;
		//Banco de Registros
		wire  [31:0] regAWire;
		wire  [31:0] regBWire;
		//Sign Extend
		wire  [31:0] signExtendWire;
	 
UC UC_instance(
			.Opcode(Instruction[31:26]),
			.RegDst(RegDstWire),
			.ALUOp(ALUOpWire),
			.ALUSrc(ALUSrcWire),
			.Branch(BranchWire),
			.MemRead(MemReadWire),
			.MemWrite(MemWriteWire),
			.MemToReg(MemToRegWire),
			.RegWrite(RegWriteWire)
			);

bancoDeRegistros banco_instance(
			.we(regWrite),
			.addressA(Instruction[25:21]),
			.addressB(Instruction[20:16]),
			.addressW(writeRegister),
			.clk(clk),							
			.data(writeData),
			.reset(reset),
			.regA(regAWire),
			.regB(regBWire),
			.registers(registers)
			);
			
signExtend signExtend_instance(
			.inSignExtend(Instruction[15:0]),
			.outSignExtend(signExtendWire)
			);
			
always @(negedge clk) 
begin
	if (reset) begin
		ALUOpOut <= 0;
		RegDstOut <= 0;
		ALUSrcOut <= 0;
		BranchOut <= 0;
		MemReadOut <= 0;
		MemWriteOut <= 0;
		MemToRegOut <= 0;
		RegWriteOut <= 0;
		regA <= 0;
		regB <= 0;
		signExtendOut <= 0;
		rt <= 0;
		rd <= 0;
		PcCountOut <= 0;
	end
	else begin
		ALUOpOut <= ALUOpWire;
		RegDstOut <= RegDstWire;
		ALUSrcOut <= ALUSrcWire;
		BranchOut <= BranchWire;
		MemReadOut <= MemReadWire;
		MemWriteOut <= MemWriteWire;
		MemToRegOut <= MemToRegWire;
		RegWriteOut <= RegWriteWire;
		regA <= regAWire;
		regB <= regBWire;
		signExtendOut <= signExtendWire;
		rt <= Instruction [20:16];
		rd <= Instruction [15:11];
		PcCountOut <= PCCount;
	end
end
endmodule
