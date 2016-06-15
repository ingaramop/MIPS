`timescale 1ns / 1ps

module stage_mem( input  clk,
						input  regWriteIn,   //Bit de Uni. Ctrl pasa a stage WB
						input  memToRegIn,	//Bit de Uni. Ctrl pasa a stage WB
						input	 memWriteIn,	//Bit de Uni. Ctrl
						input	 memReadIn,		//Bit de Uni. Ctrl
						input	 branchIn,		//Bit de Uni. Ctrl
						input  zero,			//Bit flag Zero
						input  [31:0]aluResultIn,
						input  [31:0]writeDataIn,	
						input  [4:0] wrIn,//Reg pasa a stage WB
						input  reset,
						input  [9:0] inCurrentPC,
						output reg regWriteOut,
						output reg memToRegOut,
						output reg [31:0]readDataOut,
						output reg [31:0]aluResultOut,
						output reg [4:0] wrOut,
						output wire PCSrcOut,	//Salida de AND entre branchIn & zero
						output reg [9:0]outCurrentPC,
						output wire [319:0] memorias
						);

wire [31:0]auxReadDataOut;
wire [3:0]address;
assign address = aluResultIn[3:0];

//RAM memoryData (
//  .clka(clk), // input clka
//  .wea(memWriteIn & ~reset), //  we=1 -> Write we=0 -> Read
//  .addra(address), // input [9 : 0] addra
//  .dina(writeDataIn), // input [31 : 0] dina
//  .douta(auxReadDataOut) // output [31 : 0] douta
//);

Memoria memoryData (
  .clka(clk), // input clka
  .wea(memWriteIn), //  we=1 -> Write we=0 -> Read
  .reset(reset),
  .addra(address), // input [9 : 0] addra
  .dina(writeDataIn), // input [31 : 0] dina
  .douta(auxReadDataOut), // output [31 : 0] douta
  .memorias(memorias)
);

assign PCSrcOut = branchIn & zero & ~reset;

always @(negedge clk)
	begin
		if (reset)begin
			regWriteOut <= 0;
			memToRegOut <= 0;
			readDataOut <= 0; 
			aluResultOut <= 0;
			wrOut <= 0;
			outCurrentPC <= 0;
		end
		else begin
			regWriteOut <= regWriteIn;
			memToRegOut <= memToRegIn;
			readDataOut <= auxReadDataOut; 
			aluResultOut <= aluResultIn;
			wrOut <= wrIn;
			outCurrentPC <= inCurrentPC;
		end
	end

endmodule