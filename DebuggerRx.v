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
	 input dataSent,
	 output reg sendSignal,	 
    output reg rd_uart,
	 output reg [1759:0] sendData,
	 output reg [2:0] current_state
    );
	 


///////ESTADOS POSIBLES/////////
localparam [2:0] WAITING = 0, SENDING = 1, ONE_STEP = 2, RUN_ALL = 3, SOFTWARE_RESET = 4, UNKNOWN_COMMAND = 5;

 //HARDWARE_RESET = 0, , RECEIVING = 2, DATA_IN = 3, , SENDING_DATA = 7;
///////INPUTS r_data POSIBLES//////
localparam [7:0] GOTO_ONE_STEP =8'b00110001, GOTO_RUN_ALL = 8'b00110010, GOTO_SOFTWARE_RESET = 8'b00110011;
												

always@(negedge clock)begin

if(reset) begin
	rd_uart<=0;
	sendSignal<=0;
	sendData<=0;
	current_state <= WAITING;
end

else
	case (current_state)
		WAITING: begin
			if(rx_ready)begin
				//sendData[1759:0]<={220{r_data+1'b1}};
				
				case (r_data)
					GOTO_ONE_STEP: begin
						current_state <= ONE_STEP;
					end
					GOTO_RUN_ALL: begin
						current_state <= RUN_ALL;
					end
					GOTO_SOFTWARE_RESET: begin
						current_state <= SOFTWARE_RESET;
					end
					default begin
						current_state <= UNKNOWN_COMMAND;
					end
				endcase
			end
		end
		ONE_STEP: begin
			//sendData[1759:0]<={220{8'b01010101}};	//Replicamos la info recibida 220 veces
			sendData[1759:0]<={220{r_data+2'b01}};
			current_state <= SENDING;
			sendSignal<=1;
			rd_uart<=1;
		end
		RUN_ALL: begin
			//sendData[1759:0]<={220{8'b11111111}};	//Replicamos la info recibida 220 veces
			sendData[1759:0]<={220{r_data+2'b10}};
			current_state <= SENDING;
			sendSignal<=1;
			rd_uart<=1;
		end
		SOFTWARE_RESET: begin
			//sendData[1759:0]<={220{8'b11001100}};	//Replicamos la info recibida 220 veces
			sendData[1759:0]<={220{r_data+2'b11}};
			current_state <= SENDING;
			sendSignal<=1;
			rd_uart<=1;
		end
		UNKNOWN_COMMAND: begin
			//sendData[1759:0]<={220{8'b00001000}};	//Replicamos la info recibida 220 veces
			sendData[1759:0]<={220{8'b00000000}};
			current_state <= SENDING;
			sendSignal<=1;
			rd_uart<=1;
		end
		SENDING: begin
			rd_uart<=0;
			sendSignal<=0;
			if (dataSent) current_state <= WAITING;		
		end
	endcase
	
end

endmodule
