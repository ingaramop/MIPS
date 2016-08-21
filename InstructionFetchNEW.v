`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:19:28 08/21/2016 
// Design Name: 
// Module Name:    InstructionFetchNEW 
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
module InstructionFetchNEW(
				input clk,
				input reset,
				input [5:0]opcjump,
				input hazardFlag,
				input branchFlag,
				input [9:0] branchPC,
				input [9:0] jumpPC, //Instruccion[9:0]		
				output wire [31:0]Instruction, 
				output reg [9:0] PC
    );
wire  jumpFlag;

jumpControl jumpControl (
    .opcode(opcjump), 
    .jump(jumpFlag)
    );
	 
ROM instance_ROM (	//Rom
  .a(PC), // Salida del MUX que trae la instruccin a buscar en la ROM
  .spo(Instruction) // instruccin buscada en la memoria ROM
);

always@(negedge clk)
begin
	if (reset)
	begin
		PC<=0;
	end
	else PC <=PC+1;
end

endmodule
