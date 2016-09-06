`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:27:30 05/14/2016 
// Design Name: 
// Module Name:    Memoria 
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
module Memoria(
				input clka,
				input clkEnable,
				input wea,
				input reset,
				input [3:0] addra,
				input [31:0] dina,
				output wire [31:0] douta,
				output wire [319:0] memorias);

parameter DATA_WIDTH = 32;
parameter MEM_WIDTH = 4;
  
reg [MEM_WIDTH-1:0] read_address;
integer i;
wire writeClk;
 
//memory declarations
reg [DATA_WIDTH - 1:0] memoria[0:(2**MEM_WIDTH - 1)];
  
//write logic
always@(addra  or reset) begin
	if (reset) begin
		read_address = 0;
	end
	else begin
		read_address = addra;
	end
end
 
always@(posedge writeClk) begin
	 if(wea & ~reset) begin
		  memoria[addra] <= dina;
	 end
	 if (reset)
		for (i = 0; i < (2**MEM_WIDTH); i = i +1) begin
			memoria[i] <= 0;
		end
end

assign douta = memoria[read_address];
assign memorias = {memoria[0],memoria[1], memoria[2], memoria[3], memoria[4],
							memoria[5], memoria[6], memoria[7],memoria[8], memoria[9]};

assign writeClk = clka & clkEnable;  
endmodule