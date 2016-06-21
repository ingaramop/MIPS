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
	 input program_finished,
	 output reg sendSignal,	 
    output reg rd_uart,
	 //output reg [1759:0] sendData,
	 output reg [2:0] current_state,
	 output pipelineClk,
	 output reg pipelineReset
    );
	 
 

///////ESTADOS POSIBLES/////////
localparam [2:0] INITIALIZING=0, WAITING = 1, SENDING = 2, ONE_STEP = 3, RUN_ALL = 4, SOFTWARE_RESET = 5, UNKNOWN_COMMAND = 6;

 //HARDWARE_RESET = 0, , RECEIVING = 2, DATA_IN = 3, , SENDING_DATA = 7;
///////INPUTS r_data POSIBLES//////
localparam [7:0] GOTO_ONE_STEP =8'b00110001, GOTO_RUN_ALL = 8'b00110010, GOTO_SOFTWARE_RESET = 8'b00110011;

reg pipeline_clk_enable;

assign pipelineClk = clock & pipeline_clk_enable; //El clk q va a la pipe solo se habilita cuando el flag_clk_enable está arriba
												
always@(posedge clock)begin
if(reset) begin
	current_state <= INITIALIZING;
end

else
	case (current_state)
		INITIALIZING: begin
			rd_uart<=0;
			sendSignal<=0;
			pipeline_clk_enable <=1;
			pipelineReset <=1;
			current_state <=WAITING;
		end
		WAITING: begin
			rd_uart<=0;
			sendSignal<=0;
			pipeline_clk_enable <=0;
			pipelineReset <=0;
			if(rx_ready)begin
				//sendData[1759:0]<={220{r_data+1'b1}};			
				case (r_data)
					GOTO_ONE_STEP: begin
						current_state <= ONE_STEP;
						if (~program_finished)pipeline_clk_enable <= 1;
					end
					GOTO_RUN_ALL: begin
						current_state <= RUN_ALL;
						if (~program_finished)pipeline_clk_enable <= 1;
					end
					GOTO_SOFTWARE_RESET: begin
						current_state <= SOFTWARE_RESET;
						pipeline_clk_enable <= 1;
						pipelineReset <=1;
					end
					default begin
						current_state <= UNKNOWN_COMMAND;
					end
				endcase
			end
		end
		ONE_STEP: begin
			//sendData[1759:0]<={220{8'b01010101}};	//Replicamos la info recibida 220 veces
			//sendData[1759:0]<={220{r_data+2'b01}};
			pipeline_clk_enable <= 0;
			current_state <= SENDING;
			rd_uart<=1;
		end
		RUN_ALL: begin
			//sendData[1759:0]<={220{8'b11111111}};	//Replicamos la info recibida 220 veces
			//sendData[1759:0]<={220{r_data+2'b10}};
			rd_uart<=1;
			if (program_finished)begin
				pipeline_clk_enable <= 0;
				current_state <= SENDING;
			end
		end
		SOFTWARE_RESET: begin
			//sendData[1759:0]<={220{8'b11001100}};	//Replicamos la info recibida 220 veces
			//sendData[1759:0]<={220{r_data+2'b11}};
			current_state <= SENDING;
			rd_uart<=1;
			pipeline_clk_enable <= 0;
			pipelineReset <=0;
		end
		UNKNOWN_COMMAND: begin
			//sendData[1759:0]<={220{8'b00001000}};	//Replicamos la info recibida 220 veces
			//sendData[1759:0]<={220{8'b00000000}};
			current_state <= SENDING;
			rd_uart<=1;
		end
		SENDING: begin
			rd_uart<=0;
			sendSignal<=1;
			if (dataSent) current_state <= WAITING;		
		end
	endcase
	
end

endmodule
