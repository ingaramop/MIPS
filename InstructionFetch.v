`timescale 1ns / 1ps

module InstructionFetch( 
								input clk,
								input reset,
								input [9:0]PCJump,
								input [9:0] jumpAdd, //Instruccion[9:0]
								input PCSrc,
								input writeIFID, //Seal de la Hazard que "pone en pausa" el PC si est en 0
								input [5:0]opcjump,
								output reg [31:0]Instruction, 
								output reg [9:0] PCNextReg
								);						
wire [9:0]muxPC;
wire [31:0]instruction;
wire [9:0]outmuxA;
wire jumpWire;

mux2to1 muxA (
    .A(PCNextReg), 
    .B(jumpAdd), 
    .sel(jumpWire), 
    .out(outmuxA)
    );

mux2to1 muxB (
    .A(outmuxA),//reemplaza a pcloop 
    .B(PCJump), 
    .sel(PCSrc), 
    .out(muxPC) //out = (sel) ? B : A;
    );
ROM instance_ROM (	//Rom
  .a(muxPC), // Salida del MUX que trae la instruccin a buscar en la ROM
  .spo(instruction) // instruccin buscada en la memoria ROM
);

jumpControl jumpControl (
    .opcode(opcjump), 
    .jump(jumpWire)
    );


always@(negedge clk)
begin
	if (reset)
	begin
		PCNextReg <= 0;
		Instruction <= 0;
	end
	else if(PCSrc  )
	begin
		PCNextReg <= muxPC;
		Instruction <= Instruction;
	end
	else if(writeIFID)
		begin
		PCNextReg <= muxPC + 1;
		Instruction <= instruction;
		end
	else
	begin
		PCNextReg <= PCNextReg;
		Instruction <= Instruction;
	end	
end
endmodule
