`timescale 1ns / 1ps

module InstructionFetch( 
								input clk,
								input [9:0]PCJump,
								input PCSrc,
								input reset,
								input [9:0] PCCurrentReg,
								output reg [31:0]Instruction, 
								output reg [9:0] PCNextReg
								);
								

wire [9:0]muxPC;
wire [9:0]PCRom;
wire [9:0]PCNext;
wire [31:0]instruction;

mux2to1 instance_mux2to1 (
    .A(PCCurrentReg),//reemplaza a pcloop 
    .B(PCJump), 
    .sel(PCSrc), 
    .out(muxPC)
    );
	 
//PC instance_PC	(
//	.pc(muxPC), //Contador de Programa
//	.clk(clk),
//	.reset(reset),
//	.outPc(PCRom)
//    );

ROM instance_ROM (	//Rom
  .a(muxPC), // Salida del MUX que trae la instrucción a buscar en la ROM
  .spo(instruction) // instrucción buscada en la memoria ROM
);

addPc instance_addPc(.inPc(muxPC), 	//Sumador + 1 al PC
							.outPc(PCNext)
    );
	 
//	initial begin
//		// Initialize Inputs	
//		PCNextReg <= 0;
//	end

initial PCNextReg = 0;
	 
always@(negedge clk)
begin
	if (reset)
	begin
		PCNextReg <= 0;
		Instruction <= 0;
	end
	else
	begin
		PCNextReg <= PCNext;
		Instruction <= instruction;
		//$display("instruction: %b, PC: %d", Instruction, PCNextReg);
	end
end
endmodule
