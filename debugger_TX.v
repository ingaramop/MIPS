`timescale 1ns / 1ps


module DebuggerTx(
		input clk, 
		input reset,
		input sendSignal,
		input [1759:0] sendData,
		input tx_busy,
		output reg wr_uart,
		output reg dataSent,
		output reg [7:0] w_data
    );

localparam frameSize = 1760;
	 
localparam [1:0]
		idle 			= 2'b01,
		firstByte 	= 2'b10,
		closing 		= 2'b11,
		sending		= 2'b00;
		
		reg [1:0] state_reg, state_next;
		reg [10:0] aux_reg, aux_next;
		reg [1759:0] aux_data;
		reg dataSent_next;
		reg block_data, block_data_next;
		reg [7:0] contBytes;
		reg [7:0] contBytes_next;

always @(posedge clk, posedge reset)
		if (reset) begin
			state_reg 		= idle;
			aux_reg			= frameSize-1;
			dataSent			= 1'b1;
			aux_data 		= sendData;
			block_data 		= 1'b0;
			contBytes		= 8'b0;
		end
		else begin
			state_reg 		= state_next;
			aux_reg 			= aux_next;
			dataSent			= dataSent_next;
			block_data		= block_data_next;
			aux_data			= (block_data) ? aux_data: sendData;
			contBytes		= contBytes_next;
			
		end
		
always @(*) 
		begin
			state_next 		= state_reg;
			aux_next 		= aux_reg;
			wr_uart		 	= 1'b0 ;
			dataSent_next 	= dataSent;
			contBytes_next	= contBytes;
			block_data_next= block_data;
			case (state_reg)
				idle:
					begin
						block_data_next= 1'b0;
						dataSent_next 	= 1'b0;
						wr_uart		 	= 1'b0 ;
						w_data			= 8'b0;
						state_next		= (sendSignal) ?  sending : state_reg;
					end
				firstByte:
					begin
						dataSent_next	= 1'b0;
						wr_uart			= 1; 					//Habilito la escritura en el IC del Tx de la UART
						block_data_next= 1'b1;
						//Empiezo a enviar los datos de byte en byte
					
//						w_data			=sendData[aux_reg*8 +:8];
						w_data 			= {	aux_data[aux_reg],
													aux_data[aux_reg-1],
													aux_data[aux_reg-2],
													aux_data[aux_reg-3],
													aux_data[aux_reg-4],
													aux_data[aux_reg-5],
													aux_data[aux_reg-6],
													aux_data[aux_reg-7]};
													
						state_next 		= sending;
						contBytes		= contBytes +1'b1;
					end
				sending: 
					begin
						if(~tx_busy)
							begin
								dataSent_next	= 1'b0;
								wr_uart			= 1'b1; 					//Habilito la escritura en el IC del Tx de la UART
								block_data_next= 1'b1;
								aux_next 		= aux_reg -4'h8;
								w_data 			=	{aux_data[aux_next],
														aux_data[aux_next-1],
														aux_data[aux_next-2],
														aux_data[aux_next-3],
														aux_data[aux_next-4],
														aux_data[aux_next-5],
														aux_data[aux_next-6],
														aux_data[aux_next-7]};
								state_next		= ( aux_reg < 8 ) ?  closing : sending;
								contBytes		= contBytes +1'b1;
							end
						else
							begin
								dataSent_next	= 1'b0;
								wr_uart			= 1'b0; 					//Habilito la escritura en el IC del Tx de la UART
								block_data_next= 1'b1;
								state_next 		= sending;
							end
					end	
				closing:
					begin
						block_data_next	= 1'b0;
						w_data				= 8'b0;
						dataSent_next 		= 1'b1;
						aux_next				= frameSize-1;
						wr_uart	 			= 1'b0;
						state_next 			= idle;
						contBytes			= 8'b0;
					end
			endcase
		end		
endmodule

