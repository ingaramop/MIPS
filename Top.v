`timescale 1ns / 1ps

module Top(
	input clock,
	input reset,
	input rx,
	output tx,
	output dataSent,
	output [9:0] PC_IFID,//#1
	output [2:0] current_state,
	output [1:0] state_reg_tx,
	output reg [3:0] pipe_clk_counter,
	output testigo
    );
 
	 
// Declaracion de seales

///////OUTPUTS UART////////
wire rx_ready, tx_busy;
wire [7:0] rx_buf_out;

///////OUTPUTS DEBUGGER TX///////////
wire [7:0] t_data;
wire tx_done;

///////OUTPUTS DEBUGGER RX///////////
wire rd_uart, sendSignal;
wire pipelineReset; //OUT: DebuggerRx - IN: Pipeline, EndDetector
wire pipelineClk; //OUT: DebuggerRx - IN: Pipeline, EndDetector

////////// OUTPUTS EndDetector ////////////	
wire program_finished; //OUT: EndDetector - IN: DebuggerRx
wire clear_program_finished; //OUT: DebuggerRx  -  IN: EndDetector 

////////// OUTPUTS Pipeline ////////////	
	//inputs if	 
	wire PCSrc_MEMIF;//#29
	wire [9:0] PCJump;//#24
	wire [31:0] instruction_IFID;//#2
	//wire [9:0] PC_IFID;//#1
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
	wire [4:0] rs;//#17 bis
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
	
	wire [1728:0] BusDebugger = {
											22'b00000000, // Relleno
											PC_IFID, //#1
											instruction_IFID,//#2						
											Registers,//#3
											MemToReg_IDEX,//#4
											RegWrite_IDEX,//#5
											Branch_IDEX,//#6
											MemRead_IDEX,//#7
											MemWrite_IDEX,//#8	
											RegDst_IDEX,//#9
											ALUOp_IDEX,//#10
											ALUSrc_IDEX,//#11
											PC_IDEX,//#12
											regA_IDEX,//#13
											regB_IDEX,//#14
											signExtend,//#15
											rt,//#16
											rd,//#17	
											MemToReg_EXMEM,//#18
											RegWrite_EXMEM,//#19	
											Branch_EXMEM,//#20
											MemRead_EXMEM,//#21
											MemWrite_EXMEM,//#22
											CurrentPC_EXMEM,//#23
											PCJump,//#24
											zero,//#25
											ALUResult_EXMEM,//#26
											regB_EXMEM,//#27
											wr_EXMEM,//#28	
											PCSrc_MEMIF,//#29
											Memorias, //#30
											MemToReg_MEMWB,//#31	
											regWrite_WBID,//#32	
											CurrentPC_MEMWB,//#33	
											readData_MEMWB,//#34
											ALUResult_MEMWB,//#35	
											writeRegister_WBID,//#36
											writeData_WBID,//#37
											rs, //#17 bis
											11'b0}; // Relleno



assign testigo = program_finished;
//assign PC_IFID_reg = PC_IFID;

// Instantiate the module
UART UART_Unit (
    .clock(clock), 
    .reset(reset), 
    .rx(rx), 
    .rd_uart(rd_uart), 
    .tx_done(tx_done), 
    .t_data(t_data), 
    .rx_buf_out(rx_buf_out), 
    .tx(tx),
	 .tx_busy(tx_busy),
	 .rx_ready(rx_ready)
    );

// Instantiate the module
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
	 .pipelineReset(pipelineReset),
	 .clear_program_finished(clear_program_finished)
    );

// Instantiate the module
DebuggerTx debuggertx_unit (
    .clk(clock), 
    .reset(reset), 
    .sendSignal(sendSignal),	
    .sendData(BusDebugger), 
    .tx_busy(tx_busy), 
    .wr_uart(tx_done), 
    .dataSent(dataSent), 
    .w_data(t_data),
	 .state_reg_tx(state_reg_tx)
    );
	 
// Instantiate the module
EndProgramDetector instance_name (
    .pipeClk(pipelineClk), 
    .instruction_IFID(instruction_IFID), 
//    .instruction_IFID(BusDebugger[41:10]), //
    .reset(pipelineReset), 
    .clear_program_finished(clear_program_finished), 
    .programEnd(program_finished)
    );

Pipeline pipeline (
    .clk(pipelineClk), 
    .reset(pipelineReset), 
    .branchFlag(PCSrc_MEMIF), 
    .branchPC(PCJump), 
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
	 .rs(rs),	
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

endmodule
