`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:57 05/09/2016 
// Design Name: 
// Module Name:    DebuggerRx
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
module DebuggerRx_2(
		input wire clk,
		input wire [7:0] r_data, // entrada que proviene del debugger pc e indica que hacer
		input wire rx_ready, // entrada que indica si la cola de entrada esta vacia
		input wire global_reset,// entrada que proviene del pulsador de la placa e indica un reset global
		//input wire program_finished, // entrada que viene de la pipe e indica que terminó de ejecutar
		//input wire data_sent, // entrada que viene del modulo transmisor a la pc que indica que terminó de enviar
		output reg rd_uart, // salida que indica al modulo receptor que me de el proximo dato de la cola
		//output reg pipeline_reset, // salida que indica a la pipeline que se resetee
		//output wire pipeline_clk, // clock que hace ejecutar a la pipeline
		output reg send_signal,// indica al modulo tx que debe mandar data
		output reg [1719:0] sendData
		//output reg [2:0] current_state
    );
	 
always@(posedge clk)
//begin
	if (global_reset) 
		begin
			rd_uart<=0;
			send_signal<=0;
			sendData<=0;
		end
	
	else begin 
			if(rx_ready)
				begin
					sendData[1719:0]<={215{r_data+1'b1}};	//Replicamos la info recibida 220 veces
					rd_uart<=1;
					send_signal<=1;
				end
				else
					begin
						rd_uart<=0;
						send_signal<=0;
						sendData<=0;
					end

//		sendData [1759:0] <= {220{8'd5}};
//		rd_uart <= 1'b1;
//		send_signal <= 1'b1;

		end

endmodule
