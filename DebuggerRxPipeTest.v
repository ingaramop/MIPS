`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:12:57 05/16/2016
// Design Name:   DebuggerRx
// Module Name:   E:/ID funca/Intruction-Decode/Intruction-Decode/DebuggerRxPipeTest.v
// Project Name:  Intruction-Decode
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DebuggerRx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DebuggerRxPipeTest;

	reg clock;//OUT: Clock FPGA - IN: DebuggerTx, DebuggerRx
	reg reset;//OUT: Reset button FPGA - IN: DebuggerTx, DebuggerRx
	///////OUTPUTS UART////////
	reg rx_ready;
	reg [7:0] rx_buf_out;	
	///////OUTPUTS DEBUGGER TX///////////
	reg dataSent;
	
	///////OUTPUTS DEBUGGER RX///////////
	wire rd_uart, sendSignal;
	wire pipelineReset; //OUT: DebuggerRx - IN: Pipeline, EndDetector
	wire pipelineClk; //OUT: DebuggerRx - IN: Pipeline, EndDetector

	////////// OUTPUTS EndDetector ////////////	
	wire program_finished; //OUT: EndDetector - IN: DebuggerRx
	

	
////////// OUTPUTS Pipeline ////////////	
	//inputs if	 
	wire PCSrc_MEMIF;//#29
	wire [9:0] PCJump;//#24
	wire [31:0] instruction_IFID;//#2
	wire [9:0] PC_IFID;//#1
	wire regWrite_WBID;//#32
	wire [4:0] writeRegister_WBID;//#36
	wire [31:0] writeData_WBID;//#37
	wire [1023:0] Registers;//#3
	wire RegDst_IDEX;//#9
	wire [1:0] ALUOp_IDEX;//#10
	wire ALUSrc_IDEX;//#11
	wire Branch_IDEX;//#6
	wire MemRead_IDEX;//#7
	wire MemWrite_IDEX;//#8
	wire MemToReg_IDEX;//#4
	wire RegWrite_IDEX;//#5
	wire [9:0]PC_IDEX;//#12
	wire [31:0] regA_IDEX;//#13
	wire [31:0] regB_IDEX;//#14
	wire [31:0] signExtend;//#15
	wire [4:0] rt;//#16
	wire [4:0] rd;//#17
	wire Branch_EXMEM;//#20
	wire MemRead_EXMEM;//#21
	wire MemWrite_EXMEM;//#22
	wire MemToReg_EXMEM;//#18
	wire RegWrite_EXMEM;//#19
	wire [9:0]CurrentPC_EXMEM;//#23
	wire zero;//#25
	wire [31:0] ALUResult_EXMEM;//#26
	wire [31:0] regB_EXMEM;//#27
	wire [4:0] wr_EXMEM;//#28
	wire [319:0] Memorias; //#30
	wire MemToReg_MEMWB;//#31
	wire [31:0] readData_MEMWB;//#34
	wire [31:0] ALUResult_MEMWB;//#35
	wire [9:0] CurrentPC_MEMWB;//#33


		reg [4:0] pipe_clk_counter;
always @(negedge pipelineClk)begin
	if (pipelineReset) pipe_clk_counter =0;
	else pipe_clk_counter = pipe_clk_counter + 1'b1;
end	

DebuggerRx debuggerrx_unit (
    .clock(clock),
	 .reset(reset),	
    .r_data(rx_buf_out), 
    .rx_ready(rx_ready),
	 .dataSent(dataSent),
	 .program_finished(program_finished),
    .sendSignal(sendSignal), 
    .rd_uart(rd_uart), 
	 .current_state(current_state),
	 .pipelineClk(pipelineClk),
	 .pipelineReset(pipelineReset)
    );
	 
EndProgramDetector endDetector (
    .pipeClk(pipelineClk), 
    .instruction_IFID(instruction_IFID), 
    .reset(pipelineReset), 
    .programEnd(program_finished)
    );
	 
Pipeline pipeline (
    .clk(pipelineClk), 
    .reset(pipelineReset), 
    .PCSrc_MEMIF(PCSrc_MEMIF), 
    .PCJump(PCJump), 
    .instruction(instruction_IFID), 
    .PC_IFID(PC_IFID), 
    .regWrite_WBID(regWrite_WBID), 
    .writeRegister_WBID(writeRegister_WBID), 
    .writeData_WBID(writeData_WBID), 
    .Registers(Registers), 
    .RegDst_IDEX(RegDst_IDEX), 
    .ALUOp_IDEX(ALUOp_IDEX), 
    .ALUSrc_IDEX(ALUSrc_IDEX), 
    .Branch_IDEX(Branch_IDEX), 
    .MemRead_IDEX(MemRead_IDEX), 
    .MemWrite_IDEX(MemWrite_IDEX), 
    .MemToReg_IDEX(MemToReg_IDEX), 
    .RegWrite_IDEX(RegWrite_IDEX), 
    .PC_IDEX(PC_IDEX), 
    .regA_IDEX(regA_IDEX), 
    .regB_IDEX(regB_IDEX), 
    .signExtend(signExtend), 
    .rt(rt), 
    .rd(rd), 
    .Branch_EXMEM(Branch_EXMEM), 
    .MemRead_EXMEM(MemRead_EXMEM), 
    .MemWrite_EXMEM(MemWrite_EXMEM), 
    .MemToReg_EXMEM(MemToReg_EXMEM), 
    .RegWrite_EXMEM(RegWrite_EXMEM), 
    .CurrentPC_EXMEM(CurrentPC_EXMEM), 
    .zero(zero), 
    .ALUResult_EXMEM(ALUResult_EXMEM), 
    .regB_EXMEM(regB_EXMEM), 
    .wr_EXMEM(wr_EXMEM), 
    .Memorias(Memorias), 
    .MemToReg_MEMWB(MemToReg_MEMWB), 
    .readData_MEMWB(readData_MEMWB), 
    .ALUResult_MEMWB(ALUResult_MEMWB), 
    .CurrentPC_MEMWB(CurrentPC_MEMWB)
    );


	

	initial begin
		// Initialize Inputs
	clock = 0;
	reset = 0;
	rx_buf_out = 0; 
	rx_ready = 0;
	dataSent =0;
		forever #50 clock = ~clock;

		forever #50 clock = ~clock;
	end
      
	initial begin
	////HARDWARE RESET///////
	reset = 1;
	#200
	// bajo la bandera de reset
	reset = 0;
	#500
	////ONE STEP///////
	rx_ready =1;//aviso que llegó un mensaje
	rx_buf_out = 8'b00110001;//one step
	#100;
	rx_ready = 0;
	#500
	dataSent=1;
	#200
	dataSent =0;
	#500
		////ONE STEP///////
	rx_ready =1;//aviso que llegó un mensaje
	rx_buf_out = 8'b00110001;//one step
	#100;
	rx_ready = 0;
	#500
	dataSent=1;
	#200
	dataSent =0;
			////ONE STEP///////
	rx_ready =1;//aviso que llegó un mensaje
	rx_buf_out = 8'b00110001;//one step
	#100;
	rx_ready = 0;
	#500
	dataSent=1;
	#200
	dataSent =0;
	////SOFTWARE RESET///////
	rx_ready =1;//aviso que llegó un mensaje
	rx_buf_out = 8'b00110011;//reset
	#100;
	rx_ready = 0;
	#500
	dataSent=1;
	#200
	dataSent =0;
	////RUN ALL///////
	rx_ready =1;//aviso que llegó un mensaje
	rx_buf_out = 8'b00110010;//run all
	#100;
	rx_ready = 0;

	end
endmodule

