`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:29:27 05/16/2016
// Design Name:   DebuggerRx
// Module Name:   E:/ID funca/Intruction-Decode/Intruction-Decode/DebuggerRxTest.v
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

module DebuggerRxTest;
	// Inputs
	reg globalClk;
	reg [1:0] r_data;
	reg rx_empty;
	reg global_reset;
	reg program_finished;
	reg data_sent;

	// Outputs
	wire rd_uart;
	wire pipeline_reset;
	wire pipeline_clk;
	wire send_data;

	// Instantiate the Unit Under Test (UUT)
	DebuggerRx uut (
		.clk(globalClk), 
		.r_data(r_data), 
		.rx_empty(rx_empty), 
		.global_reset(global_reset), 
		.program_finished(program_finished), 
		.data_sent(data_sent), 
		.rd_uart(rd_uart), 
		.pipeline_reset(pipeline_reset), 
		.pipeline_clk(pipeline_clk), 
		.send_data(send_data)
	);

	initial begin
		// Initialize Inputs
	globalClk = 0;
	global_reset = 0;
	r_data = 0; 
	rx_empty = 1;
	data_sent =0;
	program_finished =0;
		forever #50 globalClk = ~globalClk;
	end
      
	initial begin
	////HARDWARE RESET///////
	#125
	global_reset = 1;
	#125
	// bajo la bandera de reset
	global_reset = 0;
	#100
	////RUN ALL - EJECUCION CONTINUA///////
	rx_empty =0;//aviso que llegó un mensaje
	r_data = 2'b10;//run all
	#100
	rx_empty = 1;
	#500
	program_finished = 1;//mando señal de programa finalizado
	#300
	data_sent=1;
	program_finished =0;
	#200
	data_sent =0;
	////SOFTWARE RESET///////
	rx_empty =0;//aviso que llegó un mensaje
	r_data = 2'b11;//reset
	#100;
	rx_empty = 1;
	#500
	data_sent=1;
	#200
	data_sent =0;
	////ONE STEP///////
	rx_empty =0;//aviso que llegó un mensaje
	r_data = 2'b01;//one step
	#100;
	rx_empty = 1;
	#500
	data_sent=1;
	#200
	data_sent =0;
	
	end
	
endmodule

