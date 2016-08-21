`timescale 1ns / 1ps

module UC(
	input [5:0] Opcode,
	//Execution / Address calculation
	output reg RegDst,
	output reg [1:0] ALUOp,
	output reg ALUSrc,
	//Memory Access
	output reg Branch,
	output reg MemRead,
	output reg MemWrite,
	//Write-back
	output reg MemToReg,
	output reg RegWrite
//	output reg jump
    );
	 
	 //[RegDst|ALUSrc|MemToReg|RegWrite|MemRead|MemWrite|Branch|ALUOp1|ALUOp0]	 

	always @ (*)
	begin
//		jump = 0;
		case(Opcode)
		//R-format instruction
			'b000000: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b100100010;		
		//Load Byte (LB)
			'b100000: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b011110000;
		//Load Byte Unsigned (LBU)
			'b100100: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b011110000;
		//Load Halfword (LH)
			'b100001: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b011110000;
		//Load Halfword Unsigned (LHU)
			'b100101: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b011110000;
		//Load Word (LW)
			'b100011: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b011110000;
		//Load Word Unsigned (LWU)
			'b100111: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b011110000;
			
		//Load Upper Immediate (LUI)
			'b001111: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b010100010;
			
		//Store Byte (ST)
			'b101000: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b010001000;
		//Store Halfword (SH)
			'b101001: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b010001000;
		//Store Word (SW)
			'b101011: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b010001000;
			
		//Add Immediate Word (ADDI)
			'b001000: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b010100000;
		//Set on Less Than Immediate (SLTI)
			'b001010: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b010100010;
		//And Immediate (ANDI)
			'b001100: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b010100010;
		//Or Immediate (ORI)
			'b001101: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b010100010;
		//Exclusive Or Immediate (XORI)
			'b001110: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b010100010;
			
		//Branch Equal (BEQ)
			'b000100: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b000000101;
		
	//NO IMPLEMENTADO AN
		//Branch Not Equal (BNE)
//			'b000101: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'bzzzzzzzzz;
		//Jump (J)
//			'b000010:
//				begin
//					{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b000000001;
//					jump = 1;
//				end
		//Jump and Link (JAL)
//			'b000011: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'bzzzzzzzzz;
			
		//default
			default: 	{RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}  = 9'b000000000;
		endcase	

	end	
endmodule