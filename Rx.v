`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:25 10/30/2013 
// Design Name: 
// Module Name:    Rx 
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
module Rx(
    input rx,
	 input clock,
    input reset,
	 input s_tick,
    output wire [7:0] dout,
    output reg rx_done_tick
    );

//Declaracion de estados
localparam [1:0] idle = 2'b00,
					  start = 2'b01,
					  data = 2'b10,
					  stop = 2'b11;
					  
//Declaracion de senales
reg [1:0] state_reg, state_next;	//Estado actual y siguiente estado
reg [3:0] s_reg, s_next;	//Contador de ticks -  Sample ticks
reg [2:0] n_reg, n_next;	//Cantidad de bits recibidos
reg [7:0] b_reg, b_next;	//Registro que contiene el resultado


always @(posedge clock)
if(reset)
	begin
	state_reg <= idle;
	s_reg <= 0;
	n_reg <= 0;
	b_reg <= 0;
	end
else
	begin
	state_reg <= state_next;
	s_reg <= s_next;
	n_reg <= n_next;
	b_reg <= b_next;
	end
	
//Maquina de estados
always @*
	begin
	state_next = state_reg;
	rx_done_tick = 1'b0;
	s_next = s_reg;
	n_next = n_reg;
	b_next = b_reg;
	case (state_reg)
		idle:
		if(~rx)
			begin
			state_next = start;
			s_next = 0;
			end
		start:
		if(s_tick)
			if(s_reg==7)
				begin
					state_next=data;
					s_next=0;
					n_next=0;
				end
			else
				s_next = s_reg + 1'b1;
		data:
		if(s_tick)
			if(s_reg==15)
				begin
					s_next=0;
					b_next = {rx, b_reg[7:1]};
					if(n_reg==7)
						state_next=stop;
					else
						n_next=n_reg + 1'b1;
				end
			else
				s_next=s_reg + 1'b1;
		stop:
		if(s_tick)
			if(s_reg==15)
				begin
					state_next=idle;
					rx_done_tick=1'b1;
				end
			else
			s_next=s_reg + 1'b1;
		endcase
		end
		
		assign dout = b_reg;
endmodule
