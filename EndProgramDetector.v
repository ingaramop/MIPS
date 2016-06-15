`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:54:37 05/15/2016 
// Design Name: 
// Module Name:    EndProgramDetector 
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


//Este modulo observa las instrucciones que lee la etapa instruction fetch,
//y en base a eso, levanta una bandera cuando el programa ha finalizado.

module EndProgramDetector(
		input pipeClk,
		input [31:0] instruction_IFID,
		input reset,
		output reg programEnd
    );

reg [2:0]counter;

always @(posedge pipeClk)begin
	if (reset)begin
		counter =0;
		programEnd =0;
	end
	if (instruction_IFID == 0) counter = counter + 1;
	if (counter == 4) programEnd = 1;
end


endmodule
