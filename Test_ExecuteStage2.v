`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:47:21 07/19/2016
// Design Name:   Execute
// Module Name:   C:/Users/Tincho/Xilinx/MIPS completo con errores/MIPS/Test_ExecuteStage2.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Execute
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_ExecuteStage2;

	// Inputs
	reg clock;
	reg reset;
	reg inBranch;
	reg inMemRead;
	reg inMemWrite;
	reg inMemToReg;
	reg inRegWrite;
	reg [9:0] inPC;
	reg [31:0] inData1;
	reg [31:0] inData2;
	reg [31:0] signExtend;
	reg [4:0] rt;
	reg [4:0] rd;
	reg [1:0] aluOp;
	reg aluSrc;
	reg inRegDst;
	reg [1:0] inForwardingA;
	reg [1:0] inForwardingB;
	reg inHazard;
	reg [31:0] outmux_WBEXE;
	reg [31:0] aluResult_MEMEXE;

	// Outputs
	wire [9:0] outPC;
	wire zero;
	wire [31:0] aluResult;
	wire [31:0] outData2;
	wire [4:0] wr;
	wire outBranch;
	wire outMemRead;
	wire outMemWrite;
	wire outMemToReg;
	wire outRegWrite;
	wire [9:0] outCurrentPC;

	// Instantiate the Unit Under Test (UUT)
	Execute uut (
		.clock(clock), 
		.reset(reset), 
		.inBranch(inBranch), 
		.inMemRead(inMemRead), 
		.inMemWrite(inMemWrite), 
		.inMemToReg(inMemToReg), 
		.inRegWrite(inRegWrite), 
		.inPC(inPC), 
		.inData1(inData1), 
		.inData2(inData2), 
		.signExtend(signExtend), 
		.rt(rt), 
		.rd(rd), 
		.aluOp(aluOp), 
		.aluSrc(aluSrc), 
		.inRegDst(inRegDst), 
		.inForwardingA(inForwardingA), 
		.inForwardingB(inForwardingB), 
		.outmux_WBEXE(outmux_WBEXE), 
		.aluResult_MEMEXE(aluResult_MEMEXE), 
		.outPC(outPC), 
		.zero(zero), 
		.aluResult(aluResult), 
		.outData2(outData2), 
		.wr(wr), 
		.outBranch(outBranch), 
		.outMemRead(outMemRead), 
		.outMemWrite(outMemWrite), 
		.outMemToReg(outMemToReg), 
		.outRegWrite(outRegWrite), 
		.outCurrentPC(outCurrentPC)
	);
	
	initial begin
		clock = 0;
		reset =0;
		forever #50 clock = ~clock;
	end

	initial begin
		// Initialize Inputs
		inBranch = 0;	//Bandera (pasa-mano)
		inMemRead = 0; //Bandera (pasa-mano)
		inMemWrite = 0; //Bandera (pasa-mano)
		inMemToReg = 0; //Bandera (pasa-mano)
		inRegWrite = 0; //Bandera (pasa-mano)
		inRegDst = 0; //Flag que elije el registro destino de una operación entre Rt y Rd
		aluSrc = 0; //Flag que selecciona entre el 2do operando de la ALU entre signExtend y la salida del MUX_FRWD_B
		aluOp = 2'b00; //Código de operación de la ALU provisto por la unidad de control (UC)		
		
		inPC = 0; //Contador del programa
		inData1 = 0; //Salida 1 del banco de registros (regA), correspondiente a Rs
		inData2 = 0; //Salida 2 del banco de registros (regB), correspondiente a Rt
		signExtend = 0; //Extensión de signo de Intruction[15:0]
		rt = 0; //Dirección dentro del banco de registros de Rt (Segundo operando de la instrucción)
		rd = 0; //Dirección dentro del banco de registros de Rd (Operando destino de una operación)
		
		inForwardingA = 2'b00; //Selector del MUX_FRWD_A (salida de Unidad de Forwarding)
		inForwardingB = 2'b00; //Selector del MUX_FRWD_B (salida de Unidad de Forwarding)
		outmux_WBEXE = 0; //Salida del MUX con DATOS de la etapa WriteBack. Son los 32 bits que van a escribirse en un registro si RegWrite = 1 y Rd es válida.
		aluResult_MEMEXE = 0; //Resultado de la ALU de la próxima intrucción (Dirección de memoria).
		#100;
        
		// 	Simulación operación AND sin riesgos de datos o estructurales
		//		and 	$t4, $t2, $t5;	#  t4 = t2 AND t5 (t2=1 , t5=1 --> t4=1)
		//		000000 	01010	01101	01100 00000 100100
		//		opcode	 rs	rt		rd		 [sa]	function
		
		// Esta es la salida del ALUControl para todas las intrucciones tipo R
		inRegDst = 1; //Rd
		aluSrc = 0; //salida del MUX_FRWD_B
		aluOp = 2'b10; //operación R-type		
		
		inPC = 1; //Contador del programa
		inData1 = 1; //Salida 1 del banco de registros (regA), correspondiente a Rs
		inData2 = 1; //Salida 2 del banco de registros (regB), correspondiente a Rt
		signExtend = 32'b00000000_00000000_01100000_00100100; //Extensión de signo de Intruction[15:0]
		rt = 5'b01101; //Dirección dentro del banco de registros de Rt (Segundo operando de la instrucción)
		rd = 5'b01100; //Dirección dentro del banco de registros de Rd (Operando destino de una operación)
		
		inForwardingA = 2'b00; //Selector del MUX_FRWD_A: RegA (Banco de registros)
		inForwardingB = 2'b00; //Selector del MUX_FRWD_B: RegB (Banco de registros)
		inHazard = 1; //Flag hazard: No hay riesgo detectado
		outmux_WBEXE = 0; //Salida del MUX con DATOS de la etapa WriteBack.
		aluResult_MEMEXE = 0; //Resultado de la ALU de la próxima intrucción (Dirección de memoria).
		#100;
		
		// 	Simulación operación AND CON riesgos de datos (1)
		//		and 	$t4, $t2, $t5;	#  t4 = t2 AND t5 (t2=1 , t5=2 --> t4=0)
		//		000000 	01010	01101	01100 00000 100100
		//		opcode	 rs	rt		rd		 [sa]	function
		
		inForwardingA = 2'b10; //Selector del MUX_FRWD_A: El 1er operando de la ALU es anticipado del anterior 
		//resultado de la ALU (aluResult_MEMEXE)
		inForwardingB = 2'b00; //Selector del MUX_FRWD_B: RegB (Banco de registros)
		inHazard = 1; //Flag hazard: No hay riesgo detectado
		outmux_WBEXE = 3; //Salida del MUX con DATOS de la etapa WriteBack.
		aluResult_MEMEXE = 4; //Resultado de la ALU de la próxima intrucción (Dirección de memoria).
		#100;
		
		// 	Simulación operación AND CON riesgos de datos (1)
		//		and 	$t4, $t2, $t5;	#  t4 = t2 AND t5 (t2=1 , t5=2 --> t4=0)
		//		000000 	01010	01101	01100 00000 100100
		//		opcode	 rs	rt		rd		 [sa]	function
		
		inForwardingA = 2'b00; //Selector del MUX_FRWD_A: RegA (Banco de registros)
		inForwardingB = 2'b01; //El 2do operando de la ALU es anticipado de la memoria de datos o de un 
		//previo resultado de la ALU (outmux_WBEXE)
		inHazard = 1; //Flag hazard: No hay riesgo detectado
		outmux_WBEXE = 3; //Salida del MUX con DATOS de la etapa WriteBack.
		aluResult_MEMEXE = 4; //Resultado de la ALU de la próxima intrucción (Dirección de memoria).
		#100;

	end
      
endmodule

