`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:47 05/15/2016 
// Design Name: 
// Module Name:    DebuggerTx 
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
module DebuggerTx(
		input clk, reset,
		input txUARTFull,
		input sendSignal,
		input [1759:0] sendData,
		output wr_uart,
		output dataSent,
		output [7:0] w_data
    );


endmodule
