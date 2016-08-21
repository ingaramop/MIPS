`timescale 1ns / 1ps

module Execute(
		input clock,
		input reset,
		input PCSrc,
		input inBranch, 	//pasa
		input inMemRead, 	//pasa
		input inMemWrite, //pasa
		input inMemToReg, //pasa
		input inRegWrite, //pasa
		input [9:0] inPC,
		input [31:0] inData1,
		input [31:0] inData2,
		input [31:0] signExtend,
		input [4:0] rt,
		input [4:0] rd,
		input [1:0] aluOp, 
		input aluSrc,
		input inRegDst,
		input [1:0] inForwardingA,
		input [1:0] inForwardingB,		
		input [31:0] outmux_WBEXE,
		input [31:0] aluResult_MEMEXE,
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
wire [31:0] outForwardingB;
wire [31:0] outForwardingA;

AluAdder instanciaAdder ( //instancio el sumador
    .PC(inPC), 
    .signExtend(signExtend[9:0]), 
    .addResult(outPCWire)
    );

muxForwarding ForwardingA (
    .in1(inData1), 
    .in2(outmux_WBEXE), 
    .in3(aluResult_MEMEXE), 
    .selector(inForwardingA), 
    .out(outForwardingA)
    );
	 
muxForwarding ForwardingB (
    .in1(inData2), 
    .in2(outmux_WBEXE), 
    .in3(aluResult_MEMEXE), 
    .selector(inForwardingB), 
    .out(outForwardingB)
    );
	 
Mux32Bit instanciaMux32Bit ( 
	.in1(outForwardingB), 
	.in2(signExtend), 
	.selector(aluSrc),	  //out = selector? in2 : in1;
	.out(mux1Out)
    );
	 	 
Alu instanciaAlu ( //instancio la alu
    .data1(outForwardingA), 
    .data2(mux1Out), 
    .operation(operation), 
    .aluResult(aluResultWire), 
    .zero(zeroWire)
    );

AluControl instanceAluControl ( //instancio mdulo de control
    .aluOp(aluOp), //Testear esta parte
    .functionField(signExtend[5:0]), 
    .operation(operation)
    );	 
	 

Mux5Bit instanciaMux5Bit ( //instancio un mux de 5 bit
	.in1(rt), 
	.in2(rd), 
	.selector(inRegDst), //out = selector? in2 : in1;
	.out(wrWire)
    );

initial begin
	zero = 0;
end

always @(negedge clock) begin
if (reset | PCSrc)
	begin	
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
else
	 begin	
		zero <= zeroWire;
		aluResult <= aluResultWire;
		outData2 <= outForwardingB;
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
