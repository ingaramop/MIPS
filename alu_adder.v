`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:51:32 11/16/2015 
// Design Name: 
// Module Name:    alu_adder 
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
module AluAdder(
	 input [9:0] PC,  		// PC + 4
	 input [9:0] signExtend,		// sign extend
    output [9:0] addResult	// Salida de la operacion de la suma
	 );
	assign addResult = PC + signExtend;		
endmodule
