`timescale 1ns / 1ps


module DebuggerTx(
		input clk, 
		input reset,
		input sendSignal,
		input [frameSize-1:0] sendData,
		input tx_busy,
		output reg wr_uart,
		output reg dataSent,
		output reg [7:0] w_data,
		output reg [1:0] state_reg_tx
    );

//localparam frameSize = 1408; //176 bytes, 1 de relleno. Anda pero sin memorai ram
localparam frameSize = 1728; //214 bytes, 1 de relleno
	 
localparam [1:0]
		idle 			= 2'b01,
		lastByte 	= 2'b10,
		closing 		= 2'b11,
		sending		= 2'b00;
		
		reg [1:0] state_next;
		reg [10:0] aux_reg, aux_next;
		//reg [1759:0] aux_data;
		reg dataSent_next;
		//reg block_data, block_data_next;
		reg [7:0] contBytes;
		reg [7:0] contBytes_next;

always @(posedge clk, posedge reset)
		if (reset) begin
			state_reg_tx		= idle;
			aux_reg			= frameSize-1;
			dataSent			= 1'b1;
			//aux_data 		= sendData;
			//block_data 		= 1'b0;
			contBytes		= 8'b0;
		end
		else begin
			state_reg_tx		= state_next;
			aux_reg 			= aux_next;
			dataSent			= dataSent_next;
			//block_data		= block_data_next;
			//aux_data			= (block_data) ? aux_data: sendData;
			contBytes		= contBytes_next;
			
		end
		
always @(*) 
		begin
			state_next 		= state_reg_tx;
			aux_next 		= aux_reg;
			wr_uart		 	= 1'b0 ;
			dataSent_next 	= dataSent;
			contBytes_next	= contBytes;
			//block_data_next= block_data;
			case (state_reg_tx)
				idle:
					begin
						//block_data_next= 1'b0;
						dataSent_next 	= 1'b1;
						wr_uart		 	= 1'b0;
						w_data			= 8'b0;
						state_next		= (sendSignal) ?  sending : idle;
					end
				sending: 
					begin
						if(~tx_busy)
							begin
								if(aux_reg == 7) 
									state_next	= lastByte; 
								else
								begin
									dataSent_next	= 1'b0;
									wr_uart			= 1'b1; 					//Habilito la escritura en el IC del Tx de la UART
									//block_data_next= 1'b1;
									w_data 			=	{sendData[aux_reg],
															sendData[aux_reg-1],
															sendData[aux_reg-2],
															sendData[aux_reg-3],
															sendData[aux_reg-4],
															sendData[aux_reg-5],
															sendData[aux_reg-6],
															sendData[aux_reg-7]};
									aux_next 		= aux_reg -4'h8;
									state_next		= ( aux_next < 8 ) ?  lastByte : sending;
									contBytes		= contBytes +1'b1;
								end
							end
						else 
							begin
								dataSent_next	= 1'b0;
								wr_uart			= 1'b0; 					//Habilito la escritura en el IC del Tx de la UART
								//block_data_next= 1'b1;
								state_next 		= sending;
							end
					end
				lastByte:
					begin
						dataSent_next	= 1'b0;
						wr_uart			= 1; 					//Habilito la escritura en el IC del Tx de la UART
						//block_data_next= 1'b1;
					
//						w_data			=sendData[aux_reg*8 +:8];
						w_data 			= {	sendData[aux_reg],
													sendData[aux_reg-1],
													sendData[aux_reg-2],
													sendData[aux_reg-3],
													sendData[aux_reg-4],
													sendData[aux_reg-5],
													sendData[aux_reg-6],
													sendData[aux_reg-7]};
													
						state_next 		= closing;
						contBytes		= contBytes +1'b1;
					end		
				closing:
					begin
						//block_data_next	= 1'b0;
						w_data 				= 8'b0;
						dataSent_next 		= 1'b1;
						aux_next				= frameSize-1;
						wr_uart	 			= 1'b0;
						state_next 			= idle;
						contBytes			= 8'b0;
					end
			endcase
		end		
endmodule
