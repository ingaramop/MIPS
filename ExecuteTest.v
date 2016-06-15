`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:45:07 11/20/2015
// Design Name:   Execute
// Module Name:   E:/MIPS/MIPS/ExecuteTest.v
// Project Name:  MIPS
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

module ExecuteTest;

	// Inputs
	reg [31:0] signExtend;
	reg [31:0] inData1;
	reg [31:0] inData2;
	reg [9:0] inPC;
	reg [4:0] rt;
	reg [4:0] rd;
	reg clock;
	reg [1:0] aluOp;
	reg aluSrc;
	reg regDst;
	reg reset;

	// Outputs
	wire [9:0] outPC;
	wire zero;
	wire [31:0] aluResult;
	wire [31:0] outData2;
	wire [4:0] wr;

	// Instantiate the Unit Under Test (UUT)
	Execute uut (
		.signExtend(signExtend), 
		.inData1(inData1), 
		.inData2(inData2), 
		.inPC(inPC), 
		.rt(rt), 
		.rd(rd), 
		.clock(clock), 
		.aluOp(aluOp), 
		.aluSrc(aluSrc), 
		.inRegDst(regDst),
		.reset(reset),
		.outPC(outPC), 
		.zero(zero), 
		.aluResult(aluResult), 
		.outData2(outData2), 
		.wr(wr)
	);

	initial begin
		// Initialize Inputs
		signExtend = 0;
		inData1 = 0;
		inData2 = 0;
		inPC = 0;
		rt = 0;
		rd = 0;
		clock = 1;
		aluOp = 0;
		aluSrc = 0;
		regDst = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// 1 prueba. Suma 8 + 3, paso el registro rt
		signExtend = 32'b100000;// los ultimos 6 bits indican operacion tipo R de suma
		inData1 = 8;
		inData2 = 3;
		inPC = 512;
		rt = 1;
		rd = 2;
		aluOp = 2'b10; //operación tipo R
		aluSrc = 0;// selector de data 2 en vez de sign extend
		regDst = 0;// selector de registro rt en vez de rd
		#50
		clock = 0; // flanco negedge
		#50
		clock = 1;

		// 2 prueba. Resta 65271 - 65261, paso el registro rd
		signExtend = 32'b100010;// los ultimos 6 bits indican operacion tipo R de add
		inData1 = 65271;
		inData2 = 65261;
		inPC = 512;
		rt = 1;
		rd = 2;
		aluOp = 2'b10; //operación tipo R
		aluSrc = 0;// selector de data 2 en vez de sign extend
		regDst = 1;// selector de registro rd en vez de rt
		#50
		clock = 0; // flanco negedge
		#50
		clock = 1;
		
		// 3 prueba. set on less tha , paso el registro rd
		signExtend = 32'b101010;// los ultimos 6 bits indican operacion tipo R de set on less than
		inData1 = 456758797;
		inData2 = 456758798;
		inPC = 512;
		rt = 1;
		rd = 2;
		aluOp = 2'b10; //operación tipo R
		aluSrc = 0;// selector de data 2 en vez de sign extend
		regDst = 1;// selector de registro rd en vez de rt
		#50
		clock = 0; // flanco negedge
		#50
		clock = 1;
		
		// 4 prueba. and , paso el registro rd
		signExtend = 32'b100100;// los ultimos 6 bits indican operacion tipo R de and
		inData1 = 65879007;
		inData2 = 12364546;
		inPC = 512;
		rt = 1;
		rd = 2;
		aluOp = 2'b10; //operación tipo R
		aluSrc = 0;// selector de data 2 en vez de sign extend
		regDst = 1;// selector de registro rd en vez de rt
		#50
		clock = 0; // flanco negedge
		#50
		clock = 1;
		
		// 5 prueba. load o store , paso el registro rd
		signExtend = 16;// los ultimos 6 bits indican operacion tipo R de set on less than
		inData1 = 10;
		inData2 = 30;
		inPC = 512;
		rt = 1;
		rd = 2;
		aluOp = 2'b00; //operación tipo I?
		aluSrc = 1;// selector de data 2 en vez de sign extend
		regDst = 1;// selector de registro rd en vez de rt
		#50
		clock = 0; // flanco negedge
		#50
		clock = 1;
		
		// 6 prueba. beq , paso el registro rd
		signExtend = 2;// los ultimos 6 bits indican operacion tipo R de set on less than
		inData1 = 10;
		inData2 = 10;
		inPC = 512;
		rt = 1;
		rd = 2;
		aluOp = 2'b01; //operación tipo I?
		aluSrc = 0;// selector de data 2 en vez de sign extend
		regDst = 1;// selector de registro rd en vez de rt
		#50
		clock = 0; // flanco negedge
		#50
		clock = 1;

	end
      
endmodule

