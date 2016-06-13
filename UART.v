`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:32 06/13/2016 
// Design Name: 
// Module Name:    UART 
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
module UART(
	 input clock,
    input reset,
    input rx,
	 input rd_uart,
	 input tx_done,
	 input [7:0] t_data,
	 output [7:0] rx_buf_out,	 
    output tx,
	 output tx_busy,
	 output rx_ready
    );
	 
// Declaracion de señales
wire tick, rx_done_tick, tx_done_tick, tx_start;
wire [7:0] rx_data_out, tx_buf_out;

assign tx_busy = tx_start;

// Definimos el Baud Rate Generator
Baud_Rate Baud_Rate_unit(
	.clock(clock), 
	.tick(tick));

// Definimos unidad RX
Rx Rx_unit(
	.clock(clock), 
	.reset(reset), 
	.rx(rx), 
	.s_tick(tick), 
	.rx_done_tick(rx_done_tick), 
	.dout(rx_data_out));

// Definimos unidad de Interfaz RX
FF_Buf_Interface FF_Buf_Interface_Rx_unit(
	.clock(clock), 
	.reset(reset), 
	.clr_flag(rd_uart), 
	.set_flag(rx_done_tick), 
	.din(rx_data_out), 
	.dout(rx_buf_out), 
	.flag(rx_ready));
	
// Definimos unidad de Interfaz TX
FF_Buf_Interface FF_Buf_Interface_Tx_unit(
	.clock(clock), 
	.reset(reset), 
	.clr_flag(tx_done_tick), 
	.set_flag(tx_done), 
	.din(t_data), 
	.dout(tx_buf_out), 
	.flag(tx_start));
	
//Definimos unidad TX
Tx Tx_unit(
	.clock(clock), 
	.reset(reset), 
	.s_tick(tick), 
	.tx_start(tx_start), 
	.tx_done_tick(tx_done_tick), 
	.din(tx_buf_out), 
	.tx(tx));

endmodule
