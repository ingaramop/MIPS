`timescale 1ns / 1ps

module IDTest;

	// Inputs
	reg clk;
	reg [31:0] Instruction;
	reg [9:0] PCCount;
	reg regWrite;
	reg [4:0] writeRegister;
	reg [31:0] writeData;
	reg reset;

	// Outputs
	wire [1:0] ALUOpOut;
	wire RegDstOut;
	wire ALUSrcOut;
	wire BranchOut;
	wire MemReadOut;
	wire MemWriteOut;
	wire MemToRegOut;
	wire RegWriteOut;
	wire [31:0] regA;
	wire [31:0] regB;
	wire [31:0] signExtendOut;
	wire [9:0] PcCountOut;
	wire [4:0] rt;
	wire [4:0] rd;

	// Instantiate the Unit Under Test (UUT)
	InstructionDecode uut (
		.clk(clk), 
		.Instruction(Instruction), 
		.PCCount(PCCount), 
		.reset(reset),
		.ALUOpOut(ALUOpOut), 
		.RegDstOut(RegDstOut), 
		.ALUSrcOut(ALUSrcOut), 
		.BranchOut(BranchOut), 
		.MemReadOut(MemReadOut), 
		.MemWriteOut(MemWriteOut), 
		.MemToRegOut(MemToRegOut), 
		.RegWriteOut(RegWriteOut), 
		.regA(regA), 
		.regB(regB), 
		.signExtendOut(signExtendOut), 
		.PcCountOut(PcCountOut), 
		.rt(rt), 
		.rd(rd), 
		.regWrite(regWrite), 
		.writeRegister(writeRegister), 
		.writeData(writeData)
	);
	

	initial begin
		// Initialize Inputs
		clk = 0;
		Instruction = 0;
		PCCount = 0;
		regWrite = 0;
		writeRegister = 0;
		writeData = 0;
		reset = 0;
		

//PRUEBAS DE ESCRITURA. AQUÍ SOLO IMPORTA LO QUE PASE EN FLANCO DE SUBIDA.

	//prueba1. Guardo el valor 5250 en el registro registro 00000
		regWrite = 1; // write enabled
		writeRegister = 5'b00000;
		writeData = 5250;
		#40
		clk = 1; // flanco posedge para escribir
		#40
		clk = 0;
	//prueba2. Guardo el valor 100 en el registro registro 10101
		regWrite = 1; // write enabled
		writeRegister = 5'b10101;
		writeData = 100;
		#40
		clk = 1; // flanco posedge para escribir
		#40
		clk = 0;
	//prueba3. Guardo el valor 1000000 en el registro registro 11111
		regWrite = 1; // write enabled
		writeRegister = 5'b11111;
		writeData = 10000000;
		#40
		clk = 1; // flanco posedge para escribir
		#40
		clk = 0;
	//prueba4. Guardo el valor 1111111 en el registro registro 11110
		regWrite = 1; // write enabled
		writeRegister = 5'b11110;
		writeData = 1111111;
		#40
		clk = 1; // flanco posedge para escribir
		#40
		clk = 0;
	//prueba5. Guardo el valor 9999 en el registro registro 00001
		regWrite = 1; // write enabled
		writeRegister = 5'b00001;
		writeData = 9999;
		#40
		clk = 1; // flanco posedge para escribir
		#40
		
//PRUEBAS DE LECTURA. AQUÍ VERIFICAMOS QUE LAS ESCRITURAS ANTERIORES SE HAYAN ESCRITO BIEN
// Y ADEMÁS VERIFICAMOS QUE SE EFECTUEN BIEN LAS OTRAS SEÑALES DE CONTROL
		
	//prueba6. Instrucción resta
	//rd <- rs - rt
	//000000rsrtrd00000100010 (donde 100010 es el func de SUB)
	
		regWrite = 0; // DISABLED
		writeData = 0;
		writeRegister = 0;
		
		Instruction= 32'b000000_10101_11111_00000_00000100010;// rd(00000) <- rs(10101) - rt(11111)
		PCCount = 1;
		clk = 0; // negedge para pasar los valores al registro
		#40
		clk = 1; // flanco posedge para escribir
		#40;
		
	//prueba7. Instrucción lw
	//Ejemplo: (LW rt,offset(base)) 
	//100011basertoffset (donde 100011 es el funct de LB)
		Instruction= 32'b100011_11111_00000_10101_01010101010;// base=11111, rt = 00000, offset = 10101...
		PCCount = 2;
		clk = 0; // negedge para pasar los valores al registro
		#40
		clk = 1; // flanco posedge para escribir
		#40
		
	//prueba8. Instrucción beq
	//Ejemplo: (BEQ rs,rt,offset) 
	//000100rsrtoffset (donde 000100 es el funct de BEQ)
		Instruction= 32'b000100_00000_11110_00000_00000010000;// rs=00000, rt = 11110, offset = 16 decimal
		PCCount = 3;
		clk = 0; // negedge para pasar los valores al registro
		#40
		clk = 1; // flanco posedge para escribir
		#40
	//prueba9. Instrucción beq
	//Ejemplo: (BEQ rs,rt,offset) 
	//000100rsrtoffset (donde 000100 es el funct de BEQ)
		Instruction= 32'b000100_11110_00001_00000_00000010000;// rs=11110, rt = 00001, offset = 16 decimal
		PCCount = 4;
		clk = 0; // negedge para pasar los valores al registro
		#40
		clk = 1; // flanco posedge para escribir
		#40
	//prueba10. Instrucción beq
	//Ejemplo: (BEQ rs,rt,offset) 
	//000100rsrtoffset (donde 000100 es el funct de BEQ)
		Instruction= 32'b000100_00001_10101_00000_00000010000;// rs=00001, rt = 10101, offset = 16 decimal
		PCCount = 5;
		clk = 0; // negedge para pasar los valores al registro
		#40
		clk = 1; // flanco posedge para escribir
		#40
		clk = 0;
		#40;
	end
endmodule
