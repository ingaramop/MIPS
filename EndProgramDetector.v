`timescale 1ns / 1ps

//Este modulo observa las instrucciones que lee la etapa instruction fetch,
//y en base a eso, levanta una bandera cuando el programa ha finalizado.

module EndProgramDetector(
		input pipeClk,
		input [31:0] instruction_IFID,
		input reset,
		input clear_program_finished,
		output reg programEnd
    );

reg [2:0]counter;

always @(posedge pipeClk)begin
	if (reset | clear_program_finished)
	begin
		counter =0;
		programEnd =0;
	end
	if (instruction_IFID == 0) counter = counter + 1;
	if (counter == 4) programEnd = 1;
end


endmodule
