`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:26 10/30/2013 
// Design Name: 
// Module Name:    Top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 * File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Top(
	input clock,
	input reset,
	input rx,
	output tx,
	output dataSent,
	output [2:0] current_state,
	output [1:0] state_reg_tx
    );
// Declaracion de se�ales
wire rx_ready, rd_uart, tx_done, sendSignal, tx_busy;
wire [7:0] rx_buf_out, t_data;
wire [1759:0] sendData;



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
    .sendSignal(sendSignal), 
    .rd_uart(rd_uart), 
    .sendData(sendData),
	 .current_state(current_state)
    );

// Instantiate the module
DebuggerTx debuggertx_unit (
    .clk(clock), 
    .reset(reset), 
    .sendSignal(sendSignal),	
    .sendData(sendData), 
    .tx_busy(tx_busy), 
    .wr_uart(tx_done), 
    .dataSent(dataSent), 
    .w_data(t_data),
	 .state_reg_tx(state_reg_tx)
    );
	 
endmodule
