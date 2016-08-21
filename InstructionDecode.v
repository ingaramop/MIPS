`timescale 1ns / 1ps

module InstructionDecode(
		input clk,
		input [31:0] Instruction,
		input [9:0] PCCount,
		input regWrite,
		input [4:0]writeRegister,
		input [31:0]writeData,
		input reset,
		input inHazard, //Agregado
		input PCSrc, //Agregado
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
		output reg [4:0] rs, //Instruction [25:21]
		output reg [4:0] rt, //Instruction [20:16]
		output reg [4:0] rd,  //Instruction [15:11]
		output wire [1023:0] registers
//		output wire jump
    );
initial regA = 0;
initial regB = 0;
		//Cables entrada Mux 9
		wire  [1:0]ALUOpWire;
		wire  RegDstWire;
		wire  ALUSrcWire;
		wire  BranchWire;
		wire  MemReadWire;
		wire  MemWriteWire;
		wire  MemToRegWire;
		wire  RegWriteWire;
		//Cables salida Mux 9
		wire  [1:0]ALUOpWireOut;
		wire  RegDstWireOut;
		wire  ALUSrcWireOut;
		wire  BranchWireOut;
		wire  MemReadWireOut;
		wire  MemWriteWireOut;
		wire  MemToRegWireOut;
		wire  RegWriteWireOut;
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
//			.jump(jump)
			);
mux9 mux9bits (
    .inHazard(inHazard), 
    .inRegDst(RegDstWire), 
    .inALUOp(ALUOpWire), 
    .inALUSrc(ALUSrcWire), 
    .inBranch(BranchWire), 
    .inMemRead(MemReadWire), 
    .inMemWrite(MemWriteWire), 
    .inMemToReg(MemToRegWire), 
    .inRegWrite(RegWriteWire), 
    .outRegDst(RegDstWireOut), 
    .outALUOp(ALUOpWireOut), 
    .outALUSrc(ALUSrcWireOut), 
    .outBranch(BranchWireOut), 
    .outMemRead(MemReadWireOut), 
    .outMemWrite(MemWriteWireOut), 
    .outMemToReg(MemToRegWireOut), 
    .outRegWrite(RegWriteWireOut)
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
	if (reset | PCSrc) begin
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
		rs <= 0;
		rt <= 0;
		rd <= 0;
		PcCountOut <= 0;
	end
	else begin
		ALUOpOut <= ALUOpWireOut;
		RegDstOut <= RegDstWireOut;
		ALUSrcOut <= ALUSrcWireOut;
		BranchOut <= BranchWireOut;
		MemReadOut <= MemReadWireOut;
		MemWriteOut <= MemWriteWireOut;
		MemToRegOut <= MemToRegWireOut;
		RegWriteOut <= RegWriteWireOut;
		regA <= regAWire;
		regB <= regBWire;
		signExtendOut <= signExtendWire;
		rs <= Instruction [25:21];
		rt <= Instruction [20:16];
		rd <= Instruction [15:11];
		PcCountOut <= PCCount;
	end
end
endmodule
