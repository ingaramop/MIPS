`timescale 1ns / 1ps
//Multiplexor de 9 bits, selector -> inHazard
//si es 0 -> burbuja
module mux9(input inHazard,
				input inRegDst ,
				input [1:0]inALUOp,
				input	inALUSrc, 
				input inBranch, 
				input inMemRead, 
				input inMemWrite, 
				input inMemToReg,
				input inRegWrite, 
				output reg outRegDst,
				output reg [1:0]outALUOp,
				output reg outALUSrc, 
				output reg outBranch, 
				output reg outMemRead, 
				output reg outMemWrite, 
				output reg outMemToReg, 
				output reg outRegWrite 
				);

always @(*)
begin
	if (inHazard)
		begin
			outRegDst 	<=	inRegDst;
			outALUOp		<= inALUOp;
			outALUSrc	<= inALUSrc;
			outBranch	<= inBranch;
			outMemRead	<= inMemRead;
			outMemWrite	<= inMemWrite;
			outMemToReg	<= inMemToReg;
			outRegWrite	<= inRegWrite;
		end
	else
		begin
			outRegDst 	<=	0;
			outALUOp		<= 2'b0;
			outALUSrc	<= 0;
			outBranch	<= 0;
			outMemRead	<= 0;
			outMemWrite	<= 0;
			outMemToReg	<= 0;
			outRegWrite	<= 0;
		end
end
endmodule

/*
				input inRegDstWire,
				input [1:0]inALUOpWire,
				input	inALUSrcWire
				input inBranchWire
				input inMemReadWire
				input inMemWriteWire
				input inMemToRegWire
				input inRegWriteWire
				output outRegDstWire,
				output [1:0]outALUOpWire,
				output outALUSrcWire
				output outBranchWire
				output outMemReadWire
				output outMemWriteWire
				output outMemToRegWire
				output outRegWriteWire
*/

