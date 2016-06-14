`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:54:14 10/30/2013 
// Design Name: 
// Module Name:    Test 
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
module DebuggerRx(
	 input clock,
	 input reset,
    input [7:0] r_data,
    input rx_ready,
	 output reg sendSignal,	 
    output reg rd_uart,
	 output reg [1759:0] sendData
    );


always@(posedge clock)
//begin
	if (reset) 
		begin
			rd_uart<=0;
			sendSignal<=0;
			sendData<=0;
		end
	
	else begin 
			if(rx_ready)
				begin
					sendData[1759:0]<={220{r_data+1'b1}};	//Replicamos la info recibida 220 veces
					rd_uart<=1;
					sendSignal<=1;
				end
				else
					begin
						rd_uart<=0;
						sendSignal<=0;
						//sendData<=0;
					end

//		sendData [1759:0] <= {220{8'd5}};
//		rd_uart <= 1'b1;
//		sendSignal <= 1'b1;

		end



endmodule
