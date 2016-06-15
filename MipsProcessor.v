`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:55:04 05/15/2016 
// Design Name: 
// Module Name:    MipsProcessor 
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
module MipsProcessor(
    );

////////// FPGA SIGNALS////////////	
	wire globalClk;//OUT: Clock FPGA - IN: DebuggerTx, DebuggerRx
	wire global_reset;//OUT: Reset button FPGA - IN: DebuggerTx, DebuggerRx
	
////////// OUTPUTS UART ////////////
	wire [1:0] r_data; //OUT: uart - IN: DebuggerRx
	wire txUARTFull; ////OUT: uart - IN: DebuggerTx
	wire rx_empty;//OUT: uart - IN: DebuggerRx
	
////////// OUTPUTS DebuggerTx ////////////
	wire wr_uart; //OUT: DebuggerTx - IN: uart
	wire data_sent; //OUT: DebuggerTx - IN: DebuggerRx	
	wire [7:0] w_data; //OUT: DebuggerTx - IN: uart
	
////////// OUTPUTS DebuggerRx ////////////
	wire rd_uart; //OUT: DebuggerRx - IN: uart
	wire pipelineReset; //OUT: DebuggerRx - IN: Pipeline, EndDetector
	wire pipelineClk; //OUT: DebuggerRx - IN: Pipeline, EndDetector
	wire send_data_signal; //OUT: DebuggerRx - IN: DebuggerTx
	
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
	wire [4:0] writeRegister_MEMWB;
	wire [9:0] CurrentPC_MEMWB;//#33



EndProgramDetector endDetector (
    .pipeClk(pipelineClk), 
    .instruction_IFID(instruction_IFID), 
    .reset(pipelineReset), 
    .programEnd(program_finished)
    );


DebuggerRx debuggerRx (
    .clk(globalClk), 
    .r_data(r_data), 
    .rx_empty(rx_empty), 
    .global_reset(global_reset), 
    .program_finished(program_finished), 
    .data_sent(data_sent), 
    .rd_uart(rd_uart), 
    .pipeline_reset(pipelineReset), 
    .pipeline_clk(pipelineClk),
	 .send_data(send_data_signal)
    );

//DebuggerTx debuggerTx (
//    .clk(globalClk), 
//    .reset(global_eset), 
//    .txUARTFull(txUARTFull), 
//	 .sendSignal(send_data_signal),
//    .sendData({
//					PC_IFID,//#1
//					instruction_IFID,//#2
//					Registers,//#3
//					MemToReg_IDEX,//#4
//					RegWrite_IDEX,//#5
//					Branch_IDEX,//#6
//					MemRead_IDEX,//#7
//					MemWrite_IDEX,//#8	
//					RegDst_IDEX,//#9
//					ALUOp_IDEX,//#10
//					ALUSrc_IDEX,//#11
//					PC_IDEX,//#12
//					regA_IDEX,//#13
//					regB_IDEX,//#14
//					signExtend,//#15
//					rt,//#16
//					rd,//#17	
//					MemToReg_EXMEM,//#18
//					RegWrite_EXMEM,//#19	
//					Branch_EXMEM,//#20
//					MemRead_EXMEM,//#21
//					MemWrite_EXMEM,//#22
//					CurrentPC_EXMEM,//#23
//					PCJump,//#24
//					zero,//#25
//					ALUResult_EXMEM,//#26
//					regB_EXMEM,//#27
//					wr_EXMEM,//#28	
//					PCSrc_MEMIF,//#29
//					Memorias, //#30
//					MemToReg_MEMWB,//#31	
//					regWrite_WBID,//#32	
//					CurrentPC_MEMWB,//#33	
//					readData_MEMWB,//#34
//					ALUResult_MEMWB,//#35	
//					writeRegister_WBID,//#36
//					writeData_WBID//#37 
//	 }),  
//    .wr_uart(wr_uart), 
//    .dataSent(data_sent), 
//    .w_data(w_data)
//    );



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
    .writeRegister_MEMWB(writeRegister_MEMWB), 
    .CurrentPC_MEMWB(CurrentPC_MEMWB)
    );
	 
	 

endmodule
/*	wire [9:0] PC_IFID;//#1
	wire [31:0] instruction;//#2
	wire [1023:0] Registers;//#3
	wire MemToReg_IDEX;//#4
	wire RegWrite_IDEX;//#5
	wire Branch_IDEX;//#6
	wire MemRead_IDEX;//#7
	wire MemWrite_IDEX;//#8	
	wire RegDst_IDEX;//#9
	wire [1:0] ALUOp_IDEX;//#10
	wire ALUSrc_IDEX;//#11
	wire [9:0]PC_IDEX;//#12
	wire [31:0] regA_IDEX;//#13
	wire [31:0] regB_IDEX;//#14
	wire [31:0] signExtend;//#15
	wire [4:0] rt;//#16
	wire [4:0] rd;//#17	
	wire MemToReg_EXMEM;//#18
	wire RegWrite_EXMEM;//#19	
	wire Branch_EXMEM;//#20
	wire MemRead_EXMEM;//#21
	wire MemWrite_EXMEM;//#22
	wire [9:0]CurrentPC_EXMEM;//#23
	wire [9:0] PCJump;//#24
	wire zero;//#25
	wire [31:0] ALUResult_EXMEM;//#26
	wire [31:0] regB_EXMEM;//#27
	wire [4:0] wr_EXMEM;//#28	
	wire PCSrc_MEMIF;//#29
	wire [319:0] Memorias; //#30
	wire MemToReg_MEMWB;//#31	
	wire regWrite_WBID;//#32	
	wire [9:0] CurrentPC_MEMWB;//#33	
	wire [31:0] readData_MEMWB;//#34
	wire [31:0] ALUResult_MEMWB;//#35	
	wire [4:0] writeRegister_WBID;//#36
	wire [31:0] writeData_WBID;//#37*/

