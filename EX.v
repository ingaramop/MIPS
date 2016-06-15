`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:22:33 11/19/2015 
// Design Name: 
// Module Name:    EX 
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
module Execute(
		input [31:0] signExtend,
		input [31:0] inData1,
		input [31:0] inData2,
		input [9:0] inPC,
		input [4:0] rt,
		input [4:0] rd,
		input clock,
		input [1:0] aluOp,
		input aluSrc,
		input inRegDst,
		input inBranch,
		input inMemRead,
		input inMemWrite,
		input inMemToReg,
		input inRegWrite,
		input reset,
		output reg [9:0] outPC,
		output reg zero,
		output reg [31:0] aluResult,
		output reg [31:0] outData2,
		output reg [4:0] wr,
		output reg outBranch,
		output reg outMemRead,
		output reg outMemWrite,
		output reg outMemToReg,
		output reg outRegWrite,
		output reg [9:0]outCurrentPC
    );

wire [31:0] aluResultWire;
wire [9:0] outPCWire;
wire zeroWire;
wire [3:0] operation;
wire [31:0] mux1Out;
wire [4:0] wrWire;

Alu instanciaAlu ( //instancio la alu
    .data1(inData1), 
    .data2(mux1Out), 
    .operation(operation), 
    .aluResult(aluResultWire), 
    .zero(zeroWire)
    );

AluAdder instanciaAdder ( //instancio el sumador
    .PC(inPC), 
    .signExtend(signExtend[9:0]), 
    .addResult(outPCWire)
    );

AluControl instanceAluControl ( //instancio módulo de control
    .aluOp(aluOp), 
    .functionField(signExtend[5:0]), 
    .operation(operation)
    );

Mux32Bit instanciaMux32Bit ( //instancio un mux de 32 bit
	.in1(inData2), 
	.in2(signExtend), 
	.selector(aluSrc),	 
	.out(mux1Out)
    );
	 
Mux5Bit instanciaMux5Bit ( //instancio un mux de 5 bit
	.in1(rt), 
	.in2(rd), 
	.selector(inRegDst), 
	.out(wrWire)
    );
	 
initial begin
	zero = 0;
end

always @(negedge clock) begin
if (reset)begin	
	zero <= 0;
	aluResult <= 0;
	outData2 <= 0;
	outPC <= 0;
	wr <= 0;
	outBranch <= 0;
	outMemToReg <= 0;
	outRegWrite <= 0;
	outMemWrite <= 0;
	outMemRead <= 0;
	outCurrentPC <= 0;
end
else begin	
	zero <= zeroWire;
	aluResult <= aluResultWire;
	outData2 <= inData2;
	outPC <= outPCWire;
	wr <= wrWire;
	outBranch <= inBranch;
	outMemToReg <= inMemToReg;
	outRegWrite <= inRegWrite;
	outMemWrite <= inMemWrite;
	outMemRead <= inMemRead;
	outCurrentPC <= inPC;
end
	
end




endmodule
