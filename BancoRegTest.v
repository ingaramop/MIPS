`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:38:21 04/12/2016
// Design Name:   bancoDeRegistros
// Module Name:   E:/ID funca/Intruction-Decode/Intruction-Decode/BancoRegTest.v
// Project Name:  Intruction-Decode
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bancoDeRegistros
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BancoRegTest;

parameter DATA_WIDTH = 32;
parameter ADDRESS_WIDTH = 5;
 
reg clk, writeEn;
reg [ADDRESS_WIDTH-1:0] readAddress1, readAddress2, writeAddress;
wire [DATA_WIDTH-1:0] readData1, readData2;
reg [DATA_WIDTH-1:0] writeData;
reg reset;
  
bancoDeRegistros banco_instance(
			.we(writeEn),
			.addressA(readAddress1),
			.addressB(readAddress2),
			.addressW(writeAddress),
			.clk(clk),							
			.data(writeData),
			.reset(reset),
			.regA(readData1),
			.regB(readData2)
			);
			
initial begin
    clk = 0;
    forever #100 clk = ~clk;
end
 
initial begin
	reset = 1;
	//reset = 0;
	readAddress1 = 5'b00010;
	readAddress2 = 5'b00011;
	writeAddress = 5'b00010;
	writeData = 32'b1111;
	writeEn = 1'b1;

	#200 writeEn = 1'b0;
	reset =0;
	writeAddress = 5'b00010;
	writeData = 32'b1000;
	writeEn = 1'b1;

	#200 writeEn = 1'b0;

	#200 writeEn = 1'b1;
	writeAddress = 5'b00011;
	writeData = 32'b0101;

	#200 writeEn = 1'b0;
	writeAddress = 5'b00000;
	writeData = 32'b0;
end
endmodule